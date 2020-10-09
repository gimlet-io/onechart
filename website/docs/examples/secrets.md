OneChart can reference an existing secret:

```yaml
image:
  repository: nginx
  tag: 1.19.3

secret:
  enabled: true
```

Check the Kubernetes manifest:

```bash
cat << EOF > values.yaml
image:
  repository: nginx
  tag: 1.19.3

secret:
  enabled: true
EOF

helm template my-release onechart/onechart -f values.yaml
```

!!! note

    OneChart references an existing Kubernetes `Secret` and includes all entries in the deployment with the `EnvFrom` field.
    
    The secret name must match the release name. `my-release` in the above example.
