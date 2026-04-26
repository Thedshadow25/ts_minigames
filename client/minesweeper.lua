if not Config.Debug then return end

RegisterCommand('test_minesweeper', function()
    local success, state = exports.shadow_minigames:minesweeper()
    print(('minesweeper result: success=%s state=%s'):format(success, state))
end, false)
