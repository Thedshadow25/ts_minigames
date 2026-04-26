if not Config.Debug then return end

RegisterCommand('test_pathfind', function()
    local success, state = exports.ts_minigames:pathfind()
    print(('pathfind result: success=%s state=%s'):format(success, state))
end, false)
