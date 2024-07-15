return {
  {
    "nkakouros-original/scrollofffraction.nvim",
    lazy = true,
    config = function()
      require("scrollofffraction.nvim").setup({
        scrolloff_fraction = 0.3,
        scrolloff_absolute_filetypes = { "qf", "markdown" },
        scrolloff_absolute_value = 5,
      })
    end,
  },
}
