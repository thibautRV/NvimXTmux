local map = vim.keymap.set

-- NOTE : Ctrl-h/j/k/l ne sont JAMAIS mappés ici.
-- Ils sont gérés par vim-tmux-navigator pour naviguer de façon transparente
-- entre les splits nvim ET les panes tmux (voir plugins/navigation.lua).

-- Fichier
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Sauver" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quitter" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Tout quitter (force)" })

-- Recherche
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Effacer surbrillance recherche" })

-- Déplacer des lignes
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Descendre la ligne" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Monter la ligne" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Descendre la sélection" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Monter la sélection" })

-- Splits nvim (distincts des splits tmux : ici c'est <leader>s, jamais le prefix tmux)
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split horizontal" })
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Fermer le split" })
map("n", "<leader>s=", "<C-w>=", { desc = "Égaliser les splits" })

-- Buffers
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Buffer suivant" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer précédent" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Fermer le buffer" })

-- Fenêtre courante en plein écran temporaire
map("n", "<leader>sm", "<cmd>MaximizerToggle<cr>", { desc = "Maximiser/restaurer le split" })

-- Telescope (fuzzy finder)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Chercher un fichier" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep dans le projet" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Lister les buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Chercher dans l'aide" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fichiers récents" })

-- Explorateur de fichiers
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorateur de fichiers" })

-- Git (gitsigns)
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Prévisualiser le hunk" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame de la ligne" })
map("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Hunk suivant" })
map("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Hunk précédent" })

-- Terminal intégré (rare car tmux gère déjà ça, mais utile en dépannage)
map("n", "<leader>tt", "<cmd>botright split | resize 15 | terminal<cr>", { desc = "Terminal nvim" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Sortir du mode terminal" })
