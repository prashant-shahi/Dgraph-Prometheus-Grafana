#!/bin/sh

PROMETHEUS_VERSION="2.11.1"
GRAFANA_VERSION="6.2.5"

if [ -e configurations.json ]
then
    CONFIGURATION=$(cat ./configurations.json)
    JOB=$(echo $CONFIGURATION | python -c 'import sys, json; print json.load(sys.stdin)["job_name"]')
    METRICS_PATH=$(echo $CONFIGURATION | python -c 'import sys, json; print json.load(sys.stdin)["metrics_path"]')
    SCRAPE_INTERVAL=$(echo $CONFIGURATION | python -c 'import sys, json; print json.load(sys.stdin)["scrape_interval"]')
    ENDPOINTS=$(echo $CONFIGURATION | python -c 'import sys, json; endpoints=json.load(sys.stdin)["endpoints"]; print([x.encode("utf-8") for x in endpoints])')
else
    JOB=dgraph
    METRICS_PATH="/debug/prometheus_metrics"
    SCRAPE_INTERVAL="2s"
    ENDPOINTS="["localhost:6080","localhost:8080"]"
fi

echo "# my global config
global:
  scrape_interval:     15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).

# A scrape configuration containing exactly one endpoint to scrape:
scrape_configs:
">prometheus.yml

echo "
  # The job name is set to Dgraph.
  - job_name: $JOB
">>prometheus.yml

echo "
    # The metrics_path is set to '/debug/prometheus_metrics' than the default '/metrics'.
    metrics_path: $METRICS_PATH
">>prometheus.yml

echo "
    # Scraping interval is set to 2 seconds.
    scrape_interval: $SCRAPE_INTERVAL
">>prometheus.yml

echo "
    static_configs:
    - targets: $ENDPOINTS
">>prometheus.yml

sudo mv prometheus.yml /opt/prometheus-$PROMETHEUS_VERSION.linux-amd64/
