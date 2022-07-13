local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    always_visible = true,
}

local filename = {
    "filename",
    file_status = true,
    newfile_status = true,
    path = 1,
    shorting_target = 40,

    symbols = {
        modified = "",
        readonly = "",
        unnamed = "",
        newfile = "",
    },
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " },
    cond = hide_in_width,
}

local filetype = {
    "filetype",
    colored = true,
    icons_enabled = true,
    icon = { align = "right" },
}

local location = {
    "location",
    padding = 1,
}

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "horizon",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "branch" },
        lualine_b = { diagnostics },
        lualine_c = { filename },
        lualine_x = { diff, spaces, "encoding", filetype },
        lualine_y = { location },
        lualine_z = { "progress" },
    },
}
