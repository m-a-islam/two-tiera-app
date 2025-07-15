FROM python:3.9-slim

# set working directory
WORKDIR /app

#install required packages
RUN apt-get update \
    && apt-get upgrade -y\
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# copy requirements file
COPY requirements.txt .

# install python dependencies
RUN pip install mysqlclient \
    && pip install --no-cache-dir -r requirements.txt

# copy the rest of the application code
COPY . .

# Specify the command to run the application
CMD ["python", "app.py"]
