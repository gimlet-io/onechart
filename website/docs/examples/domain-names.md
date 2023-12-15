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

helm template my-release oci://ghcr.io/gimlet-io/onechart --version 0.62.0 -f values.yaml
```

!!! warning
    The Nginx ingress controller must be set up in your cluster for this setting to work.

## HTTPS

To reference a TLS secret use the `tlsEnabled` field. The deployment will point to a secret named: `tls-$.Release.Name`

```bash
cat << EOF > values.yaml
image:
  repository: nginx
  tag: 1.19.3

ingress:
  annotations:
    kubernetes.io/ingress.class: nginx
  host: my-release.mycompany.com
  tlsEnabled: true
EOF

helm template my-release oci://ghcr.io/gimlet-io/onechart --version 0.62.0 -f values.yaml
```
