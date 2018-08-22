# Package

version       = "0.1.0"
author        = "genotrance"
description   = "Nim wrapper for libtess2"
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nimgen >= 0.4.0"

import distros

var cmd = ""
if detectOs(Windows):
    cmd = "cmd /c "

task setup, "Download and generate":
	withDir "..":
		exec cmd & "nimble install nimgen"
    exec cmd & "nimgen nimtess2.cfg"

before install:
    setupTask()

task test, "Test nimtess2":
    exec "nim c -r tests/ttess2.nim"
