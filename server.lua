-- =========================================================================
-- ARQUIVO: server.lua (MOCHILA EXTRA)
-- =========================================================================

CreateThread(function()
    Wait(500)
    local VORP = nil
    TriggerEvent("getCore", function(core) VORP = core end)
    while VORP == nil do Wait(100) end
    local VorpInv = exports['vorp_inventory']:vorp_inventoryApi()
    if not VorpInv then print("!! ERRO CRÍTICO: Não foi possível carregar a API do vorp_inventory !!") return end

    -- Nosso "funcionário" dos fundos, focado em salvar permanentemente.
    AddEventHandler('mochila:salvarNoBanco', function(identifier, charIdentifier, novaCapacidade)
        MySQL.update.await(
            "UPDATE characters SET slots = ? WHERE identifier = ? AND charidentifier = ?",
            { novaCapacidade, tostring(identifier), tostring(charIdentifier) }
        )
    end)

    -- Nosso "porteiro", focado na experiência imediata do jogador.
    VorpInv.RegisterUsableItem("tt_mochila_extra", function(data)
        local _source = data.source
        local User = VORP.getUser(_source)
        local Character = User.getUsedCharacter
        if not Character then return end

        local aumento = Config.Mochilas["tt_mochila_extra"].aumento_capacidade
        local capacidadeAtual = Character.invCapacity
        local capacidadeMax = 75

        -- [TRAVA] Se já está no limite
        if capacidadeAtual >= capacidadeMax then
            TriggerClientEvent('mochila:notificar', _source, "Sua mochila já está no limite de "..capacidadeMax.." slots!")
            return
        end

        -- Calcula nova capacidade (limitando no máximo a 75)
        local novaCapacidade = capacidadeAtual + aumento
        if novaCapacidade > capacidadeMax then
            novaCapacidade = capacidadeMax
        end

        -- Atualiza no VORP (HUD e memória)
        Character.updateInvCapacity(novaCapacidade - capacidadeAtual)

        -- Consome o item
        VorpInv.subItem(_source, "tt_mochila_extra", 1)

        -- Notifica o jogador
        if novaCapacidade == capacidadeMax then
            TriggerClientEvent('mochila:notificar', _source, "Capacidade máxima atingida! Agora você tem "..capacidadeMax.." slots.")
        else
            TriggerClientEvent('mochila:notificar', _source, Config.MensagemSucesso)
        end

        -- Salva permanentemente
        local identifier = Character.identifier
        local charIdentifier = Character.rol
        TriggerEvent('mochila:salvarNoBanco', identifier, charIdentifier, novaCapacidade)
    end)
end)
