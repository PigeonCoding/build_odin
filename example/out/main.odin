package builder

import odin_builder "../.." // if build.odin is in the same directory you shoudn't have to do this
import "core:fmt"
import "core:os"

main :: proc() {
  b: odin_builder.odin_cmd_builder
  b.main_cmd = .build

  if ODIN_OS == .Linux {
    b.flags.out = "example/out/test"
  } else if ODIN_OS == .Windows {
    b.flags.out = "example/out/test.exe"
  } else {
    fmt.eprintln("what os is this")
    os.exit(1)
  }
  b.flags.thread_count = 4
  b.flags.debug = true
  b.directory = "example/a_project"

  cmd := odin_builder.build_cmd(&b)

  if err, not_ok := odin_builder.exec_and_run_sync(cmd[:]).?; not_ok {
    fmt.eprintln(err)
    os.exit(1)
  }
}
