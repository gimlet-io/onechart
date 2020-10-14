Since secrets demand a distinct workflow, OneChart will not generate a Kubernetes `Secret` object, but can reference one.

OneChart can reference an existing Kubernetes `Secret` and it includes all entries in the deployment with the `EnvFrom` field.

The secret name must match the release name. `my-release` in this example.

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

### Using encrypted secret values

OneChart can be used with [Bitnami's Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets), and it generates a `SealedSecret` resource that can be stored even in git.

```yaml
image:
  repository: nginx
  tag: 1.19.3

sealedSecrets:
  secret1: AgBy3i4OJSWK+PiTySYZZA9rO43cGDEq...
  secret2: ewogICJjcmVk...
```

Where you have to generate the encrypted values with [Sealed Secrets "raw" workflow](https://github.com/bitnami-labs/sealed-secrets#raw-mode-experimental):

```bash
echo -n my-secret-value | kubeseal \
  --raw \
  --from-file=/dev/stdin \
  --namespace bar \
  --name my-release
```
