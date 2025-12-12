-- Do not allow editing and writing of Rust dependencies
local fname = vim.api.nvim_buf_get_name(0)
if fname:find("/.cargo/registry/src/", 1, true)
   or fname:find("/.rustup/toolchains/", 1, true)
then
  vim.bo.readonly = true
  vim.bo.modifiable = false
end

