FROM python:3.9.13-slim-bullseye

COPY start-notebook-as-html.sh requirements.txt index.html ./
RUN pip install --no-cache-dir -r requirements.txt

COPY notebooks notebooks
