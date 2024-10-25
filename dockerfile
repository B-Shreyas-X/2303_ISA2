FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y python3 python3-pip python3-flask git
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/app

RUN git clone https://github.com/B-Shreyas-X/2303_ISA2 /opt/app

WORKDIR /opt/app

ENV FLASK_APP=/opt/app/application.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
