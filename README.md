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

Follow the instructions given below for the developement of onechart:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

```bash
wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
tar xf kubeval-linux-amd64.tar.gz
sudo cp kubeval /usr/local/bin
```

```bash
git clone https://github.com/DataDog/helm-unittest.git
cd helm-unittest
export VERSION=$(sed -n -e 's/version:[ "]*\([^"]*\).*/\1/p' plugin.yaml)
export LDFLAGS="-X main.version=$VERSION -extldflags '-static'"
echo $LDFLAGS
go build -o untt -ldflags "$LDFLAGS" ./main.go
export HELM_PLUGINS=$(helm env | grep "HELM_PLUGINS" | awk -F"=" '{print $2;}' | awk -F\" '{print $2;}')
export HELM_PLUGIN_DIR=$HELM_PLUGINS/helm-unittest
mkdir -p $HELM_PLUGIN_DIR
cp untt $HELM_PLUGIN_DIR
cp plugin.yaml $HELM_PLUGIN_DIR
```

## Contribution Guidelines

Thank you for your interest in contributing to the Gimlet project.

Below are some of the guidelines and best practices for contributing to this repository:

### Issues

If you are running a fork of OneChart and would like to upstream a feature, please open a pull request for it.

If you are planning to add a new feature to OneChart, please open an issue for it first. Helm charts are prone to having too many features, and OneChart want to keep the supported use-cases in-check. Proposed features have to be generally applicable, targeting newcomers to the Kubernetes ecosystem.

### New Features / Components

If you have any ideas on new features or want to improve the existing features, you can suggest it by opening a [GitHub issue](https://github.com/gimlet-io/onechart/issues/new). Make sure to include detailed information about the feature requests, use cases, and any other information that could be helpful.

### Pull Request Process

* Fork the repository.
* Create a new branch and make your changes.
* Open a pull request with detailed commit message and reference issue number if applicable.
* A maintainer will review your pull request, and help you throughout the process.
