-- Ce module centralise toutes les fonctionnalités "d'aide" que l'on veut
-- pouvoir couper pendant une phase d'apprentissage, et rallumer plus tard.
-- Chaque toggle notifie clairement son nouvel état.

local M = {}

-- ===================== LSP (complétion sémantique, hover, etc.) =====================
M.lsp_enabled = false -- démarre DÉSACTIVÉ : mode apprentissage par défaut

function M.lsp_should_attach()
  return M.lsp_enabled
end

function M.toggle_lsp()
  M.lsp_enabled = not M.lsp_enabled
  if M.lsp_enabled then
    vim.notify("LSP: ACTIVÉ (rouvre les buffers avec :e pour attacher)", vim.log.levels.WARN)
  else
    for _, client in ipairs(vim.lsp.get_clients()) do
      vim.lsp.stop_client(client.id)
    end
    vim.diagnostic.enable(false)
    vim.notify("LSP: désactivé — mode apprentissage", vim.log.levels.INFO)
  end
end

-- ===================== Diagnostics seuls (garder le LSP mais cacher les soulignés) ====
local diagnostics_active = true
function M.toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  vim.diagnostic.enable(diagnostics_active)
  vim.notify("Diagnostics: " .. (diagnostics_active and "visibles" or "cachés"))
end

-- ===================== IA / Copilot =====================
function M.toggle_copilot()
  local ok, client = pcall(require, "copilot.client")
  if not ok then
    vim.notify("Copilot n'est pas chargé (plugin lazy sur InsertEnter)", vim.log.levels.ERROR)
    return
  end
  if client.is_disabled() then
    vim.cmd("Copilot enable")
    vim.notify("IA (Copilot): ACTIVÉE", vim.log.levels.WARN)
  else
    vim.cmd("Copilot disable")
    vim.notify("IA (Copilot): désactivée — mode apprentissage", vim.log.levels.INFO)
  end
end

-- ===================== Autoformat à la sauvegarde =====================
vim.g.autoformat = false
function M.toggle_autoformat()
  vim.g.autoformat = not vim.g.autoformat
  vim.notify("Autoformat à la sauvegarde: " .. tostring(vim.g.autoformat))
end

-- ===================== Inlay hints (types suggérés inline) =====================
function M.toggle_inlay_hints()
  local enabled = vim.lsp.inlay_hint.is_enabled({})
  vim.lsp.inlay_hint.enable(not enabled)
  vim.notify("Inlay hints: " .. tostring(not enabled))
end

return M
