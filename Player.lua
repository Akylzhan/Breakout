Player = Class{}

GRAVITY = 8
function Player:init()
	
	self.radius = 12
	
	self.x = 30
	self.y = 30

	self.dy = 0
	self.dx = 0
end


function Player:update(dt)
	
-- y-axis movement
	self.dy = self.dy + GRAVITY * dt	
	if love.keyboard.wasPressed('space') or love.keyboard.wasPressed('up') then
		self.dy = -3
	end

	self.y = self.y + self.dy
	--to prevent from falling down and jumping out of upper border
	if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
   
    else
        self.y = math.min(VIRTUAL_HEIGHT - self.radius, self.y + self.dy * dt)
    end

-- x-axis movement
	if love.keyboard.isDown('left') then
		self.dx = -150 * dt
	elseif love.keyboard.isDown('right') then
		self.dx = 150 * dt
	else self.dx = 0
	end

	self.x = self.x + self.dx
end

function Player:render()
	love.graphics.setColor(255/255, 80/255, 80/255)
	love.graphics.circle('fill',self.x, self.y, self.radius, 20)
	love.graphics.setColor(0, 0, 0)
end