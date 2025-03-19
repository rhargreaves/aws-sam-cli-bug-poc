# aws-sam-cli-bug-poc

## Build

```
make build
```

## To Reproduce

### Works
```
WARM_CONTAINERS_SWITCH="" make start
```

### Failures

```
$ WARM_CONTAINERS_SWITCH="--warm-containers LAZY" make start
$ WARM_CONTAINERS_SWITCH="--warm-containers EAGER" make start

...
sam-1  | 2025-03-19 11:46:45,377 | Resolving code path. Cwd=/sam/child, CodeUri=build/
sam-1  | 2025-03-19 11:46:45,377 | Resolved real code path to /sam/child/build
sam-1  | 2025-03-19 11:46:45,378 | Exception on / [GET]
samcli.lib.utils.file_observer.FileObserverException: Can not observe non exist path
```