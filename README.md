# aws-sam-cli-bug-poc

## Build

```
make build
```

## To Reproduce

Works:
```
WARM_CONTAINERS_SWITCH="" make start
```

Both fail:
```
WARM_CONTAINERS_SWITCH="--warm-containers LAZY" make start
WARM_CONTAINERS_SWITCH="--warm-containers EAGER" make start
```