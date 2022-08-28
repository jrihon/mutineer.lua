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
--                            lua = '--',
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


-- be able to set additional filetypes through here as well and we just add them to the environment

function M.set(user_commentSymbols)
  user_commentSymbols = user_commentSymbols or {}
  --lineCommentSymbols = vim.tbl_deep_extend("force", lineCommentSymbols, user_commentSymbols)
  --return lineCommentSymbols
  local table = vim.tbl_deep_extend("force", M, user_commentSymbols)

  --for t, a in pairs(M.lineCommentSymbols) do print(t, a) end

  --for k, v in pairs(table) do
  --  if k == 'lineCommentSymbols' then
  --      for j, w in pairs(v) do
  --          print(j, w)
  --      end
  --  end
  --end
  return table
end

return M
