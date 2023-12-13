OneChart settings for deploying the Nginx image:

```yaml
image:
  repository: nginx
  tag: 1.19.3
```

Check the Kubernetes manifest:

```bash
cat << EOF > values.yaml
image:
  repository: nginx
  tag: 1.19.3
EOF

helm template my-release oci://ghcr.io/gimlet-io/onechart --version 0.65.0-rc.1 -f values.yaml
```
