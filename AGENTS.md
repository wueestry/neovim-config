# AGENTS.md

## Build, Lint, and Test
- **Format code:** `stylua .` (requires StyLua, see stylua.toml)
- **Check formatting:** `stylua --check .`
- **Lint:** Use `lua-language-server` (lua_ls) or `:LspDiagnostics` in Neovim
- **Test:** No automated tests or test framework present by default
- **Single test:** Not applicable (no test suite)

## Code Style Guidelines
- **Indentation:** 2 spaces (see stylua.toml)
- **Line width:** 120 columns
- **Imports:** Use `require("...")`, group at top of file
- **Naming:**
  - Variables/functions: snake_case
  - Modules: PascalCase or snake_case
- **Formatting:** Run StyLua before committing
- **Types:** Lua is dynamically typed; no type annotations
- **Error handling:** Use idiomatic Lua/Neovim patterns (e.g., check return values, use `vim.api.nvim_err_writeln` for errors)
- **File organization:**
  - Config in `lua/config/`
  - Plugins in `lua/plugins/`
- **LSP:** lua_ls is enabled (see .neoconf.json)
- **General:** Follow idiomatic Lua and Neovim plugin conventions

## Goal
- The goal is to create minimal neovim configuration based on the lazy.nvim plugin loader
