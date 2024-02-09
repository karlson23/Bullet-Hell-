local Mouse = Object.extend(Object)

function Mouse:new()
	self.x = love.mouse.getX()
	self.y = love.mouse.getY()
	self.w = 15
	self.h = 15
end

function Mouse:update()
	self.x = love.mouse.getX()
	self.y = love.mouse.getY()
end

function Mouse:draw()
	love.graphics.rectangle('line',self.x,self.y,self.w,self.h)
end

return Mouse