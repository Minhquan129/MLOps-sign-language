FROM python:3.10-slim

WORKDIR .

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get update && apt-get install libgl1
RUN pip install numpy==1.24.1

COPY . .

EXPOSE 30000

CMD ["uvicorn", "app:app", "--port", "30000"]