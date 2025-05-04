# Modern Neovim Configuration

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![License](https://img.shields.io/github/license/neovim/neovim?style=for-the-badge&logo=)

A carefully designed Neovim configuration focused on modern development with exceptional code intelligence, aesthetics, and productivity enhancements.

<div align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" alt="Catppuccin Theme" width="600px"/>
</div>

## ✨ Features

- **🚀 Lazy Loading** - Blazing fast startup with [lazy.nvim](https://github.com/folke/lazy.nvim)
- **🔍 Intelligent Code Navigation** - Powered by [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- **🌲 Advanced Syntax Highlighting** - Using [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- **🧠 LSP Integration** - Full language server support for Lua, C/C++, and more
- **✏️ Smart Formatting** - Auto-formatting with range support
- **🛠️ Code Completion** - Context-aware suggestions with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- **🎨 Beautiful UI** - Elegant [Catppuccin](https://github.com/catppuccin/nvim) theme with custom integrations
- **📊 Status Line** - Informative and attractive status line with relative paths
- **🧩 Modular Design** - Easily customizable configuration structure
- **🔄 Git Integration** - Comprehensive Git workflow with [Neogit](https://github.com/NeogitOrg/neogit) and conflict resolution

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

| Category | Key | Mode | Action |
|----------|-----|------|--------|
| **Leader** | `<Space>` | Normal | Leader key |
| **Window Navigation** ||||
| | `<C-h>` | Normal | Navigate left |
| | `<C-j>` | Normal | Navigate down |
| | `<C-k>` | Normal | Navigate up |
| | `<C-l>` | Normal | Navigate right |
| | `<C-Up/Down/Left/Right>` | Normal | Resize windows |
| **Buffer Navigation** ||||
| | `<S-h>` | Normal | Previous buffer |
| | `<S-l>` | Normal | Next buffer |
| | `<leader>bc` | Normal | Close buffer |
| | `<leader>bn` | Normal | Next buffer |
| | `<leader>bp` | Normal | Previous buffer |
| **File Operations** ||||
| | `<leader>ff` | Normal | Find files |
| | `<leader>fg` | Normal | Live grep (search in files) |
| | `<leader>fb` | Normal | Browse buffers |
| | `<leader>fo` | Normal | Find recent files |
| | `<leader>fe` | Normal | File explorer |
| **UI Toggles** ||||
| | `<leader>th` | Normal | Toggle search highlight |
| | `<leader>tn` | Normal | Toggle relative numbers |
| **Clipboard Operations** ||||
| | `<leader>y` | Normal | Copy to system clipboard |
| | `<leader>Y` | Normal | Copy to end of line to system clipboard |
| | `<leader>y` | Visual | Copy selection to system clipboard |
| | `<leader>yy` | Normal | Copy current line to system clipboard |
| | `<leader>p` | Normal | Paste from system clipboard after cursor |
| | `<leader>P` | Normal | Paste from system clipboard before cursor |
| | `<leader>p` | Visual | Paste from system clipboard over selection |
| **Text Manipulation** ||||
| | `<` / `>` | Visual | Indent/unindent and stay in visual |
| | `J` / `K` | Visual | Move selected text down/up |
| | `p` | Visual | Paste without yanking |

### Git Features

| Category | Key | Mode | Action |
|----------|-----|------|--------|
| **Neogit** ||||
| | `<leader>gg` | Normal | Open Neogit main interface |
| | `<leader>gc` | Normal | Neogit commit |
| | `<leader>gp` | Normal | Neogit pull |
| | `<leader>gP` | Normal | Neogit push |
| **Git Conflict** ||||
| | `<leader>gco` | Normal | Choose ours in conflict |
| | `<leader>gct` | Normal | Choose theirs in conflict |
| | `<leader>gcb` | Normal | Choose both in conflict |
| | `<leader>gcn` | Normal | Choose none in conflict |
| | `]x` | Normal | Next git conflict |
| | `[x` | Normal | Previous git conflict |
| **Git Hunks** ||||
| | `<leader>hs` | Normal | Stage hunk |
| | `<leader>hr` | Normal | Reset hunk |
| | `<leader>hb` | Normal | Blame line |
| | `<leader>hp` | Normal | Preview hunk |
| | `<leader>hd` | Normal | Show diff |
| | `]c` / `[c` | Normal | Next/previous hunk |
| **Git Links** ||||
| | `<leader>gl` | Normal | Get GitHub link |
| | `<leader>gL` | Normal | Get GitHub link with line number |
| **Git Telescope** ||||
| | `<leader>gs` | Normal | Git status |
| | `<leader>gb` | Normal | Git branches |

### LSP Features

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gr` | Normal | Go to references |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `K` | Normal | Show hover documentation |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code actions |
| `<leader>lf` | Normal | Format document |
| `<leader>lf` | Visual | Format selection |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |

## 🧰 Plugin Ecosystem

This configuration includes a carefully selected set of plugins for a complete development environment:

### Core
- **[lazy.nvim](https://github.com/folke/lazy.nvim)**: Modern plugin manager
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)**: Lua utilities

### UI
- **[catppuccin/nvim](https://github.com/catppuccin/nvim)**: Modern, soft color scheme
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: Statusline with relative paths
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)**: Icons for UI components
- **[which-key.nvim](https://github.com/folke/which-key.nvim)**: Displays keybinding help
- **[dressing.nvim](https://github.com/stevearc/dressing.nvim)**: Better UI elements
- **[nvim-notify](https://github.com/rcarriga/nvim-notify)**: Notification system

### Editor Enhancements
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Fuzzy finder
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Advanced syntax highlighting
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Auto pair brackets and quotes
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Smart commenting
- **[nvim-surround](https://github.com/kylechui/nvim-surround)**: Manipulate surroundings
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)**: Terminal integration
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)**: File explorer

### Git Integration
- **[Neogit](https://github.com/NeogitOrg/neogit)**: Magit-like interface for Git
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git decorations and hunk management
- **[git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)**: Git conflict resolution
- **[repolink.nvim](https://github.com/9seconds/repolink.nvim)**: GitHub URL handler

### LSP and Completion
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: LSP configuration
- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: LSP/DAP/linter manager
- **[none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)**: Additional formatting/linting
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: Completion engine
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: Snippet engine

## 🔧 Customization

This configuration is designed to be easily customizable:

1. **Core Settings**: Edit `lua/core/options.lua` to change Vim options
2. **Keymaps**: Modify `lua/core/keymaps.lua` to customize key bindings
3. **Plugins**: Add or remove plugins by editing files in `lua/plugins/`
4. **LSP**: Configure language servers in `lua/plugins/lsp.lua`
5. **Styling**: Adjust theme settings in `lua/plugins/ui.lua`
6. **Git**: Customize Git integration in `lua/plugins/git.lua`

## 🌟 Git Workflow Features

This configuration includes comprehensive Git integration:

### Neogit
A Magit-inspired Git interface that provides a complete Git workflow within Neovim. Open with `<leader>gg` and:
- Stage/unstage files and hunks
- Commit changes with proper commit message editing
- Pull/push to remote repositories
- Browse and manage branches
- View commit history and diffs

### Git Conflict Resolution
Visual indicators for merge conflicts with easy resolution commands:
- Choose "ours", "theirs", both versions, or neither
- Navigate between conflicts with `]x` and `[x`
- Quickly resolve conflicts during merges and rebases

### Gitsigns
Shows Git changes in the gutter with powerful hunk management:
- Stage, reset, and navigate between hunks
- Preview changes before committing
- Toggle line blame and see commit information

### GitHub/GitLab Integration
Easily get shareable links to your code with `<leader>gl` for collaborating with teammates.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgements

- [Neovim](https://neovim.io/) - The future of Vim
- [LazyVim](https://github.com/LazyVim/LazyVim) - Inspiration for modular configuration
- [Catppuccin Theme](https://github.com/catppuccin/nvim) - Beautiful color scheme
- [Neogit](https://github.com/NeogitOrg/neogit) - Git interface inspiration