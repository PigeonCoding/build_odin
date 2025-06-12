package builder

import odin_builder "../.." // if build.odin is in the same directory you shoudn't have to do this
import "core:fmt"
import "core:os/os2"

main :: proc() {
  b: odin_builder.odin_cmd_builder
  b.main_cmd = .build

  if ODIN_OS == .Linux {
    b.flags.out = "example/out/test"
  } else if ODIN_OS == .Windows {
    b.flags.out = "example/out/test.exe"
  } else {
    fmt.println("what os is this")
    os2.exit(1)
  }
  b.flags.thread_count = 4
  b.flags.debug = true
  b.directory = "example/a_project"

  cmd := odin_builder.build_cmd(&b)

  if err := odin_builder.exec_and_run_sync(cmd[:]); err != nil {
    fmt.eprintln(err)
    os2.exit(1)
  }
  if ODIN_OS == .Windows {
    odin_builder.exec_and_run_async([]string{"rm", os2.args[0]})
  }
}
