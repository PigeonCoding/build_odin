package builder

import "core:os/os2"
import "core:fmt"
import odin_builder ".."

main :: proc() {
  b: odin_builder.odin_cmd_builder
  b.main_cmd = .build

  b.flags.out = "out/test.exe"
  b.flags.thread_count = 4
  b.flags.debug = true
  b.directory = "example"

  if odin_builder.exec_and_run_sync(odin_builder.build_cmd(&b)) != nil do os2.exit(1)
  
  odin_builder.exec_and_run_async([]string{"rm", os2.args[0]})
}
