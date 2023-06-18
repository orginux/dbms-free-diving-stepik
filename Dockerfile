FROM postgres:15.3
RUN apt update && apt-get install -y \
    libpq-dev \
    python3-pip \
    && pip3 install psycopg2
