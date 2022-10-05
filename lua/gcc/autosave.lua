local api = vim.api

_G.autobuild_state = false
_G.autoformat_state = false

local M = {}

M.toogle_autoformat = function()
  _G.autoformat_state = not _G.autoformat_state
  if _G.autoformat_state then
    print("Autoformat: ON")
    api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("gcc_auto", { clear = true }),
      callback = function()
        vim.cmd("Neoformat")
      end,
    })
  else
    print("Autoformat: OFF")
    api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("gcc_auto", { clear = true }),
      callback = function() end,
    })
  end
end

M.toggle_cpp_build = function()
  _G.autobuild_state = not _G.autobuild_state
  if _G.autobuild_state then
    print("Autobuild: ON ")
    api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("auto", { clear = true }),
      callback = function()
        local cwd = api.nvim_call_function("getcwd", {})
        local cmd = "cd " .. cwd .. " && cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug"
        cmd = cmd .. " -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && cmake --build build"
        vim.fn.jobstart(cmd, { detach = false })
      end,
    })
  else
    print("Autobuild: OFF")
    api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("auto", { clear = true }),
      callback = function() end,
    })
  end
end

return M
