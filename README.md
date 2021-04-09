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

## Development

Development of OneChart does not differ from developing a regular Helm chart.

The source for OneChart is under `charts/onechart` where you can locate the `Chart.yaml`, `values.yaml` and the templates.

We write unit tests for our helm charts. Pull requests are only accepted with proper test coverage.

The tests are located under `charts/onechart/test` and use the https://github.com/DataDog/helm-unittest.git Helm plugin to run the tests.

For installation, refer to the CI workflow at `.github/workflows/build.yaml`
TODO: move it to the Makefile

## Release

`make all` to test and package the Helm chart.
The chart archives are put under `docs/` together with the Helm repository manifest (index.yaml)
It is then served with Github Pages on https://chart.onechart.dev
