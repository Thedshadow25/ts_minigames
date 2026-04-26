if not Config.Debug then return end

RegisterCommand('test_wirecut', function()
    local success, state = exports.shadow_minigames:wirecut()
    print(('wirecut result: success=%s state=%s'):format(success, state))
end, false)
