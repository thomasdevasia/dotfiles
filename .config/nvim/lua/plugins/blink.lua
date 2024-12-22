return {
  { "giuxtaposition/blink-cmp-copilot" },
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "supermaven-nvim", "saghen/blink.compat" },
    opts = {
      keymap = {
        preset = "default",
        ["CR"] = {},
        ["<C-CR>"] = { "select_and_accept" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },
      sources = {
        compat = { "supermaven" },
        default = { "copilot", "supermaven" },
        providers = {
          supermaven = {
            kind = "Supermaven",
            score_offset = 100,
            async = true,
          },
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            kind = "Copilot",
            score_offset = 150,
            async = true,
          },
        },
      },
      -- sources = {
      --   default = { "copilot" },
      --   providers = {
      --     copilot = {
      --       name = "copilot",
      --       module = "blink-cmp-copilot",
      --       kind = "Copilot",
      --       score_offset = 100,
      --       async = true,
      --     },
      --   },
      -- },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
      },
      disable_inline_completion = vim.g.ai_cmp,
      ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
    },
  },
}
