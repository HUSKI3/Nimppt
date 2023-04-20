import strutils, markdown
import pylib
from nimja/parser import compileTemplateFile, getScriptDir
import jester
import logging
from os import `/`

proc myRenderProc(slides: seq[string], css: string): string =
  compileTemplateFile(getScriptDir() / "base.html")

proc process_content(content: string): (seq[string], string) =
  var slides: seq[string] = @[]
  var current_content: string
  var custom_css: string

  for line in content.split("\n"):
    case line:
      of "--css--":
        # We finished capturing css
        custom_css = current_content
        current_content = ""
      of "---":
        # New slide
        # print("New slide with content:", current_content)
        slides.add(markdown(current_content))
        current_content = ""
      else:
        current_content.add("\n")
        current_content.add(line)

  # print("\nAll slides")
  # for i, slide in slides:
    # print(f"Slide {i}:")
    # print(slide)

  return (slides, custom_css)

proc fun(file: string, speed_test: bool = false): int =
  print("Preparing generation...")
  let slides = process_content(readFile(file))

  print("Generated, starting service")

  if speed_test == true:
    discard myRenderProc(slides[0], slides[1])
    result = 0
    return result

  # Silence Jester
  logging.setLogFilter(lvlError)

  router myrouter:
    get "/":
      resp myRenderProc(slides[0], slides[1])

  var customSettings = newSettings(port = Port(8000))
  var myjester = initJester(myrouter, settings = customSettings)
  myjester.serve()

  result = 0


import cligen

when isMainModule:
  dispatch fun, help = {
    "file": "Takes a file path to the markdown file",
    "speed_test": "Does a speed test for conversion of markdown to the html page",
    }


# For testing
export process_content
export myRenderProc