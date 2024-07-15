-- vim options

vim.keymap.set("n", "<leader>os", ":Telescope find_files search_dirs=.<cr>")

-- font settings
vim.g.have_nerd_font = true

-- highlight on search
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- line cursor
vim.opt.cursorline = true

-- line numbers
vim.wo.number = true
vim.opt.relativenumber = true

-- for markdown obsidian
vim.opt.conceallevel = 2

-- save undo history
vim.o.undofile = true

-- no idea something about line length
vim.o.breakindent = true

-- line wrapping
vim.opt.wrap = false

-- page scrolling
vim.opt.scrolloff = 999

-- preview command
vim.opt.inccommand = "split"

-- screen splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- search terms
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- better completion experience apparently
vim.o.completeopt = "menuone,noselect"

-- decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- space formatting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- system clipboard
vim.opt.clipboard = "unnamedplus"

-- terminal colors
vim.opt.termguicolors = true

-- visual block settings
vim.opt.virtualedit = "block"

-- vim mappings
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- yank autocmd to highight
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.opt.timeout = false
