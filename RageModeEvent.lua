function rageModeLoad()
	RageMode = {}
	RageMode.x = 150
	RageMode.y = 130
	RageMode.w = 0
	RageMode.h = 30

	RageMode.timer = 0 
	RageMode.timerAdd = 1


	RageMode.isOn = false
	RageMode.meterAdd = 10
	RageMode.meterSubtract = 60
	RageMode.amountNeeded = 400
	RageMode.depleted = true
	RageMode.meter = 0


	RageMode.DamageAdded = 5000
end

function rageModeupdate(dt)
	if RageMode.meter >= RageMode.amountNeeded then
		RageMode.timer = RageMode.timer + RageMode.timerAdd * dt / 2

	end

	if RageMode.timer > 2 then
		RageMode.depleted = false
		RageMode.timer = 0 
	end

	if RageMode.depleted == false then
		RageMode.meter = RageMode.meter - RageMode.meterSubtract * dt
		RageMode.w = RageMode.w - RageMode.meterSubtract * dt
	end

	if RageMode.meter <= 0 then
		RageMode.depleted = true
	end
end	

function rageModedraw()
	love.graphics.setColor(0.545,0,0)
	love.graphics.rectangle('fill',RageMode.x,RageMode.y,RageMode.w,RageMode.h)
	love.graphics.setColor(1,1,1)
end