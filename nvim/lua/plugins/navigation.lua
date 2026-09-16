return {
  {
    -- C'est LE plugin qui fait le lien entre nvim et tmux :
    -- Ctrl-h/j/k/l déplace le focus entre les splits nvim, et quand on est
    -- sur le bord, ça passe la main à tmux pour changer de pane. Aucun
    -- raccourci nvim n'est donc jamais en conflit avec un raccourci tmux :
    -- ils utilisent littéralement la même combinaison pour la même intention.
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft", "TmuxNavigateDown",
      "TmuxNavigateUp", "TmuxNavigateRight", "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },
}
