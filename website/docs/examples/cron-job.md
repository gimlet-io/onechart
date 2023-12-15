OneChart settings for deploying a cron job:

```yaml
image:
  repository: debian
  tag: stable-slim

schedule: "0 1 0 0 0"
command: |
  echo "hello"
```

Check the Kubernetes manifest:

```bash
cat << EOF > values.yaml
image:
  repository: debian
  tag: stable-slim

schedule: "*/1 * * * *"
command: |
  echo "hello"
EOF

helm template my-release oci://ghcr.io/gimlet-io/cron-job --version 0.62.0
```

!!! warning
    Make sure to use the `onechart/cron-job` chart.
