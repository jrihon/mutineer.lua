local utils = require('mutineer.utils')
local commentConfig  = require('mutineer.commentconfig')


local M = {}



function M.mutineer_line_comment(rangeArgs, commentTable)
  -- range : denotes how many lines are highlighted
  -- line1 : denotes the row of the first line highlighted
  -- line2 : denotes the row of the last line highlighted

  local commentSymbol = utils.retrieve_comment_symbol_by_filetype(commentTable)
  if commentSymbol == nil then
    local str = "Commenting not supported for the following filetype : '*."..vim.bo.filetype.."'.\nFeel free to add your symbol of choice to require('mutineer').setup({commentTable})"
    print(str)
    return
  end

  -- Is a range in visual selection highlighted/selected?
  if rangeArgs.range == 0 then
    local rowNumber = utils.return_row_number()
    utils.single_line_comment(commentSymbol, rowNumber)
  else
    utils.multi_line_comment(commentSymbol, rangeArgs.line1, rangeArgs.line2)
  end
end




local function setup_commands(config)
  local cmd = vim.api.nvim_create_user_command

  cmd('Mutineer',
      function(args) M.mutineer_line_comment(args, config.lineCommentSymbols) end,
      {range = true, nargs = "?"}
  )

end


function M.setup(userPrefs)
  local config = commentConfig.set(userPrefs)
  setup_commands(config)
end


return M
