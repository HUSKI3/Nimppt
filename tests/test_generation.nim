# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
import ../src/nimppt

suite "Test suite for slide generation":
    test "Short content generation test":
        let slides = process_content("# Example\ntest body\n>Short\n---\n")
        let compare_against = @["<h1>Example</h1>\n<p>test body</p>\n<blockquote>\n<p>Short</p>\n</blockquote>\n"]
        check(slides[0] == compare_against)

    test "Multiple slides test":
        let slides = process_content("# Example\ntest body\n>Short\n---\n# Slide 2\ntest body\n>Short\n---")
        let compare_against = @["<h1>Example</h1>\n<p>test body</p>\n<blockquote>\n<p>Short</p>\n</blockquote>\n", "<h1>Slide 2</h1>\n<p>test body</p>\n<blockquote>\n<p>Short</p>\n</blockquote>\n"]
        check(slides[0] == compare_against)
