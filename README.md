# One chart to rule them all

A generic Helm chart for your application deployments.

Because no-one can remember the Kubernetes yaml syntax.

https://gimlet.io/docs/onechart-reference

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

See all [Examples](/website/docs/examples/)

## Contribution Guidelines

Thank you for your interest in contributing to the Gimlet project.

Below are some guidelines and best practices for contributing to this repository:

### Issues

If you are running a fork of OneChart and would like to upstream a feature, please open a pull request for it.

### New Features

If you are planning to add a new feature to OneChart, please open an issue for it first. Helm charts are prone to having too many features, and OneChart want to keep the supported use-cases in-check. Proposed features have to be generally applicable, targeting newcomers to the Kubernetes ecosystem.

### Pull Request Process

* Fork the repository.
* Create a new branch and make your changes.
* Open a pull request with detailed commit message and reference issue number if applicable.
* A maintainer will review your pull request, and help you throughout the process.

## Development

Development of OneChart does not differ from developing a regular Helm chart.

The source for OneChart is under `charts/onechart` where you can locate the `Chart.yaml`, `values.yaml` and the templates.

We write unit tests for our helm charts. Pull requests are only accepted with proper test coverage.

The tests are located under `charts/onechart/test` and use the https://github.com/DataDog/helm-unittest.git Helm plugin to run the tests.

For installation, refer to the CI workflow at `.github/workflows/build.yaml`.

## Release process

`make all` to test and package the Helm chart.
The chart archives are put under `docs/` together with the Helm repository manifest (index.yaml)
It is then served with Github Pages on https://chart.onechart.dev

Github Actions is used to automate the make calls on git tag events.
