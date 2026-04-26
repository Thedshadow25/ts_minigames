if not Config.Debug then return end

RegisterCommand('test_wordguess', function()
    local success, reason = exports.shadow_minigames:wordguess()
    print(('Word Guess - Success: %s, Reason: %s'):format(success, reason))
end, false)

TriggerEvent('chat:addSuggestion', '/test_wordguess', 'Test the word guess minigame')
