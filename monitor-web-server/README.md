# Website Availability Monitor

This Python script monitors the availability of one or more websites by periodically checking their health endpoints. It writes the availability status to an InfluxDB database for further analysis and visualization.

## Features

- Checks the availability of one or more websites at regular intervals.
- Configurable number of retries before considering a check as failed.
- Verifies internet connectivity before initiating website health checks.
- Writes website availability status to an InfluxDB database.

## Prerequisites

- Visual Studio Code with the Remote - Containers extension installed.
- Docker installed on your system.

## Getting Started
1. Clone this repository
2. Open the project in Visual Studio Code.

3. When prompted, reopen the project in a container using the provided `.devcontainer` configuration.

4. Install required Python packages by running the following command in the terminal:

    ```bash
    pip install -r requirements.txt
    ```

5. Copy the `example.env` file to a `.env` the relevant environment variables - your InfluxDB connection parameters and the websites you want to monitor.
6. Load variables in bash `. .env`
7. Install webmonitor as a package:
    ```bash
    pip install -e .
    ```
8. Run the script:
    ```bash
    python webmonitor/app.py
    ```


## Configuration

All the required configuration is done through the definition of environment variables, which can be consulted in `example.env`.


## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [](..\LICENSE).
