require 'src/Dependencies'

function love.load()
	math.randomseed(os.time())
    
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    love.window.setTitle('Breakout')

    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })


    gFonts = {
    	['small'] = love.graphics.newFont('font.ttf', 8),
    	['medium'] = love.graphics.newFont('font.ttf', 16),
    	['large'] = love.graphics.newFont('font.ttf', 24)
    }
    love.graphics.setFont(gFonts['medium'])


    gStateMachine = StateMachine {
    	['menu'] = function() return MenuState() end,
    	['play'] = function() return PlayState() end
    }

    gStateMachine:change('menu')


    love.keyboard.keysPressed = {}
end

function love.update(dt)

	gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()
	love.graphics.draw(love.graphics.newImage("img/background.jpg"), 0, 0)

	gStateMachine:render()
	displayFPS()

	push:finish()
end




function love.resize(w, h)
    push:resize(w, h)
end

--functions --> keyboard 
function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end


function displayFPS()
	love.graphics.setFont(gFonts['small'])
	love.graphics.setColor(1, 1, 1)
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10) 	
end