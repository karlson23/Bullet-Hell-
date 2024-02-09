local Upgrades = Object.extend(Object)


function Upgrades:new(x,y,w,h,add,dt,pointsNeeded)
	self.x = 149 
	self.y = 89
	self.w = w 
	self.h = h

	self.dt = love.timer.getDelta()
	self.add = 30

	self.pointsNeeded = 100
	self.pointsNeededAdd = 50

	self.stringEvoulution = 'Souls needed for the next Evoulution: '.. self.pointsNeeded
end


function Upgrades:listOfUpgrades()
	self.addSpeed = 30 -- 1 add speed to player
	self.addHealth = 50 -- 2 -- add health to player

	self.addDamage = 10 -- 3 -- add damage to bullet / use only on rage mode after implemented
end

Upgrades:listOfUpgrades()

function Upgrades:update()
	self.stringEvoulution = 'Souls needed for the next Evoulution '.. self.pointsNeeded

	if experiencePoints.value >= self.pointsNeeded then
		Upgrades:RandomUpgrade()

		self.pointsNeeded = self.pointsNeeded + self.pointsNeededAdd

		experiencePoints.value = 0
	end
end

function Upgrades:RandomUpgrade()
	local RandomUpgrade = love.math.random(1,2) -- this will decide what upgrade youd get base on the number it gets and then Upgrades:random will decide what to do for each number

	if RandomUpgrade == 1 then
		player.speed = player.speed + self.addSpeed
	end

	if RandomUpgrade == 2 then 
		player.health = player.health + self.addHealth
	end
end
function Upgrades:draw()
	love.graphics.print(self.stringEvoulution, self.x,self.y)
end

return Upgrades
