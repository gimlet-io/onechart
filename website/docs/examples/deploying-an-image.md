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

helm template my-release onechart/onechart -f values.yaml
```
