# Dgraph-Prometheus-Grafana

Instructions to setup Prometheus and Grafana for a Dgraph cluster.

## Installation

Follow the steps below to setup prometheus and grafana for your Dgraph cluster :

- Clone this repository and change the directory.
```sh
git clone https://github.com/prashant-shahi/dgraph-prometheus-grafana.git

cd dgraph-prometheus-grafana
```
- Open **configrations.json** in your favourite text editor and modify the file if required.
```sh
vim configrations.json
```
- Make `install.sh` file executable and run.
```sh
chmod +x install.sh

sudo ./install.sh
```

*Note:*
- *For Dgraph zero, 6080 is the default http endpoint exposing metrics.*
- *For Dgraph alpha, 8080 is the default http endpoint exposing metrics.*


## Running

Follow the steps below to run prometheus :

- Change current directory to prometheus directory.
```sh
cd /opt/prometheus*
```
- Verify that the correct configurations has been generated.
```sh
cat prometheus.yml
```
- Run prometheus.
```sh
./prometheus
```

Let's open another terminal and follow the steps below to run grafana :

- Change current directory to grafana directory.
```sh
cd /opt/grafana*
```
- Run grafana.
```sh
./bin/grafana-server
```
