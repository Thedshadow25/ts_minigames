if not Config.Debug then return end

RegisterCommand('test_wavematch', function()
    local success, state = exports.ts_minigames:wavematch()
    print(('wavematch result: success=%s state=%s'):format(success, state))
end, false)
