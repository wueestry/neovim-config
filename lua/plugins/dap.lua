return {
  -- NOTE: Yes, you can install new plugins here!
  "mfussenegger/nvim-dap",
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    "rcarriga/nvim-dap-ui",

    -- Required dependency for nvim-dap-ui
    "nvim-neotest/nvim-nio",

    -- Installs the debug adapters for you
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      "<leader>dsc",
      function()
        require("dap").continue()
      end,
      desc = "[D]ebug: [S]tart/[C]ontinue",
    },
    {
      "<leader>dsi",
      function()
        require("dap").step_into()
      end,
      desc = "[D]ebug: [S]tep [I]nto",
    },
    {
      "<leader>dso",
      function()
        require("dap").step_over()
      end,
      desc = "[D]ebug: [S]tep [O]ver",
    },
    {
      "<leader>dse",
      function()
        require("dap").step_out()
      end,
      desc = "[D]ebug: [S]tep Out ([E]xit)",
    },
    {
      "<leader>dt",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "[D]ebug: [T]oggle Breakpoint",
    },
    {
      "<leader>db",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "[D]ebug: Set [B]reakpoint",
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      "<F7>",
      function()
        require("dapui").toggle()
      end,
      desc = "Debug: See last session result.",
    },
    {
      "<leader>dtu",
      ":lua require('dapui').toggle()<CR>",
      desc = "[D]ebug [T]oggle [U]i ",
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        "delve",
      },
    })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup({
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    })

    -- ===================================================
    -- Adapters
    -- ====================================================
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/codelldb"),
        args = { "--port", "${port}" },
      },
    }

    -- ===================================================
    -- Configurations
    -- ====================================================
    dap.configurations.cpp = {
      {
        name = "C++: Run file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
      {
        -- If you get an "Operation not permitted" error using this, try disabling YAMA:
        --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        name = "C++: Attach to process",
        type = "codelldb", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
        request = "attach",
        pid = require("dap.utils").pick_process,
        args = {},
      },
      {
        name = "C++: ROS Node",
        type = "codelldb",
        request = "launch",
        -- Might need to consider using vim.ui.input
        program = function()
          local pkgName = vim.fn.input("ROS Package: ", "")
          return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/install/" .. pkgName .. "/lib/" .. pkgName .. "/",
            "file"
          )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    -- Python debugging
    require("nvim-dap-virtual-text").setup()
    require("dap-python").setup()
    table.insert(require("dap").configurations.python, {
      type = "python",
      request = "launch",
      name = "Python: ROS2 lauch test",
      program = "/opt/ros/humble/bin/launch_test",
      args = { "${file}" },
    })

    require("dap-python").test_runner = "pytest"

    -- Change breakpoint icons
    -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    -- local breakpoint_icons = vim.g.have_nerd_font
    --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    -- for type, icon in pairs(breakpoint_icons) do
    --   local tp = 'Dap' .. type
    --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    -- end

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}
