-- ~/.config/nvim/init.lua
require("config.lazy")        -- bootstrap le plugin manager
require("config.options")     -- réglages de base
require("config.keymaps")     -- raccourcis "métier" (édition, navigation, recherche)
require("config.toggles")     -- fonctions ON/OFF pour LSP / IA / diagnostics / format
require("config.toggle-keymaps")
