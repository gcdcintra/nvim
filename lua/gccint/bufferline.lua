local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
    options = {
        always_show_bufferline = true,
        close_icon = "",
        diagnostics = "nvim_lsp",
        show_close_icon = false,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
    },
}
