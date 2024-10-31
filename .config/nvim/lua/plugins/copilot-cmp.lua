local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = function(fallback)
      fallback()
    end,
  }),
})

return {
  "nvim-cmp",
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
      dependencies = "copilot.lua",
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup(opts)
        -- attach cmp source whenever copilot attaches
        -- fixes lazy-loading issues with the copilot cmp source
        LazyVim.lsp.on_attach(function(client)
          copilot_cmp._on_insert_enter({})
        end, "copilot")
      end,
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, 1, {
      name = "copilot",
      group_index = 1,
      priority = 100,
    })
  end,

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
      ["<CR>"] = function(fallback)
        fallback()
      end,
    }),
  }),
}
