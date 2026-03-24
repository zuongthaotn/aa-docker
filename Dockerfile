FROM python:3.12

RUN apt-get update && apt-get install -y nano

WORKDIR /algo_analytics

COPY src/requirements.txt .

RUN pip install -r requirements.txt
