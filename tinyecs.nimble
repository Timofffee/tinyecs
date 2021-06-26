# Package

version       = "0.2.0"
author        = "coaljoe, Timofffee (George Linkovsky)"
description   = "Simple ECS implementation on Nim"
license       = "MIT"

srcDir = "src"

# Dependencies

requires "nim >= 1.4"

task test, "Run the TinyECS tester!":
  withDir "tests":
    exec "nim c -r test_entity"