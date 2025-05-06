FROM python:3.11-alpine

RUN pip install flask mysql-connector-python

COPY . /opt/

EXPOSE 8080

WORKDIR /opt

ENTRYPOINT ["python3", "app.py"]