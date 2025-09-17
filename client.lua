-- =========================================================================
-- ARQUIVO: client.lua (MOCHILA EXTRA)
-- =========================================================================

local VORPcore = exports.vorp_core:GetCore()


RegisterNetEvent('mochila:notificar', function(message)

      if Config.NotificacaoEstilo == "BottomRight" then
        VORPcore.NotifyBottomRight(message, 5000)
    elseif Config.NotificacaoEstilo == "TipBottom" then
        TriggerEvent("vorp:TipBottom", message, 4000)
    elseif Config.NotificacaoEstilo == "NotifyLeft" then
        TriggerEvent("vorp:NotifyLeft", "Mochila", message, "generic_textures", "tick", 4000)
    else
        -- fallback caso o estilo configurado não exista
        TriggerEvent("vorp:TipBottom", message, 4000)
    end
    
end)