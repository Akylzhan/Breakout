MenuState = Class{__includes = BaseState}

local highlighted = 1

function MenuState:update(dt)

	if love.keyboard.wasPressed('up') then
		highlighted = highlighted == 1 and 3 or highlighted-1
	elseif love.keyboard.wasPressed('down')then
		highlighted = highlighted == 3 and 1 or highlighted+1
	end

	if love.keyboard.wasPressed('return') then
		if highlighted == 1 then
			gStateMachine:change('play')
		elseif highlighted == 3 then	
        	love.event.quit()
    	end
    end
end

function MenuState:render()

	love.graphics.setFont(gFonts['large'])
	love.graphics.setColor(255/255, 0, 180/255)	
	love.graphics.printf('Breakout', 0, VIRTUAL_HEIGHT*1/4, VIRTUAL_WIDTH, 'center')

	--reset
	love.graphics.setColor(1,1,1)
	love.graphics.setFont(gFonts['medium'])

	if highlighted == 1 then
		love.graphics.setColor(255/255, 0, 180/255)
	end
	love.graphics.printf('Play', 0, VIRTUAL_HEIGHT/2 + 30, VIRTUAL_WIDTH, 'center')

	--reset
	love.graphics.setColor(1,1,1)
	

	if highlighted == 2 then
		love.graphics.setColor(255/255, 0, 180/255)
	end	
	love.graphics.printf('High Scores', 0, VIRTUAL_HEIGHT/2 + 50, VIRTUAL_WIDTH, 'center')

	--reset
	love.graphics.setColor(1,1,1)


	if highlighted == 3 then
		love.graphics.setColor(255/255, 0, 180/255)
	end	
	love.graphics.printf('Exit', 0, VIRTUAL_HEIGHT/2 + 70, VIRTUAL_WIDTH, 'center')	

	--reset
	love.graphics.setColor(1,1,1)
end