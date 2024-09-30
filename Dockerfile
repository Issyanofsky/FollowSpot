FROM python:2

WORKDIR /app

COPY . .
                                  
RUN pip install --no-cache-dir -r ./requirements.txt

ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=a1a1a1
ENV POSTGRES_DB=DB

EXPOSE 5000

CMD [ "python", "server.py" ]
