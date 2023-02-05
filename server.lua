RegisterNetEvent('tellServerToInvokeRpc', function(netId)
    SetEntityRotation(NetworkGetEntityFromNetworkId(netId), 0, 0, 0)
end)

CreateThread(function()
    while true do
        local theFirstPlayer = GetPlayers()[1]
        if theFirstPlayer then
            local firstPlayerCoords = GetEntityCoords(GetPlayerPed(theFirstPlayer))
            local object = CreateObjectNoOffset(GetHashKey('prop_bin_03a'), firstPlayerCoords, true, true)

            repeat Wait(0) until NetworkGetEntityOwner(object) > 0 -- Wait until the client has synced the object

            TriggerClientEvent('tellClientToDeleteThenRpc', -1, NetworkGetNetworkIdFromEntity(object))
        end
        Wait(0)
    end
end)