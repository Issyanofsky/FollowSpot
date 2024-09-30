FROM  python:3.8-slim
MAINTAINER Issy Yanofsky 

WORKDIR /app

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt                                  

EXPOSE 5000 5432 5433
RUN ls -alh
RUN python3 ./seed.py

CMD [ "python", "server.py" ]
