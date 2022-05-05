# CSA-Rebar-Development-Lengths

- [CSA-Rebar-Development-Lengths](#csa-rebar-development-lengths)
  - [Screenshots](#screenshots)
  - [How do I use this?](#how-do-i-use-this)
  - [Limitations](#limitations)
  - [What scripting language](#what-scripting-language)
  - [Roadmap](#roadmap)

## Screenshots


## How do I use this?
The `Development_length.exe` file from the base directory is a standalone file, meaning it can be downloaded without any other accompanying files/folders to run the program.

If you would like to edit/tweak the file, you can download the `Development_length.ahk` file in the `resources` directoy. 

## Limitations
This was built for my personal use to cut down on the number of times I needed to look up development lengths and as a result, it was built with standard functions/options that are used in a day to day design. 

Some seldom used options like the support for 45M & 55M bars or support for general equation as opposed to simplified equation has not been implemented. Yet. See [Roadmap](#roadmap) for a full list of items pending addition in future versions.

## What scripting language
[Autohotkey](https://www.autohotkey.com/) - A free, open-source scripting language for Windows that allows users to easily create small to complex scripts for all kinds of tasks.

## Roadmap
 - [ ] Hooked bar development length
   - [ ] Add hook confinement requirements per 12.5.4
 - [ ] Tension development length
   - [ ] Limit min dev. length to 300mm per 12.2.1
 - [ ] Compression development length
   - [ ] Limit min dev. length to 200mm per 12.3.1
   - [ ] Add modification factors for spiral reinforcing
   - [ ] Dev. length of bundled bars
 - [ ] Update to latest code?
 - [ ] Add 45M & 55M bars
 - [ ] Support for different codes
 - [ ] Limit max value of f'c to 64MPa per 12.1.2
 - [ ] Add option for length calculation using general equation 12.1