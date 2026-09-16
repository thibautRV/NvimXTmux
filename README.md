# Config nvim + tmux — mode "apprentissage"

## Philosophie

- **nvim** garde tous ses raccourcis dans son propre espace (`<leader>` = `Espace`, plus quelques touches classiques `gd`, `K`, etc.). **tmux** garde les siens derrière son `prefix` (`Ctrl-a`). Aucun des deux n'utilise l'espace de raccourcis de l'autre — sauf un point de jonction volontaire : **Ctrl-h/j/k/l**, qui sert à naviguer entre panneaux, que ce soit un split nvim ou un pane tmux. C'est le seul raccourci "partagé", et il fait la même chose des deux côtés.
- **LSP et IA sont désactivés par défaut.** Tu codes sans complétion sémantique ni suggestions Copilot tant que tu ne les rallumes pas explicitement. Coloration syntaxique (treesitter), fuzzy finder (Telescope), git signs, etc. restent actifs car ce ne sont pas des "aides au code", juste du confort de navigation/visuel.

## Installation

```bash
# nvim
mkdir -p ~/.config/nvim
cp -r nvim/* ~/.config/nvim/

# tmux
cp tmux/tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf   # si tmux tourne déjà
```

Prérequis : Neovim ≥ 0.9, `git`, `ripgrep` (pour Telescope live_grep), une [Nerd Font](https://www.nerdfonts.com/) pour les icônes. Au premier lancement de `nvim`, `lazy.nvim` installe tout automatiquement.

---

## Raccourcis tmux (prefix = `Ctrl-a`)

| Touche | Action |
|---|---|
| `Ctrl-a` puis `|` | Split vertical |
| `Ctrl-a` puis `-` | Split horizontal |
| `Ctrl-h/j/k/l` (**sans prefix**) | Changer de pane (ou de split nvim si nvim tourne dedans) |
| `Ctrl-a` puis `H/J/K/L` | Redimensionner le pane |
| `Ctrl-a` puis `c` | Nouvelle fenêtre |
| `Alt-p` / `Alt-n` | Fenêtre précédente / suivante |
| `Ctrl-a` puis `Tab` | Dernière fenêtre utilisée |
| `Ctrl-a` puis `Enter` | Entrer en mode copie (vi) |
| `Ctrl-a` puis `S` | Choisir une session |
| `Ctrl-a` puis `X` | Tuer la session |
| `Ctrl-a` puis `r` | Recharger `~/.tmux.conf` |

## Raccourcis nvim (leader = `Espace`)

### Édition / navigation générale
| Touche | Action |
|---|---|
| `Ctrl-h/j/k/l` | Naviguer entre splits nvim (et panes tmux en bordure) |
| `<leader>w` / `<leader>q` | Sauver / quitter |
| `<leader>sv` / `<leader>sh` | Split vertical / horizontal (nvim, distinct de tmux) |
| `<leader>sm` | Maximiser/restaurer le split courant |
| `Shift-l` / `Shift-h` | Buffer suivant / précédent |
| `Alt-j` / `Alt-k` | Déplacer la ligne (ou la sélection) |
| `<leader>e` | Explorateur de fichiers (neo-tree) |

### Recherche (Telescope)
| Touche | Action |
|---|---|
| `<leader>ff` | Chercher un fichier |
| `<leader>fg` | Grep dans le projet |
| `<leader>fb` | Lister les buffers |
| `<leader>fr` | Fichiers récents |

### Git
| Touche | Action |
|---|---|
| `]h` / `[h` | Hunk git suivant / précédent |
| `<leader>gp` | Prévisualiser le hunk |
| `<leader>gb` | Blame de la ligne |

### 🔧 Toggles — active/désactive l'aide au code
| Touche | Action |
|---|---|
| `<leader>tl` | **LSP** ON/OFF (coupe complétion sémantique, hover, go-to-def...) |
| `<leader>td` | Diagnostics seuls ON/OFF (garde le LSP, cache juste les soulignés d'erreur) |
| `<leader>ta` | **IA / Copilot** ON/OFF |
| `<leader>tf` | Autoformat à la sauvegarde ON/OFF |
| `<leader>ti` | Inlay hints ON/OFF |

### Quand le LSP est activé (`<leader>tl`)
| Touche | Action |
|---|---|
| `gd` | Aller à la définition |
| `gr` | Voir les références |
| `K` | Documentation au survol |
| `<leader>rn` | Renommer |
| `<leader>ca` | Actions de code |

---

## Pourquoi ce choix pour ta phase d'apprentissage

- Tout ce qui **répond à ta place** (LSP, Copilot) est **off par défaut** et regroupé sous un seul préfixe mnémonique `<leader>t...` (Toggle), facile à retrouver même dans plusieurs mois.
- Tout ce qui **t'aide sans penser à ta place** (coloration, fuzzy finder, git signs, explorateur) reste actif : ça ne diminue pas l'apprentissage, ça évite juste de perdre du temps bêtement.
- Le jour où tu veux réactiver l'assistance : `<leader>tl` puis `<leader>ta`, et rien d'autre à changer dans ta config.
