local ruff = "ruff"
local python_lsp = "pyright"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {}, -- LSP for Lua
        nil_ls = {}, -- LSP for Nix
      },
    },
  },
  -- Clangd for cpp LSP config
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        clangd = {
          keys = {

            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",

              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
          end,
          capabilities = {

            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },

          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
      },
      setup = {
        clangd = function(_, opts)
          local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
          return false
        end,
      },
    },
  },
  -- Python LSP config (ruff and pyright combination)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {

          cmd_env = { RUFF_TRACE = "messages" },

          init_options = {
            settings = {
              logLevel = "error",
            },
          },
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        ruff_lsp = {
          keys = {

            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],

              desc = "Organize Imports",
            },
          },
        },
      },
      setup = {
        [ruff] = function()
          LazyVim.lsp.on_attach(function(client, _)
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end, ruff)
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = { "pyright", "basedpyright", "ruff", "ruff_lsp", ruff, python_lsp }
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
        opts.servers[server].enabled = server == python_lsp or server == ruff
      end
    end,
  },
}
