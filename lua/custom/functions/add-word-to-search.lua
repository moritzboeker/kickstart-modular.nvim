local M = {}

-- [[ Add more words - which are under the cursor - to the current search ]]
-- Usage: * to start, then <leader>* to add more words
local function add_word_to_search()
  local text
  local mode = vim.fn.mode()

  if mode == "v" or mode == "V" then
    -- Get visually selected text
    vim.cmd('noau normal! "vy"')
    text = vim.fn.getreg("v")
    text = vim.fn.escape(text, [[\/]])
  else
    -- Get word under cursor with word boundaries
    text = "\\<" .. vim.fn.expand("<cword>") .. "\\>"
  end

  local current = vim.fn.getreg("/")
  if current == "" then
    vim.fn.setreg("/", text)
  else
    vim.fn.setreg("/", current .. "\\|" .. text)
  end

  vim.cmd("set hlsearch")
  vim.o.hlsearch = true

  -- Print the pattern for visibility
  print("Search: " .. vim.fn.getreg("/"))
end

M.add_word_to_search = add_word_to_search
return M
