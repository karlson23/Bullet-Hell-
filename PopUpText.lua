local PopUP = Object.extend(Object)

function PopUP:new(x,y,w,h,color,text)
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.text = text
	self.color = color
	self.lifetime = 0
	self.lifetime.add = 1
end

function PopUP:BulletHitEnemy()

end

return PopUP