return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zitchdog-night",
    },
  },
  {
    "theamallalgi/zitchdog",
    lazy = false,
    priority = 1000,
  },
}
