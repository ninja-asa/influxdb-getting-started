# Specifying the base image
FROM python:3.10-buster

# Install system dependencies and pip
RUN apt-get update -y && apt-get install --no-install-recommends -y \
    python3-pip

RUN apt install nano -y

# Installing the requirements.txt
RUN pip install --upgrade pip

# Install local package and its requirements
COPY . /workspace
WORKDIR /workspace
RUN pip install .

# Set labels
LABEL org.opencontainers.image.source=https://github.com/ninja-asa/influxdb-getting-started/
LABEL org.opencontainers.image.description="Container which launches a recurrent web monitoring service and writes the results to an InfluxDB database."
LABEL org.opencontainers.image.licenses="GNU General Public License Version 2"
# Start the application
CMD ["python", "webmonitor/app.py"]
