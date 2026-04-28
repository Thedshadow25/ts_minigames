if not Config.Debug then return end

RegisterCommand('test_welding', function()
    local success, state = exports.ts_minigames:welding()
    print(('welding result: success=%s state=%s'):format(success, state))
end, false)
