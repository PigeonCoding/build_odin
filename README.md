# odin build system
## example
run 
```
$ mkdir out
$ odin run example
```

## how to use
- create a new directory (build for example)
- add build.odin in that directory
- add a main and configure your builder
- run `odin run 'your directory'`

## available functions
- exec_and_run_sync
- exec_and_run_async
- build_cmd