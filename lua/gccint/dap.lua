local dap, dapui = require("dap"), require("dapui")
local home = vim.fn.getenv("HOME")

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = home .. "/.local/share/nvim/mason/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      local binary = nil
      for line in io.lines("CMakeLists.txt") do
        binary = line:match("add_executable%((%S+)")
        if binary then
          break
        end
      end
      return vim.fn.getcwd() .. "/build/" .. binary
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
}

dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      local binary = nil
      for line in io.lines("Cargo.toml") do
        binary = line:match('name%s*=%s*"(%S+)"')
        if binary then
          break
        end
      end
      return vim.fn.getcwd() .. "/target/debug/" .. binary
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
}

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
