FROM python:3.6-alpine

RUN adduser -D microcmp

WORKDIR /home/microcmp

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn pymysql

COPY app app
COPY migrations migrations
COPY microcmp.py config.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP microcmp.py

RUN chown -R microcmp:microcmp ./
USER microcmp

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
