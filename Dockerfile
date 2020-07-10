# Dockerfile - this is a comment. Delete me if you want.
# FROM python:3.8
# FROM clearlinux/tesseract-ocr
FROM ubuntu:18.04
# RUN apt-get install -y -f tesseract-ocr tesseract-ocr-por
# RUN apt-get install -y -f python-dev python3-dev build-essential liblcms1-dev zlib1g-dev libtiff4-dev libfreetype6-dev libwebp-dev

RUN apt-get update \
    && apt-get install tesseract-ocr -y \
    tesseract-ocr-por \
    python3.8 \
    #python-setuptools \
    python3-pip \
    python3-venv \
    && apt-get clean \
    && apt-get autoremove

# RUN apt-get install python3.8
# RUN python3.8 -m venv ocr_app
# RUN source ocr_app/bin/activate


COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["/app/app.py"]