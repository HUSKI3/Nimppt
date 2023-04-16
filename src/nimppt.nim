import strutils, markdown
import pylib
from nimja/parser import compileTemplateFile, getScriptDir
import jester
import logging
from os import `/`

proc myRenderProc(slides: seq[string]): string =
  compileTemplateFile(getScriptDir() / "base.html")

proc process_file(file: string): seq[string] = 
  let content = readFile(file)
  var slides: seq[string] = @[]
  var current_content: string

  for line in content.split("\n"):
    case line:
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
  
  return slides


proc fun(file="filename"): int=
  print("Preparing generation...")
  let slides = process_file(file)

  print("Generated, starting service")

  # Silence Jester
  logging.setLogFilter(lvlError)
 
  router myrouter:
    get "/":
      resp myRenderProc(slides)

  var customSettings = newSettings(port=Port(8000))
  var myjester = initJester(myrouter, settings=customSettings)
  myjester.serve()
  
  result = 0 

import cligen; dispatch fun