push = require 'push'

Class = require 'class'

require 'StateMachine'
require 'Player'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 640
VIRTUAL_HEIGHT = 360


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    player = Player()

    -- push is needed to make resolution 640x360 on any window resolution
    -- you can resize window, but in-game resolution stays 640x360
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    --states are --> menu, playState, gameOver
    gStateMachine = StateMachine {
    }

    --table of keys
    love.keyboard.keysPressed = {}
end

function love.update(dt)

	gStateMachine:update(dt)

	player:update(dt)

    --empty table
    love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()
	player:render()
	push:finish()
end


function love.resize(w, h)
    push:resize(w, h)
end

--functions --> keyboard 
function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    
    if key == 'escape' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end