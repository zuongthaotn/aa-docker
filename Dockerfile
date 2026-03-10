FROM python:3.12

RUN apt-get update && apt-get install -y nano git

WORKDIR /algo_analytics

RUN mkdir tmp

COPY src/ai-chungkhoan/requirements.txt tmp/requirements_ai.txt
COPY src/phantich-chungkhoan/requirements.txt tmp/requirements_an.txt
COPY src/vn-stock-data/requirements.txt tmp/requirements_da.txt

RUN pip install -r tmp/requirements_ai.txt
RUN pip install -r tmp/requirements_an.txt
RUN pip install -r tmp/requirements_da.txt

RUN rm -rf tmp

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--ServerApp.token=''"]