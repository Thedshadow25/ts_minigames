# TS Minigames

A minigame pack for FiveM, made by TS Scripts. Includes 5 fully interactive minigames with sound effects, animations, and configurable difficulty.

## Minigames

| Game | Description |
|------|-------------|
| **Word Guess** | Wordle-style game. Guess the 5-letter word within the attempt limit. |
| **Path Find** | Click the nearest circle to trace a path through all nodes. |
| **Minesweeper** | Memorize mine positions during a preview phase, then find them all. |
| **Wave Match** | Adjust amplitude and wavelength sliders to match a target wave. |
| **Untangle** | Drag nodes so that no lines cross each other. |

## Installation

1. Download or clone this repository
2. Place the `ts_minigames` folder in your server's `resources` directory
3. Add `ensure ts_minigames` to your `server.cfg`

## Usage

All minigames are triggered via exports from any client-side script. Every export returns a promise that resolves when the minigame ends.

```lua
local success, state, result = exports.ts_minigames:wordguess()
```

- **success** (`boolean`) - `true` if the player won
- **state** (`string`) - `"success"`, `"fail"`, or `"cancel"`
- **result** (`table`) - additional data from the minigame

You can also pass an options table to override the config defaults:

```lua
exports.ts_minigames:minesweeper({
    gridSize = 7,
    mineCount = 8,
    timeLimit = 45,
})
```

## Exports

### Start a minigame

```lua
exports.ts_minigames:wordguess(options)
exports.ts_minigames:pathfind(options)
exports.ts_minigames:minesweeper(options)
exports.ts_minigames:wavematch(options)
exports.ts_minigames:untangle(options)
```

### Utility exports

```lua
-- Force-stop the current minigame (optional: pass game name to only stop that specific one)
exports.ts_minigames:stop(gameName)

-- Check if a minigame is currently active (optional: pass game name)
exports.ts_minigames:isActive(gameName)
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

## Debug Mode

Set `Config.Debug = true` in `config.lua` to enable test commands. Each command can be run in the FiveM chat:

| Command | Minigame |
|---------|----------|
| `/test_wordguess` | Word Guess |
| `/test_pathfind` | Path Find |
| `/test_minesweeper` | Minesweeper |
| `/test_wavematch` | Wave Match |
| `/test_untangle` | Untangle |

## Example

```lua
-- Use a minigame as a hacking puzzle
local success = exports.ts_minigames:minesweeper({
    gridSize = 6,
    mineCount = 6,
    timeLimit = 25,
})

if success then
    -- Hack succeeded
else
    -- Hack failed
end
```
