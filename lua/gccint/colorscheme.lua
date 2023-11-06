local colorscheme = "catppuccin"

require(colorscheme).setup {
    --    transparent = true,
    --    dim_inactive = false,
    --    style = "night",
    --    lualine_bold = true,
}

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    return
end
