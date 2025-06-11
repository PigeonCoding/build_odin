# odin build system
## example
run 
```
$ odin run ./example/out
```

## how to use
- create a new directory (build for example)
- add build.odin in that directory
- add a new .odin file with a main and configure your builder [example](https://github.com/PigeonCoding/veilcode)
- run `odin run 'your directory'`

## available functions
- exec_and_run_sync
- exec_and_run_async
- build_cmd
