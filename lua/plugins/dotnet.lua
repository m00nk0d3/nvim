-- .NET Core 10 development configuration
return {
  -- OmniSharp extended for decompilation support
  { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },

  -- OmniSharp LSP configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = { "Hoffs/omnisharp-extended-lsp.nvim" },
    opts = {
      servers = {
        omnisharp = {
          handlers = {
            ["textDocument/definition"] = function(...)
              return require("omnisharp_extended").handler(...)
            end,
          },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
          enable_decompilation_support = true,
          analyze_open_documents_only = false,
        },
      },
    },
  },

  -- Mason tools for .NET development
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "omnisharp",
        "csharpier",
        "netcoredbg",
      },
    },
  },

  -- DAP configuration for .NET debugging
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")

      -- .NET Core debugger configuration
      dap.adapters.coreclr = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
        args = { "--interpreter=vscode" },
      }

      -- Find the target framework dynamically
      local function get_dll_path()
        local cwd = vim.fn.getcwd()
        local bin_debug = cwd .. "/bin/Debug/"
        local handle = vim.loop.fs_scandir(bin_debug)
        if handle then
          local name = vim.loop.fs_scandir_next(handle)
          while name do
            if name:match("^net%d") then
              return bin_debug .. name .. "/"
            end
            name = vim.loop.fs_scandir_next(handle)
          end
        end
        return bin_debug
      end

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch .NET Core",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ", get_dll_path(), "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
        {
          type = "coreclr",
          name = "Attach to process",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
    end,
  },

  -- Neotest integration for .NET
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = {
      adapters = {
        ["neotest-dotnet"] = {
          dap = { justMyCode = false },
          discovery_root = "solution",
        },
      },
    },
  },

  -- Treesitter parsers for C#
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c_sharp",
      },
    },
  },

  -- .NET keymaps
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>d", group = "dotnet", icon = "󰌛" },
      },
    },
  },

  -- Custom .NET commands
  {
    "nvim-lua/plenary.nvim",
    keys = {
      {
        "<leader>dr",
        function()
          vim.cmd("terminal dotnet run")
        end,
        desc = "Dotnet Run",
      },
      {
        "<leader>db",
        function()
          vim.cmd("terminal dotnet build")
        end,
        desc = "Dotnet Build",
      },
      {
        "<leader>dt",
        function()
          vim.cmd("terminal dotnet test")
        end,
        desc = "Dotnet Test",
      },
    },
  },
}
