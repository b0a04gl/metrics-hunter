
# MetricsHunter

This Elixir application utilizes GenStage to scrape metrics from various sources and writes them to a time-series database. It offers a flexible and efficient solution for collecting and managing metric data.

## Features

- Metric Scraping: Easily configure and scrape metrics from different sources, including Actuator endpoints and custom data providers.

- GenStage Integration: Utilizes GenStage for concurrent and efficient data processing, ensuring optimal performance.

- Time-Series Database: Write collected metrics to a time-series database, making them accessible for analysis and visualization.

## Getting Started

1. **Prerequisites**: Ensure you have Elixir installed on your system.

2. **Installation**: Clone this repository and install the required dependencies using Mix:

   ```bash
   git clone https://github.com/b0a04gl/metrics-hunter.git
   cd metrics-hunter
   mix deps.get
   ```

3. **Configuration**: Configure the metric sources and database settings in the application.

4. **Usage**: Run the application to start scraping and storing metrics:

   ```bash
   mix run --no-halt
   ```

## Configuration

You can configure the metric sources, GenStage stages, and database settings in the application's configuration files.

- `config/config.exs`: Configure application-wide settings.
- `config/sources.exs`: Define metric sources and GenStage stages.
- `config/database.exs`: Specify database connection details.