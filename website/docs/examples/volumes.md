OneChart settings for setting environment variables:

```yaml
image:
  repository: nginx
  tag: 1.19.3

volumes:
  - name: data
    path: /var/lib/1clickinfra/data
    size: 10Gi
    storageClass: default
```

Check the Kubernetes manifest:

```bash
cat << EOF > values.yaml
image:
  repository: nginx
  tag: 1.19.3

volumes:
  - name: data
    path: /var/lib/1clickinfra/data
    size: 10Gi
    storageClass: default
EOF

helm template my-release oci://ghcr.io/gimlet-io/onechart --version 0.62.0 -f values.yaml
```

!!! warning

    OneChart generates a `PeristentVolumeClaim` with this configuration and mounts it to the given path.
    
    You have to know what `storageClass` is supported in your cluster.
    
    - On Google Cloud, `standard` gets you disk
    - On Azure, `default` gets you a normal block storage
    - Amazon EKS, `TODO`
    - Use `do-block-storage` for Digital Ocean
    
### Mount an Azure file storage

TODO
