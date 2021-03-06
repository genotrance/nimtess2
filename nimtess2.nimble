# Package

version       = "0.1.1"
author        = "genotrance"
description   = "Nim wrapper for libtess2"
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nimgen >= 0.4.0"

var
  name = "nimtess2"
  cmd = when defined(Windows): "cmd /c " else: ""

if fileExists(name & ".nimble"):
  mkDir(name)

task setup, "Checkout and generate":
  if gorgeEx(cmd & "nimgen").exitCode != 0:
    withDir(".."):
      exec "nimble install nimgen -y"
  exec cmd & "nimgen " & name & ".cfg"

before install:
  setupTask()

task test, "Run tests":
  exec "nim c -r tests/t" & name & ".nim"
