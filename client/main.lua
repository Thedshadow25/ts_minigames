local activeGame = nil
local activePromise = nil

local function sendNui(event, data)
    SendNUIMessage({ event = event, data = data })
end

local function setFocus(state)
    SetNuiFocus(state, state)
    SetNuiFocusKeepInput(false)
end

RegisterNUICallback('Eventhandler', function(payload, cb)
    local event = payload.event
    local data = payload.data

    if event == 'Complete' then
        if activePromise then
            activePromise:resolve(data)
        end
    elseif event == 'SetFocus' then
        setFocus(data)
    end

    cb('ok')
end)

local function startGame(gameName, options)
    if activePromise then
        error('A minigame is already active: ' .. (activeGame or 'unknown'))
        return false, 'busy'
    end

    local defaults = Config.Defaults[gameName] or {}
    if type(options) == 'table' then
        for k, v in pairs(options) do
            defaults[k] = v
        end
    end

    activeGame = gameName
    setFocus(true)
    sendNui('Start', { game = gameName, options = defaults })

    activePromise = promise.new()
    local result = Citizen.Await(activePromise)

    setFocus(false)
    activePromise = nil
    activeGame = nil

    sendNui('Hide', {})

    local state = type(result) == 'table' and result.state or result
    return state == 'success', state, result
end

local function stopGame(gameName)
    if not activePromise then return end
    if gameName and activeGame ~= gameName then return end

    activePromise:resolve('cancel')
    sendNui('Stop', {})
    setFocus(false)
end

local function isGameActive(gameName)
    if gameName then
        return activeGame == gameName
    end
    return activeGame ~= nil
end

exports('wordguess', function(options) return startGame('wordguess', options) end)
exports('pathfind', function(options) return startGame('pathfind', options) end)
exports('minesweeper', function(options) return startGame('minesweeper', options) end)
exports('wavematch', function(options) return startGame('wavematch', options) end)
exports('untangle', function(options) return startGame('untangle', options) end)
exports('pickpocket', function(options) return startGame('pickpocket', options) end)
exports('pattern', function(options) return startGame('pattern', options) end)
exports('wirecut', function(options) return startGame('wirecut', options) end)

exports('stop', function(gameName) return stopGame(gameName) end)
exports('isActive', function(gameName) return isGameActive(gameName) end)
