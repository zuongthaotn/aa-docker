FROM python:3.12

RUN apt-get update && apt-get install -y nano

WORKDIR /algo_analytics

COPY requirements.txt .

RUN pip install -r requirements.txt

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--ServerApp.token=''"]