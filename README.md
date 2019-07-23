# Dgraph Prometheus

Follow the steps below to setup prometheus for your Dgraph cluster :

- Clone this repository and change the directory.
```sh
git clone https://github.com/prashant-shahi/dgraph-prometheus.git

cd dgraph-prometheus
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