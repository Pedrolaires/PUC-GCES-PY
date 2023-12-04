FROM python:3.8

WORKDIR /app

COPY src/ /app/src/

COPY requirements.txt /app/

RUN pip install --upgrade pip setuptools && \
    pip install -r requirements.txt

RUN "ls"

CMD ["python", "./src/src/main.py"]
