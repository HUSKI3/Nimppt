<h1 align="center"> Nimppt </h1> <br>
<p align="center">
  <a href="https://github.com/HUSKI3/Nimppt">
    <img alt="Nimppt" title="Nimppt" src="https://raw.githubusercontent.com/HUSKI3/Nimppt/main/resources/Nimppt.png">
  </a>
</p>

<p align="center">
  Nimppt is a simple presentation generator that uses Markdown syntax
</p>

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)

## Introduction
This is a simple presentation generator written in Nim. It takes a markdown file and starts a web server with the presentation.

## Features

- Easy configuration
- Hassle free
- Automatically formatted

## Usage
Using nimppt is simple

First you need to create a markdown file which will have the slides and content of the presentation.
```md
# Title
Body
- list item 1
- list item 2
> Description
![image](image-source.png)
```

Then you can start nimppt with the following:
```bash
# Host the web server
$ ./nimppt -f your_presentation.md

# Do a speed test
$ time ./nimppt -f your_presentation.md --speed_test
```

### Output!
![demo](https://cdn.lewd.host/LnMxupgT.gif)

## Installation
Easiest way to get started is by installing the binary from the releases

## Modifying Nimppt
Modifying nimppt is easy, all you need to do is clone the repository, and change the `base.html` file!

```bash
$ git clone https://github.com/HUSKI3/Nimppt.git
$ nimble install
# To build
$ nimble build
# To run tests
$ nimble test
```