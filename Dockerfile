FROM ubuntu:20.04

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv postgresql postgresql-contrib curl sudo
RUN service postgresql start && sudo -u postgres psql -c "CREATE USER 'dbuser' WITH PASSWORD 'a1a1a1';" && sudo -u postgres psql -c "CREATE DATABASE 'DB' OWNER 'dbuser';"

WORKDIR /app

COPY . .
RUN python3 -m venv venv && ./venv/bin/pip install --no-cache-dir -r requirements.txt                                  

RUN python3 seed.py

ENV POSTGRES_USER=dbuser
ENV POSTGRES_PASSWORD=a1a1a1
ENV POSTGRES_DB=DB

EXPOSE 5000 5432 5433

CMD [ "python", "server.py" ]
