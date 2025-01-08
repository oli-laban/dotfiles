return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "Shatur/neovim-ayu",
  },
  config = function()
    require("bufferline").setup({})
  end
}
