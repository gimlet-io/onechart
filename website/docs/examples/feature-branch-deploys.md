Feature branch deploys in large part is a templating question:

- Names should be unique to avoid collision between application instances
- Names should follow some convention
- It's driven by CI, and git branch name is a typical input parameter

### Avoiding name collisions

With OneChart, you can drive the naming of most resources by setting a unique release name.
Release name is unique in Helm too, so it makes it a good tool to drive resource names.

One good practice can be to add a `-$BRANCH` suffix to the feature branch instance:

```
helm template my-release-my-branch oci://ghcr.io/gimlet-io/onechart --version 0.62.0 -f values.yaml
```

### Avoiding domain name collision

The release name will make all Kubernetes objects unique, but the domain name configuration remains static:

```
image:
  repository: nginx
  tag: 1.19.3

ingress:
  annotations:
    kubernetes.io/ingress.class: nginx
  host: my-release.mycompany.com

helm template my-release-my-branch oci://ghcr.io/gimlet-io/onechart -f values.yaml
```

The `ingress.host` name should also be dynamic to avoid the collision:

```
helm template my-release-my-branch oci://ghcr.io/gimlet-io/onechart \
  -f values.yaml \
  --set ingress.host=my-release-my-branch.mycompany.com
```

### CI

In CI the above command needs to be templated:

```
helm template my-release-$BRANCH oci://ghcr.io/gimlet-io/onechart \
  -f values.yaml \
  --set ingress.host=my-release-$BRANCH.mycompany.com
```

where $BRANCH is a built-in CI variable.
