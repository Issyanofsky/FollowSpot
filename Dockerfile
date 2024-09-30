FROM python:3.8-slim

RUN apt-get update && apt-get install -y gcc libpq-dev postgresql postgresql-contrib && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .
                                  
RUN pip3 install --no-cache-dir -r ./requirements.txt
RUN ls -alh /var/run/postgresql/
RUN service postgresql start
RUN createdb followspot
RUN python3 seed.py

ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=a1a1a1
ENV POSTGRES_DB=DB

EXPOSE 5000 5432 5433

CMD [ "python", "server.py" ]
