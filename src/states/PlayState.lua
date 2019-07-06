PlayState = Class{__includes = BaseState}

function PlayState:init()
	player = Player()
	ball = Ball()
	
	self.paused = false

--  bricks
    tableBricks = {}

    for i=0, 4 do
    	for j=0, 5 do
    		table.insert(tableBricks,Bricks(VIRTUAL_WIDTH/2 - 170 + 70 * i, 
    			20 + j * 20));
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
        	ball.dy = -math.random(50, 140)
        	if ball.dx < 0 then
				ball.dx = -math.random(80, 160)
    	    else
            	ball.dx = math.random(80, 160)
        	end
		end
		for i, v in ipairs(tableBricks) do
			if ball:Collision(v) then
        		ball.dy = -math.random(50, 140)
        		if ball.dx < 0 then
					ball.dx = -math.random(80, 160)
    	    	else
            		ball.dx = math.random(80, 160)
        		end
			end
		end
	-- Ball is under player's paddle
		if ball.y >= VIRTUAL_HEIGHT - ball.height then
			self.paused = true
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
	if self.paused then
		love.graphics.setFont(gFonts['medium'])
		love.graphics.setColor(255/255, 0, 180/255)
		love.graphics.printf("Menu", 0, VIRTUAL_HEIGHT/2 - 10, VIRTUAL_WIDTH, 'center')
		love.graphics.setColor(1, 1, 1)
	
	else
		player:render()
		ball:render()
		for i, brick in pairs(tableBricks) do
			brick:render()
		end
	end
end