return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.8',
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
          theme = "ivy",
        }
      },
      extensions = {
        fzf = {},
        ["ui-select"] = {
          require("telescope.themes").get_cursor()
        }
      }
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
  end
}
