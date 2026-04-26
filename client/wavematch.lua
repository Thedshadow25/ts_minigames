if not Config.Debug then return end

RegisterCommand('test_wavematch', function()
    local success, state = exports.shadow_minigames:wavematch()
    print(('wavematch result: success=%s state=%s'):format(success, state))
end, false)
