-- Do not allow editing and writing of Python dependencies
local fname = vim.api.nvim_buf_get_name(0)
if fname:find("/.local/share", 1, true)
   or fname:find("/usr/lib/python", 1, true)
   or fname:find("/usr/local/lib/python", 1, true)
then
  vim.bo.readonly = true
  vim.bo.modifiable = false
end


