Player = Class{}

function Player:init()
	
	self.width = 64
	self.height = 8

	self.y = VIRTUAL_HEIGHT - 20
	self.x = VIRTUAL_WIDTH/2 - self.width / 2
end


function Player:update(dt)

-- x-axis movement
	if love.keyboard.isDown('left') then
		self.dx = -170 * dt
	elseif love.keyboard.isDown('right') then
		self.dx = 170 * dt
	else self.dx = 0
	end

	self.x = self.x + self.dx
	if self.dx < 0 then
		self.x = math.max(0, self.x + self.dx * dt)
	else
		self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
	end
end

function Player:render()
	love.graphics.setColor(255/255, 80/255, 255/255)
	love.graphics.rectangle('fill',self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1)
end