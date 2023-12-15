OneChart settings for setting environment variables:

```yaml
image:
  repository: nginx
  tag: 1.19.3

vars:
  VAR_1: "value 1"
  VAR_2: "value 2"
```

Check the Kubernetes manifest:

```bash
cat << EOF > values.yaml
image:
  repository: nginx
  tag: 1.19.3


EOF

helm template my-release oci://ghcr.io/gimlet-io/onechart --version 0.62.0 -f values.yaml
```

!!! note

    OneChart creates a `ConfigMap` with all the defined environment variables.

    Then includes all entries with the `EnvFrom` field in the deployment.
