if not Config.Debug then return end

RegisterCommand('test_pattern', function()
    local success, state = exports.shadow_minigames:pattern()
    print(('pattern result: success=%s state=%s'):format(success, state))
end, false)
