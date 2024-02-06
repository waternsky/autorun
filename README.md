# Autorun (for Python and Go)

## Problem
Are you tired of switching to new terminal or tmux window to run file ? (or even worse, closing file and runinng).
Autorun is for you.

## Solution
Neovim plugin to run the python and go file on save.
My first neovim plugin.

## Demo

https://github.com/waternsky/autorun/assets/125210040/8d5c0400-868c-4911-9273-1112e1c6dea7

Ctrl-c to close the floating window.

## Setup

lazy package manager:
```lua
return {
    "waternsky/autorun",
    config = function ()
        local autorun = require("autorun")
        local opts = {
            pythoncmd = "python3",
            title_pos = "left",
            border = "single",
        }
        autorun.Toggle(opts) -- for Autorun commands
    end
}
```
Commands:
* :AutorunEnable -> to enable (after this result will appear in floating windows in center of screen)
* :AutorunDisable -> to disable

## Credits
* Neovim documentation (spend most of my time here to write this).
* [TeejDv](https://www.youtube.com/@teej_dv/videos) has extensive videos for writing plugins.
