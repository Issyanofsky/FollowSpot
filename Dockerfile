FROM  python:3.8-slim

WORKDIR /app

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt                                  

EXPOSE 5000 5432 5433

CMD [ "python", "server.py" ]
