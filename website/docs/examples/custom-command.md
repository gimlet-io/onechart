OneChart settings for overriding the default command to run:

```yaml
image:
  repository: debian
  tag: stable-slim

command: |
  while true; date; sleep 2; done
```

Check the Kubernetes manifest:

```bash
cat << EOF > values.yaml
image:
  repository: debian
  tag: stable-slim

command: |
  echo "hello"
EOF

helm template my-release onechart/onechart -f values.yaml
```

### Running a command in Alpine Linux

```bash
cat << EOF > values.yaml
image:
  repository: alpine
  tag: 3.12

command: |
  echo "hello"
shell: "/bin/ash"
EOF

helm template my-release onechart/onechart -f values.yaml
```
