This page shows how you can add a `PrometheusRule` to your app deployment.

!!! Note
    This is a feature only supported by the [kube-stack-prometheus stack (formerly known as the Prometheus Operator)](https://github.com/prometheus-operator/kube-prometheus)
    
The following Prometheus rule alerts if a pod is crashlooping:

```yaml
image:
  repository: nginx
  tag: 1.19.3

prometheusRules:
  - name: KubePodCrashLooping
    message: "Pod {{`{{`}} $labels.namespace {{`}}`}}/{{`{{`}} $labels.pod {{`}}`}} ({{`{{`}} $labels.container {{`}}`}}) is restarting {{`{{`}} printf \"%.2f\" $value {{`}}`}} times / 5 minutes."
    runBookURL: myrunbook.com
    expression: "rate(kube_pod_container_status_restarts_total{job=\"kube-state-metrics\", namespace=~\"{{ $targetNamespace }}\"}[15m]) * 60 * 5 > 0"
    for: 1h
    labels:
      severity: critical
```

Check the Kubernetes manifest:

```bash
helm template my-release oci://ghcr.io/gimlet-io/onechart --version 0.62.0 -f values.yaml
```
