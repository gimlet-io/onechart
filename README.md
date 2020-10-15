# One chart to rule them all

A generic Helm chart for your application deployments.

Because no-one can remember the Kubernetes yaml syntax.

https://onechart.dev/

## Getting started

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
