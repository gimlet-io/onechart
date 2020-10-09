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

schedule: "0 1 0 0 0"
command: |
  echo "hello"
EOF

helm template my-release onechart/cron-job -f values.yaml
```

!!! warning
    Make sure to use the `onechart/cron-job` chart.
