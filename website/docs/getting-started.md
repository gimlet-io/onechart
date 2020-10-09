
Add the OneChart Helm repository:

```bash
helm repo add onechart https://chart.onechart.dev
```

Check the generated Kubernetes yaml:

```bash
helm template my-release onechart/onechart \
  --set image.repository=nginx \
  --set image.tag=1.19.3
```

Deploy with Helm:

```bash
helm install my-release onechart/onechart \
  --set image.repository=nginx \
  --set image.tag=1.19.3
```

See all [Examples](/examples/deploying-an-image)
