# Build and run using Podman

## Build the container with Podman

### Prepare Podman on a Mac

Asuming that Podman is installed using `Brew`:

```shell
brew install protobuf
```

Enable `rootful` containers

```shell
podman machine init
podman machine set --rootful
podman machine start
```

### Build the container

```shell
podman buildx build -f .devcontainer/Dockerfile \
    -v $PWD/workspace/workloads:/etc/containers/systemd \
    -v $PWD/../scenarios/smart_trailer/scripts:/workspace/src/smart_trailer/scripts \
    -t esdv
```

## Run the development container with Podman

```shell
podman run -d --replace --name esdv \
    --privileged \
    -v $PWD/workspace/workloads:/etc/containers/systemd \
    -v $PWD/workspace/src:/workspace \
    --workdir /workspace \
    localhost/esdv
```

### Interact with the workload

```shell
podman exec -it esdv /bin/bash
```

```shell
bluechictl list-units

systemctl status smart_trailer_application
```
