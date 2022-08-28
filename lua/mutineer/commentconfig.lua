local M = {}

--[[ comment symbols per language : Line Comments]]
M.lineCommentSymbols = {    asm = ';',
                            c = '//',
                            cpp = '//',
                            cs = '//',
                            csh = '#',
                            d = '//',
                            dart = '//',
                            go = '//',
                            hs = '--',
                            java = '//',
                            javascript = '//',
                            kotlin = '//',
                            lua = '--',
                            matlab = '%',
                            perl = '#',
                            php = '//',
                            python = '#',
                            ruby = '#',
                            rust = '//',
                            sh = '#',
                            sql = '--',
                            swift = '//',
                            tex = '%',
                            typescript = '//',
                            vim = '"',
                            yml = '#',
                            zsh = '#',
                        }


function M.set(user_commentSymbols)
  user_commentSymbols = user_commentSymbols or {}
  return vim.tbl_deep_extend("force", M, user_commentSymbols)
end

return M


--[[ TO DO 
            Be able to set additional filetypes through tables as well and add them to the possible filetypes
  ]]

