# Autorun (for Python and Go)

## Problem
Are you tired of switching to new terminal or tmux window to run file ? (or even worse, closing file and runinng).
Autorun is for you.

## Solution
Neovim plugin to run the python and go file on save.
My first neovim plugin.

## Setup

lazy package manager:
```lua
return {
    "waternsky/autorun",
    config = function ()
        require("autorun")
    end
}
```

## Credits
* Neovim documentation (spend most of my time here to write this).
* [TeejDv](https://www.youtube.com/@teej_dv/videos) has extensive videos for writing plugins.
