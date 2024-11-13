return {
  {
    "nvim-telescope/telescope-media-files.nvim",
    config = function()
      require("telescope").load_extension("media_files")
      require("telescope").setup({
        extensions = {
          media_files = {
            -- filetypes whitelist
            -- defaults to the empty table
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
          },
        },
      })
    end,
  },
}
