# Package

version       = "0.1.0"
author        = "Artur Z"
description   = "A simple and elegant presentation generator"
license       = "MIT"
srcDir        = "src"
bin           = @["nimppt"]


# Dependencies

requires "nim >= 1.6.12"
requires "markdown >= 0.8.7"
requires "pylib >= 0.4.0"
requires "nimja >= 0.8.7"
requires "jester"
requires "cligen"