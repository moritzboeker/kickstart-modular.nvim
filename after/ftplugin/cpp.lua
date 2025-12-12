-- Do not allow editing and writing of C/C++ dependencies
local fname = vim.api.nvim_buf_get_name(0)
if fname:find("/usr/include/", 1, true)
   or fname:find("/usr/local/include/", 1, true)
then
  vim.bo.readonly = true
  vim.bo.modifiable = false
end


