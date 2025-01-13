return {
  "Shatur/neovim-ayu",
  config = function()
    require("ayu").setup({
      mirage = true,
      terminal = true,
    })
    require("ayu").colorscheme()
    local colors = require("ayu.colors")

    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = colors.comment })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = colors.comment })
  end
}
