# 🚀 m00nk0d3's Neovim Configuration

A modern, feature-rich Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim) with extensive language support, beautiful themes, and powerful productivity enhancements.

[![Neovim](https://img.shields.io/badge/Neovim-0.10.0+-green.svg?style=flat-square&logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Enabled-blue.svg?style=flat-square)](https://github.com/LazyVim/LazyVim)
[![License](https://img.shields.io/badge/License-Apache%202.0-orange.svg?style=flat-square)](LICENSE)

<div align="center">
  <img src="https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white" alt="Lua">
  <img src="https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript">
  <img src="https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vue.js&logoColor=4FC08D" alt="Vue">
  <img src="https://img.shields.io/badge/.NET-5C2D91?style=for-the-badge&logo=.net&logoColor=white" alt=".NET">
</div>

## 📋 Table of Contents

- [✨ Features](#-features)
- [📦 Prerequisites](#-prerequisites)
- [🔧 Installation](#-installation)
- [📂 Configuration Structure](#-configuration-structure)
- [🔌 Key Plugins](#-key-plugins)
- [⌨️ Keybindings](#️-keybindings)
- [🎨 Themes](#-themes)
- [🛠️ Language Support](#️-language-support)
- [🔧 Customization](#-customization)
- [❓ Troubleshooting](#-troubleshooting)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

## ✨ Features

- 🚀 **LazyVim Base** - Built on top of LazyVim for a solid foundation
- 🎯 **Harpoon Integration** - Lightning-fast file navigation with Harpoon 2
- 🎨 **Multiple Themes** - Everforest (default), Catppuccin, Gruvbox, Kanagawa, Tokyo Night, and more
- 💻 **Language Support** - TypeScript, Vue.js, .NET/C#, SQL, Markdown, and more
- 📦 **Lazy Loading** - Optimized plugin loading for fast startup times
- 🔍 **Telescope** - Powerful fuzzy finder for files, text, and more
- 🌳 **Neo-tree** - Modern file explorer with git integration
- ✏️ **LSP Powered** - Full Language Server Protocol support with auto-completion
- 🎯 **Flash.nvim** - Enhanced navigation and search
- 🔄 **Git Integration** - Gitsigns for inline git status and operations
- ⚡ **Auto-formatting** - Conform.nvim for consistent code formatting
- 🎨 **Theme Hot-reload** - Live theme updates from Omarchy configuration

## 📦 Prerequisites

Before installing this configuration, ensure you have the following:

- **Neovim** >= 0.10.0
  ```bash
  nvim --version
  ```

- **Git** (for cloning and plugin management)
  ```bash
  git --version
  ```

- **Node.js and npm** (for LSP servers and some plugins)
  ```bash
  node --version
  npm --version
  ```

- **Ripgrep** (for Telescope live grep)
  ```bash
  rg --version
  ```

- **A Nerd Font** (for icons) - [Download here](https://www.nerdfonts.com/)
  - Recommended: JetBrainsMono Nerd Font, FiraCode Nerd Font, or Hack Nerd Font

### Optional Dependencies

- **fd** - Faster alternative to find (used by Telescope)
  ```bash
  fd --version
  ```

- **.NET SDK** - For C#/.NET development
  ```bash
  dotnet --version
  ```

- **lazygit** - Terminal UI for git (optional but recommended)
  ```bash
  lazygit --version
  ```

## 🔧 Installation

### Fresh Installation

1. **Backup your existing Neovim configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/m00nk0d3/nvim.git ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```

4. **Wait for lazy.nvim to install plugins**:
   - On first launch, lazy.nvim will automatically install itself and all configured plugins
   - This may take a few minutes depending on your internet connection
   - You'll see a progress window showing plugin installation status

5. **Restart Neovim** after all plugins are installed:
   ```bash
   :qa
   nvim
   ```

6. **Check health** (optional but recommended):
   ```vim
   :checkhealth
   ```

### Installation on Additional Machines

Simply clone the repository to `~/.config/nvim` on each machine and launch Neovim. The configuration is portable and will automatically set itself up.

## 📂 Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point - loads config.lazy
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Lazy.nvim bootstrap and setup
│   │   ├── autocmds.lua       # Auto commands
│   │   ├── keymaps.lua        # Custom keybindings
│   │   └── options.lua        # Neovim options and settings
│   └── plugins/
│       ├── harpoon.lua        # Harpoon 2 configuration
│       ├── theme.lua          # Default theme (Everforest)
│       ├── dotnet.lua         # .NET/C# language support
│       ├── vue.lua            # Vue.js support
│       ├── sql.lua            # SQL support
│       ├── markdown.lua       # Markdown enhancements
│       ├── all-themes.lua     # Additional theme configurations
│       └── ...                # Other plugin configurations
├── lazy-lock.json             # Plugin version lock file
├── lazyvim.json               # LazyVim extras configuration
└── stylua.toml                # Lua formatter configuration
```

### How It Works

1. **init.lua** - The entry point that bootstraps the configuration
2. **lua/config/lazy.lua** - Sets up lazy.nvim plugin manager and loads LazyVim
3. **lua/config/*.lua** - Core Neovim settings, keymaps, and auto commands
4. **lua/plugins/*.lua** - Plugin specifications and configurations (automatically loaded by lazy.nvim)

## 🔌 Key Plugins

### Core Plugins

| Plugin | Description |
|--------|-------------|
| [LazyVim](https://github.com/LazyVim/LazyVim) | Neovim configuration framework |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Modern plugin manager with lazy loading |
| [Harpoon 2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) | Quick file navigation and marks |

### Editor Enhancements

| Plugin | Description |
|--------|-------------|
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, buffers, grep, and more |
| [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer with git integration |
| [Flash.nvim](https://github.com/folke/flash.nvim) | Enhanced navigation and search |
| [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Git integration with inline status |
| [which-key](https://github.com/folke/which-key.nvim) | Keybinding helper and documentation |
| [yanky.nvim](https://github.com/gbprod/yanky.nvim) | Improved yank and paste functionality |

### Language Support

| Plugin | Description |
|--------|-------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration and setup |
| [blink.cmp](https://github.com/Saghen/blink.cmp) | Fast completion plugin |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting with multiple formatters |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Better syntax highlighting and code understanding |

### Themes

| Theme | Description |
|-------|-------------|
| [Everforest](https://github.com/neanias/everforest-nvim) | Default - Comfortable green theme (soft background) |
| [Catppuccin](https://github.com/catppuccin/nvim) | Soothing pastel theme with multiple flavors |
| [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim) | Retro groove color scheme |
| [Kanagawa](https://github.com/rebelot/kanagawa.nvim) | Dark theme inspired by colors of famous painting |
| [Tokyo Night](https://github.com/folke/tokyonight.nvim) | Clean, dark theme with vibrant colors |
| [Rose Pine](https://github.com/rose-pine/neovim) | Soho vibes for Neovim |

## ⌨️ Keybindings

### General LazyVim Keybindings

LazyVim comes with sensible defaults. Here are some essential ones:

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>` | - | Space (leader key) |
| `<leader>l` | Normal | Open Lazy plugin manager |
| `<leader>ff` | Normal | Find files (Telescope) |
| `<leader>fg` | Normal | Live grep (Telescope) |
| `<leader>fb` | Normal | Find buffers (Telescope) |
| `<leader>e` | Normal | Toggle file explorer (Neo-tree) |
| `<leader>gg` | Normal | Open Lazygit |
| `<leader>bd` | Normal | Delete buffer |
| `<leader>qq` | Normal | Quit all |
| `gcc` | Normal | Toggle line comment |
| `gc` | Visual | Toggle selection comment |
| `<leader>ur` | Normal | Toggle relative line numbers |

### Harpoon Keybindings

Harpoon 2 provides lightning-fast file navigation:

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>a` | Normal | Add current file to Harpoon |
| `<C-e>` | Normal | Toggle Harpoon quick menu |
| `<C-h>` | Normal | Navigate to Harpoon file 1 |
| `<C-j>` | Normal | Navigate to Harpoon file 2 |
| `<C-k>` | Normal | Navigate to Harpoon file 3 |
| `<C-l>` | Normal | Navigate to Harpoon file 4 |

**Harpoon Workflow**:
1. Open files you frequently switch between
2. Press `<leader>a` in each file to add them to Harpoon
3. Use `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` to instantly jump between them
4. Press `<C-e>` to see and manage your Harpoon list

### LSP Keybindings

| Key | Mode | Description |
|-----|------|-------------|
| `gd` | Normal | Go to definition |
| `gr` | Normal | Go to references |
| `gI` | Normal | Go to implementation |
| `gy` | Normal | Go to type definition |
| `K` | Normal | Hover documentation |
| `<leader>ca` | Normal | Code action |
| `<leader>cr` | Normal | Rename symbol |
| `<leader>cf` | Normal | Format document |
| `]d` | Normal | Next diagnostic |
| `[d` | Normal | Previous diagnostic |
| `<leader>cd` | Normal | Line diagnostics |

### Window Management

| Key | Mode | Description |
|-----|------|-------------|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to bottom window |
| `<C-k>` | Normal | Move to top window |
| `<C-l>` | Normal | Move to right window |
| `<leader>-` | Normal | Split window below |
| `<leader>\|` | Normal | Split window right |
| `<leader>wd` | Normal | Delete window |

## 🎨 Themes

### Default Theme

The default theme is **Everforest** with a soft background variant, providing a comfortable coding experience with warm, natural colors.

### Switching Themes

To change themes:

1. **Via Command Line**:
   ```vim
   :colorscheme catppuccin
   :colorscheme gruvbox
   :colorscheme kanagawa
   :colorscheme tokyonight
   :colorscheme rose-pine
   ```

2. **Via Telescope**:
   ```vim
   :Telescope colorscheme
   ```

3. **Permanently Change Default Theme**:
   Edit `lua/plugins/theme.lua` and modify the colorscheme setting.

### Theme Hot-reload

This configuration includes Omarchy theme integration for live theme updates. When your Omarchy configuration changes, the Neovim theme will automatically reload to match.

## 🛠️ Language Support

### Built-in Language Support

This configuration provides rich support for:

- **TypeScript/JavaScript** - Full LSP support with tsserver
- **Vue.js** - Vue language server with TypeScript integration
- **.NET/C#** - OmniSharp LSP and .NET Core tooling
- **SQL** - SQL language server and syntax highlighting
- **Markdown** - Enhanced markdown editing with preview capabilities
- **Lua** - Full LSP support for Neovim configuration
- **JSON** - Schema validation and formatting
- **YAML** - Syntax highlighting and validation
- **And many more** - LazyVim provides LSP support for dozens of languages

### Installing Additional Language Servers

Use the Mason plugin manager (included with LazyVim):

```vim
:Mason
```

This opens an interface where you can:
- Browse available language servers, formatters, and linters
- Install/uninstall with a single keypress
- Update all tools automatically

### Adding Language Support

To add support for a new language:

1. Create a new file in `lua/plugins/` (e.g., `lua/plugins/python.lua`):
   ```lua
   return {
     {
       "nvim-treesitter/nvim-treesitter",
       opts = function(_, opts)
         vim.list_extend(opts.ensure_installed, { "python" })
       end,
     },
   }
   ```

2. Install the language server via Mason:
   ```vim
   :Mason
   ```
   Search for and install `pyright` (or your preferred Python LSP)

3. Restart Neovim

## 🔧 Customization

### Adding New Plugins

1. Create a new file in `lua/plugins/` directory:
   ```bash
   touch lua/plugins/my-plugin.lua
   ```

2. Add your plugin configuration:
   ```lua
   return {
     "username/plugin-name",
     dependencies = {
       "dependency1",
       "dependency2",
     },
     config = function()
       require("plugin-name").setup({
         -- your configuration
       })
     end,
   }
   ```

3. Restart Neovim or run:
   ```vim
   :Lazy sync
   ```

### Modifying Keybindings

Edit `lua/config/keymaps.lua` to add or modify keybindings:

```lua
local keymap = vim.keymap

-- Add your custom keybindings
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
```

### Changing Neovim Options

Edit `lua/config/options.lua` to modify Neovim settings:

```lua
local opt = vim.opt

-- Example customizations
opt.relativenumber = false  -- Disable relative line numbers
opt.wrap = true             -- Enable line wrapping
opt.colorcolumn = "80"      -- Show column at 80 characters
```

### Overriding LazyVim Defaults

Create or edit files in `lua/plugins/` to override LazyVim defaults:

```lua
return {
  "LazyVim/LazyVim",
  opts = {
    -- your overrides
    colorscheme = "catppuccin",
  },
}
```

### Adding LazyVim Extras

Edit `lazyvim.json` to enable additional LazyVim extras:

```json
{
  "extras": [
    "lazyvim.plugins.extras.lang.python",
    "lazyvim.plugins.extras.lang.go",
    "lazyvim.plugins.extras.ui.alpha"
  ]
}
```

Or use the LazyExtras command:
```vim
:LazyExtras
```

## ❓ Troubleshooting

### Plugins Not Loading

**Problem**: Plugins don't seem to be working after installation.

**Solution**:
```vim
:Lazy sync      " Sync all plugins
:Lazy clean     " Remove unused plugins
:Lazy restore   " Restore plugins from lockfile
```

### LSP Not Working

**Problem**: Language server features aren't working.

**Solution**:
1. Check if the language server is installed:
   ```vim
   :Mason
   ```

2. Check LSP status:
   ```vim
   :LspInfo
   ```

3. Install the required language server:
   ```vim
   :LspInstall <language>
   ```

4. Check for errors:
   ```vim
   :checkhealth
   ```

### Slow Startup

**Problem**: Neovim takes a long time to start.

**Solution**:
1. Check startup time:
   ```bash
   nvim --startuptime startup.log
   ```

2. Review which plugins are slow in `startup.log`

3. Consider lazy-loading slow plugins:
   ```lua
   return {
     "slow-plugin",
     lazy = true,        -- Don't load on startup
     event = "VeryLazy", -- Load after startup
   }
   ```

### Theme Not Loading

**Problem**: Theme doesn't look right or isn't loading.

**Solution**:
1. Ensure your terminal supports 24-bit color:
   ```lua
   vim.opt.termguicolors = true  -- Should be in options.lua
   ```

2. Try setting the colorscheme manually:
   ```vim
   :colorscheme everforest
   ```

3. Check if the theme plugin is installed:
   ```vim
   :Lazy
   ```

### Icons Not Displaying

**Problem**: Icons appear as boxes or question marks.

**Solution**:
1. Install a Nerd Font from [nerdfonts.com](https://www.nerdfonts.com/)
2. Set your terminal to use the Nerd Font
3. Restart your terminal

### Harpoon Not Working

**Problem**: Harpoon keybindings don't work.

**Solution**:
1. Check if Harpoon is loaded:
   ```vim
   :Lazy
   ```

2. Verify keybindings in `lua/plugins/harpoon.lua`

3. Ensure you're using Harpoon 2:
   ```lua
   -- Check that your config uses: "ThePrimeagen/harpoon"
   -- With branch = "harpoon2"
   ```

### General Debugging

For any issues:

1. **Check health**:
   ```vim
   :checkhealth
   ```

2. **View logs**:
   ```vim
   :messages        " View Neovim messages
   :Lazy log        " View Lazy.nvim logs
   ```

3. **Restart with no config** (to test if issue is with config):
   ```bash
   nvim --clean
   ```

4. **Reset plugin cache**:
   ```bash
   rm -rf ~/.local/share/nvim
   rm -rf ~/.cache/nvim
   ```

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/m00nk0d3/nvim/issues).

### How to Contribute

1. Fork the repository
2. Create your feature branch:
   ```bash
   git checkout -b feature/amazing-feature
   ```

3. Commit your changes:
   ```bash
   git commit -m 'Add some amazing feature'
   ```

4. Push to the branch:
   ```bash
   git push origin feature/amazing-feature
   ```

5. Open a Pull Request

### Reporting Issues

When reporting issues, please include:
- Your Neovim version (`:version`)
- Your operating system
- Steps to reproduce the issue
- Expected behavior vs. actual behavior
- Any error messages (`:messages`)

## 📄 License

This configuration is licensed under the [Apache License 2.0](LICENSE).

---

<div align="center">

**[⬆ back to top](#-m00nk0d3s-neovim-configuration)**

Made with ❤️ by [m00nk0d3](https://github.com/m00nk0d3)

If you find this configuration helpful, consider giving it a ⭐!

</div>
