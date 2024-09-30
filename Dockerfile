FROM python:3

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requierments.txt

ENV POSTGRES_USER=
ENV POSTGRES_PASSWORD=
ENV POSTGRES_DB=

EXPOSE 5000

CMD [ "python", "server.py" ]