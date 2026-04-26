if not Config.Debug then return end

RegisterCommand('test_untangle', function()
    local success, state = exports.shadow_minigames:untangle()
    print(('untangle result: success=%s state=%s'):format(success, state))
end, false)
