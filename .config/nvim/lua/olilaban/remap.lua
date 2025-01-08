local which_key = require("which-key")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf }

    local mappings = {
      { "gd", vim.lsp.buf.definition, desc = "Go to definition" },
      { "K",  vim.lsp.buf.hover,      desc = "Show hover information" },
      {
        icon = "LSP",
        { "<leader>a", vim.lsp.buf.code_action,      desc = "Code action" },
        { "<leader>r", vim.lsp.buf.references,       desc = "References" },
        { "<leader>n", vim.lsp.buf.rename,           desc = "Rename" },
        { "<leader>w", vim.lsp.buf.workspace_symbol, desc = "Workspace symbol" },
      }
    }

    which_key.add(mappings, opts)

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = event.buf,
      callback = function()
        vim.lsp.buf.format({ async = false, id = event.data.client_id })
      end
    })
  end
})

local general_mappings = {
  { "<leader>e",  vim.cmd.Ex,                                             desc = "Open file explorer" },
  { "<leader>p",  '"_dP',                                                 desc = "Paste without overwrite" },
  { "<leader>s",  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Search and replace word under cursor" },
  { "J",          ":m '>+1<CR>gv=gv",                                     desc = "Move selection down",                 mode = "v" },
  { "K",          ":m '<-2<CR>gv=gv",                                     desc = "Move selection up",                   mode = "v" },
  { "J",          "mzJ`z" },
  { "<C-d>",      "<C-d>zz" },
  { "<C-u>",      "<C-u>zz" },
  { "n",          "nzzzv" },
  { "N",          "Nzzzv" },
  { "<leader>y",  "\"+y",                                                 desc = "Copy to system clipboard" },
  { "<leader>y",  "\"+y",                                                 desc = "Copy to system clipboard",            mode = "v" },
  { "<leader>Y",  "\"+Y",                                                 desc = "Copy line to system clipboard" },
  { "<Enter>",    "o<ESC>",                                               desc = "New line below" },
  { "<S-Enter>",  "O<ESC>",                                               desc = "New line above" },
  { "<leader>u",  vim.cmd.UndotreeToggle,                                 desc = "Toggle undotree" },
  { "<leader>gs", vim.cmd.Git,                                            desc = "Git status" },
}

which_key.add(general_mappings)
