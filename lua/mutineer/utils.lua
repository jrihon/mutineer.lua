local api = vim.api

local M = {}


local function get_current_line(rowNumber)
  -- index is zero-based, end excluse
  -- tables always start with key = 1
  -- since we have a single line, we can safely index at `1`
  return api.nvim_buf_get_lines(0, rowNumber - 1, rowNumber, false)[1]
end

local function set_current_line(rowNumber, commentedLine)
  -- index is zero-based, end excluse
  -- tables always start with key = 1
  -- since we have a single line, we can safely index at `1`
  -- commented line should be a table, as this function expects it
  return api.nvim_buf_set_lines(0, rowNumber - 1, rowNumber, false, commentedLine)
end

local function first_char_of_line(commentSymbol, rowNumber)
  -- return the first character(s) of a line, to check if it has been commented before
  local currentLine = get_current_line(rowNumber)
  return string.sub(currentLine, 1, string.len(commentSymbol))
end

local function comment_line(commentSymbol, rowNumber)
  -- prepend the line with a commentSymbol
  local currentLine = get_current_line(rowNumber)
  local commentedLine = {}
  commentedLine[1] = commentSymbol..currentLine
  set_current_line(rowNumber, commentedLine)
end

local function uncomment_line(commentSymbol, rowNumber)
  -- delete the commentSymbol from the beginning of the line
  local currentLine = get_current_line(rowNumber)
  local uncommentedLine = {}
  local commentSymbolLength = string.len(commentSymbol)
  uncommentedLine[1] = string.sub(currentLine, commentSymbolLength + 1)     --index string after the commentSymbol
  set_current_line(rowNumber, uncommentedLine)
end

function M.return_row_number()
  -- from current buffer 0
  --return row number. `1` is row, `2` is column - 1
  return api.nvim_win_get_cursor(0)[1]
end

function M.retrieve_comment_symbol_by_filetype(commentTable)
  -- check if filetype exists
  local ft = vim.bo.filetype
  ft = (not ft or ft == "") and "none" or ft
  -- return commentSymbol
  return commentTable[ft]
end


function M.single_line_comment(commentSymbol, rowNumber)

  local firstChar = first_char_of_line(commentSymbol, rowNumber)

  if commentSymbol ~= firstChar then
    comment_line(commentSymbol, rowNumber)
  elseif commentSymbol == firstChar  then
    uncomment_line(commentSymbol, rowNumber)
  end
end

function M.multi_line_comment(commentSymbol, firstLine, lastLine)

  for rowNumber = firstLine, lastLine do
    M.single_line_comment(commentSymbol, rowNumber)
  end
end


return M

--local function deleteVisualSelectionMarks()
--  api.nvim_buf_del_mark(0, '<')
--  api.nvim_buf_del_mark(0, '>')
--end
--
--local function isVisualSelectionTrue()
--  -- returns table with { 1 = row, 2 = col}
--  local has_mark = api.nvim_buf_get_mark(0, '<')[1]
--  if has_mark == 0 then
--    deleteVisualSelectionMarks()
--    return false
--  else
--    return true
--  end
--end

