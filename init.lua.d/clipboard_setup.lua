if vim.fn.executable("xclip") == 1 then
  -- Use xclip if available (first preference)
  vim.g.clipboard = {
    name = "xclip_clipboard",
    copy = {
      ["+"] = "xclip -selection clipboard",
      ["*"] = "xclip -selection primary",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -o",
      ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = 1,
  }
elseif vim.fn.executable("xsel") == 1 then
  -- Use xsel as fallback
  vim.g.clipboard = {
    name = "xsel_clipboard",
    copy = {
      ["+"] = "xsel --clipboard --input",
      ["*"] = "xsel --primary --input",
    },
    paste = {
      ["+"] = "xsel --clipboard --output",
      ["*"] = "xsel --primary --output",
    },
    cache_enabled = 1,
  }
else
  -- Notify if no clipboard tool is found
  vim.notify("No clipboard tool found. Please install xclip or xsel.", vim.log.levels.WARN)
end
