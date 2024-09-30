FROM  python:3.8-slim

WORKDIR /app

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt                                  

ENV POSTGRES_USER=dbuser
ENV POSTGRES_PASSWORD=a1a1a1
ENV POSTGRES_DB=DB

EXPOSE 5000 5432 5433

CMD [ "python", "server.py" ]
