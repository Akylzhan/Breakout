GameOverState = Class{__includes = BaseState}

function GameOverState:update(dt)
	if love.keyboard.wasPressed('space') or love.keyboard.wasPressed('return') then
		gStateMachine:change('menu')
	end
end

function GameOverState:render()
	love.graphics.setFont(gFonts['large'])
	love.graphics.setColor(255/255, 0, 180/255)
	love.graphics.printf('GAME OVER', 0, 40, VIRTUAL_WIDTH, 'center')

	love.graphics.setColor(1, 1, 1)
	love.graphics.setFont(gFonts['medium'])
end