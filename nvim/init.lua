-- Options
vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.mouse = "a"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.winborder = "rounded"
vim.opt_local.conceallevel = 2

vim.o.swapfile = false
vim.o.undofile = true -- persistent undo, since swapfile is off

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes" -- avoid text shifting when diagnostics appear
vim.o.updatetime = 250
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 8
vim.o.confirm = true -- prompt to save instead of erroring on unsaved changes

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)


-- Plugins
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-mini/mini.pick" },
  { src = "https://github.com/sainnhe/everforest" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-mini/mini.diff" },
  { src = "https://github.com/obsidian-nvim/obsidian.nvim" },
})

vim.cmd.colorscheme("everforest")

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- File explorer (netrw)
vim.g.netrw_liststyle = 3 -- tree view
vim.g.netrw_banner = 0 -- hide the top help banner
vim.g.netrw_winsize = 15 -- explorer takes 25% width when split
vim.g.netrw_browse_split = 4 -- open files in the previous window
vim.g.netrw_altv = 1 -- vertical splits open to the right
vim.keymap.set("n", "<leader>b", ":Lexplore<CR>", { silent = true, desc = "File explorer" })

-- LSP
vim.lsp.enable({ "lua_ls", "pyright", "beancount" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
vim.keymap.set("n", "<leader>td", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not current })
end, { desc = "Toggle diagnostic virtual text" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- Fuzzy finder
require("mini.pick").setup()
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Find buffers" })

-- Treesitter (highlighting only; `vim.treesitter.start()` is what actually turns it on per buffer)
local ts_langs = { "lua", "python", "vim", "vimdoc", "query" }
require("nvim-treesitter").install(ts_langs)
vim.api.nvim_create_autocmd("FileType", {
  pattern = ts_langs,
  callback = function()
    vim.treesitter.start()
  end,
})

-- Git diff signs
require("mini.diff").setup()

-- Filetypes
vim.filetype.add({
  extension = {
    beancount = "beancount",
    bean = "beancount",
  },
})


require("obsidian").setup {
  legacy_commands = false, -- this will be removed in 4dd.0.0
  picker = {
    name = "mini.pick", -- use snacks picker
  },
  workspaces = {
    {
      name = "personal",
      path = "~/Documents/Obsidian",
    },
  }
}
