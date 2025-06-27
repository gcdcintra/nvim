# Modern Neovim Configuration

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![License](https://img.shields.io/badge/LICENSE-MIT-blue?style=for-the-badge)

A Neovim configuration designed for modern development, focusing on code intelligence, aesthetics, and productivity.

<div align="center">
  <img src="https://camo.githubusercontent.com/410b3ab80570bcd5b470a08d84f93caa5b4962ccd994ebceeb3d1f78364c2120/687474703a2f2f692e696d6775722e636f6d2f776136363678672e706e67" alt="Gruvbox Theme" width="600px"/>
</div>

## Features

- **Lazy Loading**: Utilizes [lazy.nvim](https://github.com/folke/lazy.nvim) for efficient plugin loading and fast startup times.
- **Code Navigation**: Implemented with [Telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding and project navigation.
- **Syntax Highlighting**: Provided by [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) for advanced syntax parsing and highlighting.
- **LSP Integration**: Supports Language Server Protocol for various languages, including Lua and C/C++.
- **Formatting**: Configured for automatic code formatting with range support.
- **Code Completion**: Offers context-aware code suggestions via [blink.cmp](https://github.com/saghen/blink.cmp).
- **User Interface**: Features [Catppuccin](https://github.com/catppuccin/nvim) and [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim) themes with custom integrations.
- **Status Line**: Displays informative status line with relative paths.
- **Modular Design**: Configured with a modular structure to facilitate customization.
- **Git Integration**: Provides a comprehensive Git workflow through [Neogit](https://github.com/NeogitOrg/neogit) and related tools.

## 📦 Installation

### Prerequisites

- Neovim 0.9.0 or later
- Git
- [ripgrep](https://github.com/BurntSushi/ripgrep) - For Telescope text search
- [fd](https://github.com/sharkdp/fd) - For Telescope file finding
- A C compiler (gcc, clang) - For TreeSitter

### Automatic Installation (Recommended)

The easiest way to install this configuration is using the automated setup script, which will:

- Detect your Linux distribution (Arch or Ubuntu/Debian)
- Install all required dependencies
- Back up any existing Neovim configuration
- Set up this configuration automatically

```bash
# Clone this repository
git clone https://github.com/gcdcintra/nvim.git

# Run the setup script
cd nvim
./setup.sh
```

### Manual Installation

1. Backup your existing Neovim configuration (if any):

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone this repository:

```bash
git clone https://github.com/gcdcintra/nvim.git ~/.config/nvim
```

3. Start Neovim:

```bash
nvim
```

Plugins will be automatically installed on first launch via lazy.nvim.

## ⌨️ Key Mappings

| Category                 | Key                      | Mode   | Action                                     |
| ------------------------ | ------------------------ | ------ | ------------------------------------------ |
| **Leader**               | `<Space>`                | Normal | Leader key                                 |
| **Window Navigation**    |                          |        |                                            |
|                          | `<C-h>`                  | Normal | Navigate left                              |
|                          | `<C-j>`                  | Normal | Navigate down                              |
|                          | `<C-k>`                  | Normal | Navigate up                                |
|                          | `<C-l>`                  | Normal | Navigate right                             |
|                          | `<C-Up/Down/Left/Right>` | Normal | Resize windows                             |
| **Buffer Navigation**    |                          |        |                                            |
|                          | `<S-h>`                  | Normal | Previous buffer                            |
|                          | `<S-l>`                  | Normal | Next buffer                                |
|                          | `<leader>bc`             | Normal | Close buffer                               |
|                          | `<leader>bn`             | Normal | Next buffer                                |
|                          | `<leader>bp`             | Normal | Previous buffer                            |
| **File Operations**      |                          |        |                                            |
|                          | `<leader>ff`             | Normal | Find files                                 |
|                          | `<leader>fg`             | Normal | Live grep (search in files)                |
|                          | `<leader>fb`             | Normal | Browse buffers                             |
|                          | `<leader>fo`             | Normal | Find recent files                          |
|                          | `<leader>fe`             | Normal | File explorer                              |
| **UI Toggles**           |                          |        |                                            |
|                          | `<leader>th`             | Normal | Toggle search highlight                    |
|                          | `<leader>tn`             | Normal | Toggle relative numbers                    |
| **Clipboard Operations** |                          |        |                                            |
|                          | `<leader>y`              | Normal | Copy to system clipboard                   |
|                          | `<leader>Y`              | Normal | Copy to end of line to system clipboard    |
|                          | `<leader>y`              | Visual | Copy selection to system clipboard         |
|                          | `<leader>yy`             | Normal | Copy current line to system clipboard      |
|                          | `<leader>p`              | Normal | Paste from system clipboard after cursor   |
|                          | `<leader>P`              | Normal | Paste from system clipboard before cursor  |
|                          | `<leader>p`              | Visual | Paste from system clipboard over selection |
| **Text Manipulation**    |                          |        |                                            |
|                          | `<` / `>`                | Visual | Indent/unindent and stay in visual         |
|                          | `J` / `K`                | Visual | Move selected text down/up                 |
|                          | `p`                      | Visual | Paste without yanking                      |
| **Completion**           |                          |        |                                            |
|                          | `<M-]>`                 | Insert | Trigger Copilot completion                 |

### Git Features

| Category          | Key           | Mode   | Action                           |
| ----------------- | ------------- | ------ | -------------------------------- |
| **Neogit**        |               |        |                                  |
|                   | `<leader>gg`  | Normal | Open Neogit main interface       |
|                   | `<leader>gc`  | Normal | Neogit commit                    |
|                   | `<leader>gp`  | Normal | Neogit pull                      |
|                   | `<leader>gP`  | Normal | Neogit push                      |
| **Git Conflict**  |               |        |                                  |
|                   | `<leader>gco` | Normal | Choose ours in conflict          |
|                   | `<leader>gct` | Normal | Choose theirs in conflict        |
|                   | `<leader>gcb` | Normal | Choose both in conflict          |
|                   | `<leader>gcn` | Normal | Choose none in conflict          |
|                   | `]x`          | Normal | Next git conflict                |
|                   | `[x`          | Normal | Previous git conflict            |
| **Git Hunks**     |               |        |                                  |
|                   | `<leader>hs`  | Normal | Stage hunk                       |
|                   | `<leader>hr`  | Normal | Reset hunk                       |
|                   | `<leader>hb`  | Normal | Blame line                       |
|                   | `<leader>hp`  | Normal | Preview hunk                     |
|                   | `<leader>hd`  | Normal | Show diff                        |
|                   | `]c` / `[c`   | Normal | Next/previous hunk               |
| **Git Links**     |               |        |                                  |
|                   | `<leader>gl`  | Normal | Get GitHub link                  |
|                   | `<leader>gL`  | Normal | Get GitHub link with line number |
| **Git Telescope** |               |        |                                  |
|                   | `<leader>gs`  | Normal | Git status                       |
|                   | `<leader>gb`  | Normal | Git branches                     |

### LSP Features

| Key          | Mode   | Action                   |
| ------------ | ------ | ------------------------ |
| `gd`         | Normal | Go to definition         |
| `gr`         | Normal | Go to references         |
| `gD`         | Normal | Go to declaration        |
| `gi`         | Normal | Go to implementation     |
| `K`          | Normal | Show hover documentation |
| `<leader>rn` | Normal | Rename symbol            |
| `<leader>ca` | Normal | Code actions             |
| `<leader>lf` | Normal | Format document          |
| `<leader>lf` | Visual | Format selection         |
| `[d`         | Normal | Previous diagnostic      |
| `]d`         | Normal | Next diagnostic          |

## Plugin Ecosystem

This configuration integrates a curated set of plugins to provide a comprehensive development environment:

### Core

- **[lazy.nvim](https://github.com/folke/lazy.nvim)**: Plugin manager for Neovim.
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)**: Provides Lua utility functions.

### UI

- **[gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)**: Colorscheme.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: Configurable statusline.
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)**: Provides file icons for UI components.
- **[which-key.nvim](https://github.com/folke/which-key.nvim)**: Displays keybinding hints.
- **[dressing.nvim](https://github.com/stevearc/dressing.nvim)**: Enhances UI elements.
- **[nvim-notify](https://github.com/rcarriga/nvim-notify)**: Notification system.

### Editor Enhancements

- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Fuzzy finder for files and content.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides advanced syntax highlighting and parsing.
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Automatically inserts and deletes paired characters.
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Provides smart commenting functionality.
- **[nvim-surround](https://github.com/kylechui/nvim-surround)**: Facilitates manipulation of surrounding characters.
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)**: Integrates terminal functionality within Neovim.
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)**: File explorer plugin.

### Git Integration

- **[Neogit](https://github.com/NeogitOrg/neogit)**: Provides a Magit-like interface for Git operations.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Displays Git changes in the sign column and provides hunk management.
- **[git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)**: Assists in resolving Git merge conflicts.
- **[repolink.nvim](https://github.com/9seconds/repolink.nvim)**: Generates repository links for GitHub, GitLab, and Bitbucket.

### LSP and Completion

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Configuration for Neovim's built-in LSP client.
- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: Manages and installs LSP servers, DAP servers, linters, and formatters.
- **[none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)**: Provides additional formatting and linting capabilities.
- **[blink.cmp](https://github.com/saghen/blink.cmp)**: Completion engine.
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: Snippet engine.

## 🔧 Customization

This configuration is designed to be easily customizable:

1. **Core Settings**: Edit `lua/core/options.lua` to change Vim options
2. **Keymaps**: Modify `lua/core/keymaps.lua` to customize key bindings
3. **Plugins**: Add or remove plugins by editing files in `lua/plugins/`
4. **LSP**: Configure language servers in `lua/plugins/lsp.lua`
5. **Styling**: Adjust theme settings in `lua/plugins/ui.lua`
6. **Git**: Customize Git integration in `lua/plugins/git.lua`

## Git Workflow Features

This configuration provides integrated Git functionality:

### Neogit

Neogit offers a comprehensive Git interface within Neovim. It enables:

- Staging and unstaging of files and hunks.
- Committing changes with integrated message editing.
- Pulling and pushing to remote repositories.
- Branch management and navigation.
- Viewing commit history and diffs.

### Git Conflict Resolution

Visual indicators for merge conflicts are provided, along with commands for resolution:

- Options to choose "ours", "theirs", both versions, or neither.
- Navigation between conflicts using `]x` and `[x`.
- Streamlined conflict resolution during merges and rebases.

### Gitsigns

Gitsigns displays Git changes in the gutter and provides hunk management capabilities:

- Staging, resetting, and navigating between hunks.
- Previewing changes before committing.
- Toggling line blame information.

### GitHub/GitLab Integration

Shareable links to code can be generated using `<leader>gl` for collaborative workflows.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- [Neovim](https://neovim.io/)
- [LazyVim](https://github.com/LazyVim/LazyVim): Inspiration for modular configuration.
- [Gruvbox Theme](https://github.com/ellisonleao/gruvbox.nvim)
- [Neogit](https://github.com/NeogitOrg/neogit): Git interface inspiration.
