function points()
	experiencePoints = {}
	--dont forget to credit artist https://nyknck.itch.io/skull-sprite or '@nyk_nck'
	--experiencePoints.logo = love.graphics.newImage('Assets/PointsLogo/RedSkull.png')
	experiencePoints.x = 190
	experiencePoints.y = 70
	experiencePoints.w = 0
	experiencePoints.h = 0
	experiencePoints.SoulString = 'Souls:'
	experiencePoints.value = 0
end

function pointsUpdate(dt)
end

function pointsDraw()
	love.graphics.print(experiencePoints.SoulString, 150, 70)
	love.graphics.print(experiencePoints.value, experiencePoints.x, experiencePoints.y)
end