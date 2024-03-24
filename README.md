# InfluxDB Getting Started
[![Website Monitor - Publish Docker Image](https://github.com/ninja-asa/influxdb-getting-started/actions/workflows/publish-website-monitor-docker-image.yml/badge.svg)](https://github.com/ninja-asa/influxdb-getting-started/actions/workflows/publish-website-monitor-docker-image.yml)

This repository contains a Docker Compose setup to quickly get started with InfluxDB 2 and Telegraf for monitoring internet speed and memory usage.

## Prerequisites

Make sure you have Docker and Docker Compose installed on your system.

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

1. Clone this repository.
2. Create an `.env` file based on the provided `example.env`:

    ```bash
    cp example.env influxv2.env
    ```

3. Modify the `influxv2.env` file to set your desired configuration.

4. Start the services using Docker Compose:

    ```bash
    docker-compose up -d
    ```

## Configuration

- `influxdb2`: This service sets up InfluxDB 2 with persistent data storage and configuration.
- `telegraf`: Telegraf is configured to collect internet speed and memory usage metrics and send them to InfluxDB.

## Usage

- Access InfluxDB 2 UI by visiting `http://localhost:8086` in your web browser.
- Access Telegraf configurations in `./telegraf/telegraf.conf` for any customizations.
- View collected metrics in InfluxDB using queries or explore them in the UI.
- Modify the `telegraf.conf` file as per your requirements for additional data collection.

## Contributing

This is simply a playground for me to experiment so I don't really expect any external contributions. Nevertheless, if you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [GNU General Public License Version 2](LICENSE).

## Motivation

The goal of this repository is for me to get familiar with the Influx Data Platform, given its optimization towards time series data. I was facing with two needs:
- wished to monitor the quality of my internet speed at home
- wished to monitor uptime of web applications and trigger alerts under certain conditions.

Therefore, throughout this process, I had the following goals:
- I will be setting up from scratch an instance of influx DB
- I will be understanding general good practices when structuring data into Influx DB
- I will be experimenting different data ingest methods into influx DB
- I will be building dashboards
- I will be doing this, so the setup is easily reproducible in any other host device
- I will be looking into how to back-up and restore the data and other configurations done (particularly dashboards)

## Challenges and Resolutions
1. **Not using the credentials I was using for my admin user**: to investigate this, I used Docker Desktop to inspect the container and checking the value of the environment variables I was setting in Docker Compose. Realised that my `${USERNAME}` was actually pointing to my Windows User Name, rather than my `.env` `USERNAME`. Decided to simply change the environment variable to be unique `MYUSERNAME`.
2. **Cannot create new bucket because organization cannot be found**: tried to create via InfluxDB UI a new bucket to add the Demo data, which was failing. Used Influx CLI `influx bucket create -n Demo -o <MYORGNAME> -r 0 -t <token>` and it just worked. Afterwards, attempted again through InfluxDB UI to create a bucket and it worked.
3. **InfluxDB cannot start**: the container would stop immediately. Needed a second pair of eyes, but I could find in logs that the password did not fulfill requirements - to test, was just using a 2 character password.
