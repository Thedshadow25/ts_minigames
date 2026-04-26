# Shadow Minigames

A minigame pack for FiveM, made by Shadow Resources. Includes 8 fully interactive minigames with sound effects, animations, and configurable difficulty.

## Minigames

| Game | Description |
|------|-------------|
| **Word Guess** | Wordle-style game. Guess the 5-letter word within the attempt limit. |
| **Path Find** | Click the nearest circle to trace a path through all nodes. |
| **Minesweeper** | Memorize mine positions during a preview phase, then find them all. |
| **Wave Match** | Adjust amplitude and wavelength sliders to match a target wave. |
| **Untangle** | Drag nodes so that no lines cross each other. |
| **Pickpocket** | Stop a moving arrow inside hit zones to steal items. |
| **Pattern Lock** | Memorize a dot pattern, then reproduce it in the correct order. |
| **Wire Cut** | Memorize a wire sequence, then cut the cables in the correct order. |

## Installation

1. Download or clone this repository
2. Place the `shadow_minigames` folder in your server's `resources` directory
3. Add `ensure shadow_minigames` to your `server.cfg`

## Usage

All minigames are triggered via exports from any client-side script. Every export returns a promise that resolves when the minigame ends.

```lua
local success, state, result = exports.shadow_minigames:wordguess()
```

- **success** (`boolean`) - `true` if the player won
- **state** (`string`) - `"success"`, `"fail"`, or `"cancel"`
- **result** (`table`) - additional data (e.g. `stolenItems` for pickpocket)

You can also pass an options table to override the config defaults:

```lua
exports.shadow_minigames:minesweeper({
    gridSize = 7,
    mineCount = 8,
    timeLimit = 45,
})
```

## Exports

### Start a minigame

```lua
exports.shadow_minigames:wordguess(options)
exports.shadow_minigames:pathfind(options)
exports.shadow_minigames:minesweeper(options)
exports.shadow_minigames:wavematch(options)
exports.shadow_minigames:untangle(options)
exports.shadow_minigames:pickpocket(options)
exports.shadow_minigames:pattern(options)
exports.shadow_minigames:wirecut(options)
```

### Utility exports

```lua
-- Force-stop the current minigame (optional: pass game name to only stop that specific one)
exports.shadow_minigames:stop(gameName)

-- Check if a minigame is currently active (optional: pass game name)
exports.shadow_minigames:isActive(gameName)
```

## Config Options

All defaults can be changed in `config.lua`. Options passed via exports override these values.

### Word Guess
| Option | Default | Description |
|--------|---------|-------------|
| `maxAttempts` | 6 | Number of guesses allowed (3-8) |
| `timeLimit` | 120 | Time in seconds |

### Path Find
| Option | Default | Description |
|--------|---------|-------------|
| `nodeCount` | 7 | Number of nodes (3-12) |
| `timeLimit` | 20 | Time in seconds |

### Minesweeper
| Option | Default | Description |
|--------|---------|-------------|
| `gridSize` | 5 | Grid dimensions (3-8) |
| `mineCount` | 5 | Number of mines |
| `previewTime` | 5000 | Memorize time in ms (2000-10000) |
| `maxMistakes` | 3 | Wrong clicks before failure (1-10) |
| `timeLimit` | 30 | Time in seconds |

### Wave Match
| Option | Default | Description |
|--------|---------|-------------|
| `timeLimit` | 15 | Time in seconds |
| `matchThreshold` | 98 | Match percentage needed to win (50-100) |

### Untangle
| Option | Default | Description |
|--------|---------|-------------|
| `nodeCount` | 8 | Number of nodes (4-12) |
| `timeLimit` | 30 | Time in seconds |

### Pickpocket
| Option | Default | Description |
|--------|---------|-------------|
| `speed` | 1.5 | Arrow speed (0.5-4) |
| `timeLimit` | 25 | Time in seconds |

### Pattern Lock
| Option | Default | Description |
|--------|---------|-------------|
| `patternLength` | 5 | Number of dots in pattern (3-8) |
| `timeLimit` | 20 | Time in seconds |
| `memorizeTime` | 4 | Memorize phase in seconds (2-10) |

### Wire Cut
| Option | Default | Description |
|--------|---------|-------------|
| `wireCount` | 7 | Total number of wires (4-8) |
| `cutCount` | 4 | Wires that need cutting (2-5) |
| `timeLimit` | 25 | Time in seconds |
| `memorizeTime` | 5 | Memorize phase in seconds (2-10) |

## Debug Mode

Set `Config.Debug = true` in `config.lua` to enable test commands. Each command can be run in the FiveM chat:

| Command | Minigame |
|---------|----------|
| `/test_wordguess` | Word Guess |
| `/test_pathfind` | Path Find |
| `/test_minesweeper` | Minesweeper |
| `/test_wavematch` | Wave Match |
| `/test_untangle` | Untangle |
| `/test_pattern` | Pattern Lock |
| `/test_wirecut` | Wire Cut |

## Example

```lua
-- Hack success determines if the door opens
local success = exports.shadow_minigames:wirecut({
    wireCount = 5,
    cutCount = 3,
    timeLimit = 20,
})

if success then
    -- Open the door
else
    -- Trigger alarm
end
```
