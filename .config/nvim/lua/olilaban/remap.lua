local which_key = require("which-key")

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
}

which_key.add(general_mappings)
