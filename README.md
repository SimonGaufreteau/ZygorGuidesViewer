# VanillaEpochLeveling

## Overview

This is a port of Zygor 3.3.5 addon to Project Epoch (Vanilla+ 1-60), with the following guides :

- **(Recommended) Zygor Leveling Guide** : Era guide backported to 3.3.5
  - All credits go to Zygor for the original guide !

The goal of this project is to have a strong leveling base with Zygor, then to expand them as new quests are discovered.

Important : Coordinates might be incorrect in some places since NPCs have been moved around (known issues : Stormwind and Goldshire). Please report any bugs you see in the Github issues.

<img width="653" height="339" alt="zygor_ingame" src="https://github.com/user-attachments/assets/ec84af4d-14ce-4005-aa5f-512bdc38456b" />

## Installing

Either :

- **(Recommended) Use [GitAddonsManager](https://woblight.gitlab.io/overview/gitaddonsmanager/). Then change the folder name to `ZygorGuidesViewer` (the name is very important, otherwise the addon won't load)**
- (Alternative for git users) Clone the repository in your `Addon` folder with name `ZygorGuidesViewer`
- (Not recommended as you will not get updates) Download the Addon as a zip file, unzip it in your Addon folder, rename the extrated folder to `ZygorGuidesViewer`

## Contributing

Overall, the plan is to make this project community-based since there is a massive amount of new quests / items added with Project Epoch,
and I will not be able to go through all the content myself so I rely on the Epoch community to suggest leveling routes !

In order to contribute :

- Open an issue [in Github here](https://github.com/SimonGaufreteau/VanillaEpochLeveling/issues) with the changes you think should be made. Each issue should cover 1 change "idea"
  (eg. you can include multiple quests change in 1 zone if they relate to each other in the route. Changes across multiple zones should be split except if related).
- If you would like to directly implement the change in the code base, create [a pull request](https://github.com/SimonGaufreteau/VanillaEpochLeveling/pulls) linking to an issue.
  - Note : you will need `stylua` to format the lua code, [see here](https://github.com/JohnnyMorganz/StyLua) for installation
  - Use `make format` to apply formatting or make sure your IDE uses `stylua`

Please read the guide format [here](./guide_format.html) on how to write Zygor formatted guides (open in your browser).

In order to get quest / items / NPC IDs and location, check the [pfquest-Epoch](https://github.com/Bennylavaa/pfQuest-epoch) db or questie epoch (whichever you prefer).

## Custom content status tracker

Alliance (empty rows mean no updates yet) :
| Guide | Status |
|-----------|--------|
| dwarf1-13 | |
| human1-13 | |
| gnome1-13 | |
| elf1-13 | |
| main13-20 | |
| main20-25 | |
| main25-30 | |
| main30-35 | |
| main35-40 | |
| main40-45 | |
| main45-50 | |
| main50-55 | |
| main55-60 | |

Horde :

(Not updated yet)

## Notes

Another reason I initially split the guide into subfiles which are not lua is to be able to have syntax highlighting (+ potentially LSP features) in IDEs for the zygor guides which are written in a custom language.

Since I use neovim for development, I wrote this small treesitter parser/highlighting (experimental) : [https://github.com/SimonGaufreteau/tree-sitter-zygor].

## Credits

All credits for the Addon and the base Zygor guide go to Zygor !

Credits for the original TUG route (and initial port) all go to TUG !
