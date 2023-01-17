# Mutineer.lua
Simplifies commenting and uncommenting lines of code for all and custom filetypes
![Simplifies commenting and uncommenting lines of code](https://github.com/jrihon/mutineer.vim/blob/main/doc/mutineer_banner/mutineer.gif)

## Installation
Add to your init.lua with [packer.nvim](https://github.com/wbthomason/packer.nvim).
```lua
  -- in your init.lua, to install the plugin
  use 'jrihon/mutineer.lua'
```

```lua
  -- set up mutineer
  require('mutineer').setup()
```

## Configuration

### Extend with custom commenting symbols
```lua
require('mutineer').setup({
                            lineCommentSymbols = {
                                                    lua = '--',
                                                }
                        })
```

### Mappings

The command `:Mutineer` handles both single line and multiline commenting/uncommenting.
```lua
-- I did the following in my init.lua (`m` stands for mute) : 
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true }
keymap('n', '<leader>m', ':Mutineer<CR>', opts)
keymap('v', '<leader>m', ':Mutineer<CR>', opts)
```

### Usage
 - It suffices to have the cursor on a line and to then actuate the command.
 - Multiline comments are actuated by using `Visual Mode` and higlighting the desired lines.
 - Uncommenting a line is handles by the same command


### Custom filetypes
You can check if vim recognises your filetype by `:echo &filetype` or `:lua print(vim.bo.filetype)`.</br>
If this command returns ` ` or `nil`, the filetype is not recognised.

`path/to/mutineer.lua/docs/AllKnownVimFileTypes.txt` contains a list of all the natively recognised filetypes.</br>

To have a certain filetype recognised : 
```vim
vim.cmd[[autocmd BufNewFile,BufRead *.foo set filetype='foobar']]
```


## Natively supported languages
```lua
  lineCommentSymbols = {    asm = ';',              -- Assembly
                            c = '//',               -- C
                            cpp = '//',             -- C++
                            cs = '//',              -- C#
                            csh = '#',              -- C-shell
                            d = '//',               -- D
                            dart = '//',            -- Dart
                            go = '//',              -- Golang
                            hs = '--',              -- Haskell
                            java = '//',            -- Java
                            javascript = '//',      -- JavaScript
                            kotlin = '//',          -- Kotlin
                            lua = '--',             -- Lua
                            matlab = '%',           -- Matlab
                            perl = '#',             -- Perl
                            php = '//',             -- PHP
                            python = '#',           -- Python
                            ruby = '#',             -- Ruby
                            rust = '//',            -- Rust
                            sh = '#',               -- Shell
                            sql = '--',             -- SQL
                            swift = '//',           -- Swift
                            tex = '%',              -- LaTeX
                            typescript = '//',      -- TypeScript
                            vim = '"',              -- Vim
                            yml = '#',              -- YAML
                            zsh = '#',              -- Z-shell
                        }

```


## Acknowledgements
My roommate for being excited whenever I sent him shows of progress while coding Mutineer.vim and now Mutineer.lua . Thanks S <3 
