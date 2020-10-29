FROM debian:latest as builder

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN wget https://raw.githubusercontent.com/wangyu-/UDPping/master/udpping.py


FROM python:3.9-slim as runner
COPY --from=builder /app/udpping.py /usr/local/bin

ENTRYPOINT ["python3", "/usr/local/bin/udpping.py"]
