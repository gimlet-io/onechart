
Check the generated Kubernetes yaml:

```bash
helm template my-release oci://ghcr.io/gimlet-io/onechart \
  --set image.repository=nginx \
  --set image.tag=1.19.3
```

Deploy with Helm:

```bash
helm install my-release oci://ghcr.io/gimlet-io/onechart \
  --set image.repository=nginx \
  --set image.tag=1.19.3
```

See all [Examples](/examples/deploying-an-image)
