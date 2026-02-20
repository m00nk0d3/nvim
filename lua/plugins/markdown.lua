-- Obsidian-like markdown experience
return {
  -- Core: obsidian.nvim
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/notes/**.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/notes/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      workspaces = {
        { name = "notes", path = "~/notes" },
      },
      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        template = "daily.md",
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",
      preferred_link_style = "wiki",
      completion = { nvim_cmp = false, min_chars = 2 },
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>mc"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true, desc = "Toggle checkbox" },
        },
      },
      picker = { name = "telescope.nvim" },
      attachments = { img_folder = "attachments" },
    },
    keys = {
      { "<leader>mdt", "<cmd>ObsidianToday<cr>", desc = "Today's note" },
      { "<leader>mdy", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday's note" },
      { "<leader>mdm", "<cmd>ObsidianTomorrow<cr>", desc = "Tomorrow's note" },
      { "<leader>mdd", "<cmd>ObsidianDailies<cr>", desc = "List daily notes" },
      { "<leader>mn", "<cmd>ObsidianNew<cr>", desc = "New note" },
      { "<leader>mss", "<cmd>ObsidianSearch<cr>", desc = "Search content" },
      { "<leader>msf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find note" },
      { "<leader>mst", "<cmd>ObsidianTags<cr>", desc = "Search tags" },
      { "<leader>msb", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
      { "<leader>mt", "<cmd>ObsidianTemplate<cr>", desc = "Insert template" },
      { "<leader>mr", "<cmd>ObsidianRename<cr>", desc = "Rename note" },
      { "<leader>mh", function() vim.cmd("edit ~/notes/index.md") end, desc = "Vault home" },
    },
  },

  -- Rendering: render-markdown.nvim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {
      render_modes = { "n", "c" },
      anti_conceal = { enabled = true },
      heading = { enabled = true, icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " } },
      code = { enabled = true, style = "full", border = "thin" },
      bullet = { enabled = true, icons = { "●", "○", "◆", "◇" } },
      checkbox = {
        enabled = true,
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 " },
      },
      pipe_table = { enabled = true, preset = "round" },
      link = { enabled = true, wiki = { icon = "󱗖 " } },
      callout = {
        note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
        tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
        warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
        important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
      },
    },
  },

  -- LSP: marksman
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { marksman = {} } },
  },

  -- Mason: install marksman
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "marksman" } },
  },

  -- Treesitter: markdown parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "markdown", "markdown_inline" } },
  },

  -- Which-key: keybinding groups
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>m", group = "markdown/notes", icon = "󰠮" },
        { "<leader>md", group = "daily notes", icon = "" },
        { "<leader>ms", group = "search", icon = "" },
      },
    },
  },

  -- Render-markdown keymap
  {
    "MeanderingProgrammer/render-markdown.nvim",
    keys = {
      { "<leader>mv", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle preview" },
    },
  },
}
