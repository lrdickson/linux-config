-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.wrap = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.g["ollama_url"] = os.getenv("OLLAMA_URL") or "http://localhost:11434"
vim.g["ollama_model"] = os.getenv("OLLAMA_MODEL") or "llama3.1"
