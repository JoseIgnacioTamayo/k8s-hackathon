from flask import Flask
from flask import render_template
from flask import request
import socket
import os
import argparse

app = Flask(__name__)

color_codes = {
    "red": "#e74c3c",
    "green": "#16a085",
    "blue": "#2980b9",
    "pink": "#be2edd",
    "darkblue": "#130f40",
    "black": "#000000",
}

SUPPORTED_COLORS = ",".join(color_codes.keys())

# Get values from Environment variable
COLOR_FROM_ENV = os.environ.get('APP_COLOR')
CERT_FILE_FROM_ENV = os.environ.get('TLS_CERT')
KEY_FILE_FROM_ENV = os.environ.get('TLS_KEY')

COLOR = "black"
CERT_FILE = None
KEY_FILE = None

@app.route("/")
def hello():
    # return Hello page
    return render_template('hello.html', name=socket.gethostname(), color=color_codes[COLOR])

@app.route("/echo", methods=["POST"])
def echo():
    # return Echo message
    msg = request.args.get('msg','echo')
    return (msg+'...')*3

if __name__ == "__main__":

    # Check for Command Line Parameters for color
    parser = argparse.ArgumentParser()
    parser.add_argument('--color', required=False, help="Also $APP_COLOR")
    parser.add_argument('--cert', required=False, help="Also $TLS_CERT")
    parser.add_argument('--key', required=False, help="Also $TLS_KEY")
    parser.add_argument('--use_tls', action='store_true', default=False)
    args = parser.parse_args()

    if args.use_tls:
        if args.cert:
            CERT_FILE = args.cert
        elif CERT_FILE_FROM_ENV:
            CERT_FILE = CERT_FILE_FROM_ENV
        if args.key:
            KEY_FILE = args.key
        elif KEY_FILE_FROM_ENV:
            KEY_FILE = KEY_FILE_FROM_ENV
        if not CERT_FILE or not KEY_FILE:
            print("If using TLS, the Cert and Key files are needed")
            exit(1)
        if not os.path.exists(CERT_FILE):
            print(f"Cert file {CERT_FILE} not found")
            exit(1)
        if not os.path.exists(KEY_FILE):
            print(f"Key file {KEY_FILE} not found")
            exit(1)

    if args.color:
        COLOR = args.color
    elif COLOR_FROM_ENV:
        COLOR = COLOR_FROM_ENV
    
    # Check if input color is a supported one
    if COLOR not in color_codes:
        print("Color not supported. Received '" + COLOR + "' expected one of " + SUPPORTED_COLORS)
        exit(1)

    # Run Flask Application
    if args.use_tls:
        app.run(host="0.0.0.0", port=8080, ssl_context=(CERT_FILE, KEY_FILE))
    else:
        app.run(host="0.0.0.0", port=8080)