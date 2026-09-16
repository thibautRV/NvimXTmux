return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "bash", "markdown", "python", "javascript" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
