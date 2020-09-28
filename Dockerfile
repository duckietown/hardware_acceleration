FROM python:3

RUN apt-get update && apt-get install -y --no-install-recommends \
    xvfb \
    freeglut3-dev \
    vim \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /home/hwacc

COPY . .

RUN ls

COPY requirements.txt ./

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

CMD [ "bash", "./launch.sh" ]
