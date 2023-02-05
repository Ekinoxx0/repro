RegisterNetEvent('tellClientToDeleteThenRpc', function(netId)
    -- We don't know server/client ping delay
    -- So assuming we are running locally, this could be something between 0 to 50ms

    -- The logic here is, client delete the entity while the server is sending RPC, the client receive the RPC while the target entity is already destroyed

    SetTimeout(math.random(0, 50), function()
        DeleteEntity(NetworkGetEntityFromNetworkId(netId))
    end)

    SetTimeout(math.random(0, 50), function()
        TriggerServerEvent('tellServerToInvokeRpc', netId)
    end)
end)