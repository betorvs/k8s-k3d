# grafana cloud 

## agent deploy

```
. .env
cat * | envsubst | kubectl apply -f -
```

### Config env file

Important format in remote or endpoints configurations:
- In `YOUR_LOKI_REMOTE_WRITE_URL="https://SOMETHING-LOKI.grafana.net/loki/api/v1/push"`
- In `YOUR_PROMETHEUS_REMOTE_WRITE_URL="https://SOMETHING-PROMETHEUS.grafana.net/api/prom/push"`
- In `YOUR_TEMPO_ENDPOINT="SOMETHING-TEMPO.grafana.net:443"`

```
export NAMESPACE=default
export YOUR_CLUSTER_NAME="local0"
export YOUR_LOKI_REMOTE_WRITE_URL=""
export YOUR_LOKI_USERNAME=""
export YOUR_LOKI_PASSWORD=""
export YOUR_PROMETHEUS_REMOTE_WRITE_URL=""
export YOUR_PROMETHEUS_REMOTE_WRITE_USERNAME=""
export YOUR_PROMETHEUS_REMOTE_WRITE_PASSWORD=""
export YOUR_TEMPO_ENDPOINT=""
export YOUR_TEMPO_USER=""
export YOUR_TEMPO_PASSWORD=""
```

### Config application annotation

```yaml
metadata:
  annotations:
    prometheus.io/should_be_scraped = true
    prometheus.io/metric_path = "/debug/metrics"
    prometheus.io/scrape_port = "9360"
```

## agent delete

```
cat * | envsubst | kubectl delete -f -
```


## References

[Grafana Agent repository](https://github.com/grafana/agent/tree/main/production/kubernetes)