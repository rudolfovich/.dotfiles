-- Load Lazy
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Colorscheme
  {
    "altercation/vim-colors-solarized",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.o.background = "dark" -- or "light"
      vim.o.background = "light"

      vim.cmd([[colorscheme solarized]])
    end,
  },

  -- Syntax highlight and LSP
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {}
      vim.opt.termguicolors = true
    end,
  },
})

-- Use bufferline tab navigation
vim.keymap.set("n", "<C-S-]>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-S-[>", ":BufferLineCyclePrev<CR>")

require("bufferline").setup {
  options = {
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", padding = 1 },
    },
    buffer_close_icon = "",
    show_buffer_close_icons = true,
    show_close_icon = false,
    always_show_bufferline = true,
    separator_style = "thin",
    tab_size = 18,
  },
}

-- Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Recommended settings
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Open nvim-tree automatically
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

-- Enable mouse support
vim.opt.mouse = "a"

-- Enable clipboard support
vim.opt.clipboard = "unnamedplus"

-- Enable persistent undo
vim.opt.undofile = true

-- Enable syntax highlighting
vim.cmd([[syntax on]])

-- Enable LSP for Python
-- vim.lsp.enable('pyright')
-- Enable LSP for JavaScript/TypeScript
-- vim.lsp.enable('tsserver')
-- Enable LSP for C++
vim.lsp.enable('clangd')

-- Bindings for nvim-tree
vim.keymap.set("n", "<C-t>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + f to search in nvim-tree
vim.keymap.set("n", "<C-S-f>", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + n to create a new file in nvim-tree
vim.keymap.set("n", "<C-S-n>", ":NvimTreeCreate<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + d to delete a file in nvim-tree
vim.keymap.set("n", "<C-S-d>", ":NvimTreeDelete<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + r to rename a file in nvim-tree
vim.keymap.set("n", "<C-S-r>", ":NvimTreeRename<CR>", { noremap = true, silent = true })

-- Bindings Vim
-- Ctrl + Shift + ] to navigate to the next buffer
vim.keymap.set("n", "<C-S-]>", ":bnext<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + [ to navigate to the previous buffer
-- vim.keymap.set("n", "<C-S-[>", ":bprevious<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + q to close the current buffer
-- vim.keymap.set("n", "<C-S-q>", ":bd<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + s to save the current buffer
vim.keymap.set("n", "<C-S-s>", ":w<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + c to copy the current line
vim.keymap.set("n", "<C-S-c>", ":let @+ = getline('.')<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + v to paste the copied line
vim.keymap.set("n", "<C-S-v>", ":execute 'normal! i'.@+<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + x to cut the current line
vim.keymap.set("n", "<C-S-x>", ":let @+ = getline('.')<CR>:execute 'normal! dd'<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + z to redo the last undone change
vim.keymap.set("n", "<C-S-z>", ":redo<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + y to yank (copy) the current line
vim.keymap.set("n", "<C-S-y>", ":let @+ = getline('.')<CR>", { noremap = true, silent = true })
-- Ctrl + Shift +p to paste the yanked line
vim.keymap.set("n", "<C-S-p>", ":execute 'normal! i'.@+<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader>t", ":split | terminal<CR>", { desc = "Open terminal" })
