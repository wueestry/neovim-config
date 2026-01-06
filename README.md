# Neovim Configuration — Summary

## Overview
- This config uses `folke/lazy.nvim` for plugin management (bootstrap in `lua/config/lazy.lua`).
- Plugins live in `lua/plugins/` as one-file-per-plugin returning a spec table (Option A).

## Important Files
- `/home/ryan/.config/nvim/init.lua` — entrypoint (requires `config.lazy`).
- `/home/ryan/.config/nvim/lua/config/lazy.lua` — lazy.nvim bootstrap and setup.
- `/home/ryan/.config/nvim/lua/plugins/` — plugin spec files (one per plugin).

## Installed Plugins
| Plugin (GitHub) | Description |
|-----------------|-------------|
| **rmagatti/auto-session** | Session management: auto-save/restore Neovim sessions. |
| **saghen/blink.cmp** | Fast, extensible completion engine (with copilot, snippets, etc). |
| **catppuccin/nvim** | Modern, customizable colorscheme. |
| **stevearc/conform.nvim** | Formatter manager (format on save, supports many languages). |
| **zbirenbaum/copilot.lua** | GitHub Copilot integration for Neovim. |
| **lewis6991/gitsigns.nvim** | Git integration: signs, hunk navigation, staging, etc. |
| **mfussenegger/nvim-lint** | Asynchronous linter manager. |
| **mason-org/mason.nvim** | LSP/DAP/linter/formatter installer. |
| **mason-org/mason-lspconfig.nvim** | Mason integration for nvim-lspconfig. |
| **nvim-lualine/lualine.nvim** | Fast, customizable statusline. |
| **echasnovski/mini.surround** | Surround text objects (add/change/delete). |
| **echasnovski/mini.pairs** | Auto-pairing for brackets, quotes, etc. |
| **echasnovski/mini.comment** | Fast, minimal commenting. |
| **folke/noice.nvim** | UI/UX enhancements for messages, cmdline, LSP, etc. |
| **obsidian-nvim/obsidian.nvim** | Obsidian integration for note-taking. |
| **stevearc/oil.nvim** | Modern file explorer in Neovim. |
| **NickvanDyke/opencode.nvim** | AI/ChatGPT-like assistant for Neovim. |
| **MeanderingProgrammer/render-markdown.nvim** | Render markdown in Neovim (with treesitter, latex, etc). |
| **folke/snacks.nvim** | UI/UX enhancements (dashboard, notifications, etc). |
| **nvim-treesitter/nvim-treesitter** | Syntax highlighting and code parsing. |
| **folke/trouble.nvim** | Pretty diagnostics, quickfix, and LSP lists. |
| **folke/which-key.nvim** | Displays available keybindings in popup. |

## Keybindings
| Keymap | Mode | Action/Description | Plugin |
|--------|------|--------------------|--------|
| `<leader>bf` | n | Format buffer | conform.nvim |
| `<leader>ac` | n | Toggle Copilot panel | copilot.lua |
| `<leader>bl` | n | Lint buffer | nvim-lint |
| `gd` | n | Goto Definition | LSP (lsp-config) |
| `gr` | n | References | LSP (lsp-config) |
| `-` | n | Open Oil file explorer | oil.nvim |
| `<leader>aa` | n/x | Ask opencode | opencode.nvim |
| `<leader>ax` | n/x | Execute opencode action | opencode.nvim |
| `<leader>aA` | n/x | Add to opencode | opencode.nvim |
| `<leader>ao` | n/t | Toggle opencode | opencode.nvim |
| `<leader>oo` | n | Change directory to Obsidian vault | obsidian.nvim |
| `<leader>xx` | n | Diagnostics (Trouble) | trouble.nvim |
| `<leader>xX` | n | Buffer Diagnostics (Trouble) | trouble.nvim |
| `<leader>cs` | n | Symbols (Trouble) | trouble.nvim |
| `<leader>cl` | n | LSP Definitions/References (Trouble) | trouble.nvim |
| `<leader>xL` | n | Location List (Trouble) | trouble.nvim |
| `<leader>xQ` | n | Quickfix List (Trouble) | trouble.nvim |
| `<leader>?` | n | Buffer Local Keymaps (which-key) | which-key.nvim |

**Notes:**
- LSP keymaps (like `gd`, `gr`) are buffer-local and set on LSP attach.
- Some plugins (like snacks, mini.pairs, mini.surround, mini.comment, catppuccin, lualine, treesitter, noice) are mostly automatic or UI and do not define user-facing keymaps by default.
- `which-key` groups: `<leader>g` (git), `<leader>f` (file/find), `<leader>u` (ui), `<leader>b` (buffer), `<leader>o` (obsidian), `<leader>a` (ai), `<leader>c` (code), `<leader>x` (trouble).

## How to Install Plugins
1. Open Neovim: `nvim`.
2. Run `:Lazy sync` to install missing plugins (or `:Lazy` to open the UI and manage installs).
3. After installation, restart Neovim. The `catppuccin` colorscheme is applied by its plugin config.

## Useful Commands
- `:Lazy` — open the lazy.nvim UI.
- `:Lazy sync` — install/update plugins.
- `:CheckHealth` — run Neovim health checks.
- `:messages` — view notifier messages from bootstrap/installer.

## Notes & Next Steps
- To add more plugins, drop a new file into `lua/plugins/` returning a plugin spec table.
- If you want per-plugin keybinding documentation included automatically, I can scan plugin files and append them to this README on request.
