return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        git_ignored = false
      }
    })

    local function open_nvim_tree(data)
      local real_file = vim.fn.filereadable(data.file) == 1
      local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

      if not real_file and not no_name then
        return
      end

      require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end
}
