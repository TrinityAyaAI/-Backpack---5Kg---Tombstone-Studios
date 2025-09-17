-- =========================================================================
-- ARQUIVO: config.lua (MOCHILA EXTRA)
-- =========================================================================

Config = {}

Config.Mochilas = {
    ["tt_mochila_extra"] = {
        aumento_capacidade = 5
    }
}

-- Mudei a mensagem para ser mais imediata, já que a mostraremos antes da atualização.
Config.MensagemSucesso = "Mochila usada! Sua capacidade foi aumentada."
Config.MensagemErro = "Não foi possível usar a mochila."

-- Estilo de notificação:
-- Opções: "BottomRight", "TipBottom", "NotifyLeft"
Config.NotificacaoEstilo = "NotifyLeft"