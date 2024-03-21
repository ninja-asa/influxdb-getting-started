# influxdb-getting-started

# Start Influx DB using docker
1. Setup configuration is defined via environment variables in `.env`.
```bash
USERNAME=...
PASSWORD=...
ORGNAME=...
BUCKETNAME=...
```
2. Set password must fulfill the National Institute of Standards and Technology (NIST) standards for 2021. [InfluxDB Requirements]([dsad](https://docs.influxdata.com/influxdb/cloud/account-management/change-password/#password-requirements)). Otherwise, the service will fail to run.
2. When using docker we will be ensuring that data is persisted so data is not deleted.

## Use Docker Command
In the terminal, run:
```bash
docker run \
 --name influxdb2 \
 --publish 8086:8086 \
 --mount type=volume,source=influxdb2-data,target=/var/lib/influxdb2 \
 --mount type=volume,source=influxdb2-config,target=/etc/influxdb2 \
 --env DOCKER_INFLUXDB_INIT_MODE=setup \
 --env DOCKER_INFLUXDB_INIT_USERNAME=${USERNAME} \
 --env DOCKER_INFLUXDB_INIT_PASSWORD=${PASSWORD} \
 --env DOCKER_INFLUXDB_INIT_ORG=${ORGNAME} \
 --env DOCKER_INFLUXDB_INIT_BUCKET=${BUCKETNAME} \
 influxdb:2
 ```

## Use Docker Compose

Simply run `docker compose up -d`, and the container should stay up.

If the docker container successfuly starts, then you should be able to access `localhost:8086` to access Influx UI.

# User Management
1. Has to be performed via Influx CLI, not possible via UI