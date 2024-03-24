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

# Start the application
CMD ["python", "webmonitor/app.py"]
