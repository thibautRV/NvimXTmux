return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = false, -- ne propose rien tant que tu ne le demandes pas
          keymap = {
            accept = "<M-l>",  -- Alt-l : ne touche ni au Ctrl-hjkl (tmux/nvim nav) ni au Tab (cmp)
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })
      -- Démarre désactivé : mode apprentissage. Active avec <leader>ta.
      vim.schedule(function()
        vim.cmd("Copilot disable")
      end)
    end,
  },
}
