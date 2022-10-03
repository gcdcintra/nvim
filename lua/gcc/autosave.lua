local api = vim.api

api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("auto", { clear = true }),
  callback = function()
    --local ltp_p = "~/work/workspace_streamax/trimble-sw/ltp/build"
    --local tplat_p = "~/work/workspace_streamax/trimble-sw/tplatform/build"
    --local app_p = "~/work/workspace_streamax/trimble-sw/example/build"
    local app = "/home/gccintra/.dotfiles/work/workspace_streamax/trimble-sw/tplatform"
    local cmd = "cd " .. app .. " &&  cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug"
    vim.fn.jobstart(cmd, { detach = true })
    cmd = "cd " .. app .. "/build && make -j8"
    vim.fn.jobstart(cmd, { detach = true })

    --local cmd = "cd " .. ltp_p .. " && make && sudo make install"
    --vim.fn.jobstart(cmd, { detach = true })
    --cmd = "cd " .. tplat_p .. " && make && sudo make install"
    --vim.fn.jobstart(cmd, { detach = true })
    --cmd = "cd " .. app_p .. " && make && sudo make install"
    --vim.fn.jobstart(cmd, { detach = true })
  end,
})

api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("gcc_auto", { clear = true }),
  callback = function()
    vim.cmd("Neoformat")
  end,
})

--local buf = api.nvim_create_buf(0, true)
--local win = api.nvim_open_win(buf, true, {
--  relative = "editor",
--  width = 100,
--  height = 10,
--  col = 2,
--  row = 0,
--  style = "minimal",
--})
--local buf2 = api.nvim_create_buf(0, true)
--local win2 = api.nvim_open_win(buf2, true, {
--  relative = "editor",
--  width = 100,
--  height = 10,
--  col = 2,
--  row = 13,
--  style = "minimal",
--})
--local chanel = api.nvim_open_term(buf, {})
--api.nvim_chan_send(chanel, "\rls\r")
--api.nvim_chan_send(chanel, "\rls -a\r")
