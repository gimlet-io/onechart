OneChart generates an `Ingress` resource for the Nginx ingress controller with the following settings:

```yaml
image:
  repository: nginx
  tag: 1.19.3

ingress:
  annotations:
    kubernetes.io/ingress.class: nginx
  host: chart-example.local
```

Check the Kubernetes manifest:

```bash
cat << EOF > values.yaml
image:
  repository: nginx
  tag: 1.19.3

ingress:
  annotations:
    kubernetes.io/ingress.class: nginx
  host: my-release.mycompany.com
EOF

helm template my-release onechart/onechart -f values.yaml
```

!!! warning
    The Nginx ingress controller must be set up in your cluster for this setting to work.
