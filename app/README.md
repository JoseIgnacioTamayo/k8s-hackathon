# Example WebApp

With https://github.com/kodekloudhub/webapp-color/blob/master/app.py as basis, this is a Flask WebApp intended to be customized in K8S:

  * Use arguments or EnvVars to set the color of the WebPage (arguments take precedence)
    * Defaults to BLACK
  * Optionally, use TLS for HTTPS
    * Use arguments or EnvVars to point to TLS Cert and Key for HTTPS
  * Either HTTP or HTTPS liste on TCP 8080

## How to

Run the app locally:

```bash
virtualenv --clear .venv
source ./.venv/bin/activate
pip3 install -r ./requirements.txt
python3 ./app.py [--color COLOR]
# Optionally create TLS Certs and use HTTPS
openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 30
python3 ./app.py [--color COLOR] --use_tls --cert cert.pem --key key.pem
```

Test the app locally

```bash
curl http://localhost:8080/
curl http://localhost:8080/echo?msg=Hello -X POST
# Optionally use HTTPS
curl -k https://localhost:8080/
curl -k https://localhost:8080/echo?msg=ThisIsAs3cr3t -X POST
```

## TODO

Maybe this will be cool in Go, with https://echo.labstack.com/docs/templates and https://pkg.go.dev/github.com/jessevdk/go-assets#section-readme and 

# Source

https://github.com/kodekloudhub/webapp-color/blob/master/app.py

