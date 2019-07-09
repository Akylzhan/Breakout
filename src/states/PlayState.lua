PlayState = Class{__includes = BaseState}

function PlayState:init()
	player = Player()
	ball = Ball()
	score = 0
	self.paused = false
--  bricks
    tableBricks = {}

    for i=0, 4 do
    	for j=0, 5 do
    		table.insert(tableBricks,Bricks(VIRTUAL_WIDTH/2 - 207 + 70 * j, 
    			20 + i * 28));
    	end
    end
--
end

function PlayState:update(dt)
	-- not paused
	if not self.paused then
		
		player:update(dt)
		ball:update(dt)
		
		if ball:Collision(player) then
        	ball.dy = -ball.dy
        	ball.y = player.y - ball.height - 1
		end
		
		for i, brick in ipairs(tableBricks) do
			if ball:Collision(brick) then

				score = score + 1
				brick.health = brick.health - 1
				
				if brick.health == 0 then
					table.remove(tableBricks, i)
				end

				if ball.y + ball.height+1 >= brick.y and ball.y-1 <= brick.y + brick.height then
					ball.y = ball.y + (ball.dy < 0 and 1 or -1)
					ball.dy = -ball.dy
				else
					ball.x = ball.x + (ball.dx < 0 and 1 or -1)
					ball.dx = -ball.dx
				end

			end
		end
		-- Ball is under player's paddle
		if ball.y >= VIRTUAL_HEIGHT - ball.height then
			gSounds['gameOver']:play()
			gStateMachine:change('gameOver')
		end
	
	-- paused
	else
		if love.keyboard.wasPressed('return') then
			gStateMachine:change('menu')
		end	
	end



	if love.keyboard.wasPressed('escape') then
		self.paused = not self.paused
	end
end

function PlayState:render()
	player:render()
	ball:render()
	for i, brick in pairs(tableBricks) do
		brick:render()
	end
	
	if self.paused then
		love.graphics.setColor(255/255, 120/255, 180/255)
		love.graphics.printf('Press Enter to go to the Menu', 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, 'center')
		love.graphics.setColor(1, 1, 1)
	end
	love.graphics.print(tostring(score), 10, 20)
end