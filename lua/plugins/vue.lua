-- Vue.js development configuration
return {
  -- Vue Language Server (Volar) configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          filetypes = { "vue", "typescript", "javascript" },
          init_options = {
            vue = {
              hybridMode = false,
            },
            typescript = {
              tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
            },
          },
        },
      },
    },
  },

  -- Mason tools for Vue development
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "vue-language-server",
        "prettier",
        "eslint-lsp",
      },
    },
  },

  -- Conform formatting with Prettier for Vue
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },
    },
  },

  -- ESLint integration via nvim-lint
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        vue = { "eslint" },
        javascript = { "eslint" },
        typescript = { "eslint" },
      },
    },
  },

  -- Treesitter parsers for Vue
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vue",
        "css",
        "scss",
        "typescript",
        "javascript",
      },
    },
  },

  -- Vue keymaps for navigating sections
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>v", group = "vue", icon = "󰡄" },
      },
    },
  },

  -- Vue section navigation
  {
    "nvim-lua/plenary.nvim",
    keys = {
      {
        "<leader>vs",
        function()
          vim.fn.search("<script", "w")
        end,
        desc = "Go to Script",
        ft = "vue",
      },
      {
        "<leader>vt",
        function()
          vim.fn.search("<template", "w")
        end,
        desc = "Go to Template",
        ft = "vue",
      },
      {
        "<leader>vy",
        function()
          vim.fn.search("<style", "w")
        end,
        desc = "Go to Style",
        ft = "vue",
      },
    },
  },
}
