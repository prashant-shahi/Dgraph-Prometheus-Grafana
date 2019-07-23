#!/bin/sh

#// For Dgraph zero, 6080 is the default http endpoint exposing metrics.
#// For Dgraph alpha, 8080 is the default http endpoint exposing metrics.

if [ -e configurations.json ]
then
    CONFIGURATION=$(cat ./configurations.json)
    JOB=$(echo $CONFIGURATION | python -c 'import sys, json; print json.load(sys.stdin)["job_name"]')
    METRICS_PATH=$(echo $CONFIGURATION | python -c 'import sys, json; print json.load(sys.stdin)["metrics_path"]')
    SCRAPE_INTERVAL=$(echo $CONFIGURATION | python -c 'import sys, json; print json.load(sys.stdin)["scrape_interval"]')
    ENDPOINTS="$(echo $CONFIGURATION  | python -c 'import sys, json; print String(json.load(sys.stdin)["endpoints"])')"
else
  	JOB=dgraph
    ENDPOINT="/debug/prometheus_metrics"
    SCRAPE_INTERVAL="2sec"
    ENDPOINTS=["localhost:6080","localhost:8080"]
fi

echo "Job: $JOB"
echo "METRICS_PATH: $METRICS_PATH"
echo "SCRAPE_INTERVALL: $SCRAPE_INTERVAL"
echo "ENDPOINT: $ENDPOINT"

echo $CONFIGURATION  | python -c 'import sys, json; print json.load(sys.stdin)["endpoints"]'