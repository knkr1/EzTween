local EzTween = {}
EzTween.__index = EzTween

function EzTween:Utilize(duration, target, curve, proporties, values)
	local new = {}
	setmetatable(new,EzTween)
	new.duration=duration
	new.target = target
	new.curve = curve
	new.proporties = proporties
	new.values = values
	new.connection = nil
	new.isHeart = false

	return new
end

function EzTween:Run()
	local duration = self.duration
	local target = self.target
	local startTime = tick()
	local proporties = self.proporties
	local values = self.values
	local progress
	local startValues = {}

	for i, v in pairs(proporties) do
		startValues[v] = target[v]
	end
	self.isHeart = true
	self.connection = game:GetService("RunService").Heartbeat:Connect(function()
		local elapsedTime = tick() - startTime
		progress = elapsedTime / duration

		if progress >= 1 then
			progress = 1
			self.isHeart = false
			self.connection:Disconnect()
		end

		for i, v in ipairs(proporties) do 
			target[v] = startValues[v]:Lerp(values[i], self.curve:Get(progress))
		end
	end)
end

function EzTween:Wait()
	if self.connection ~= nil then
		repeat task.wait() until self.isHeart == false
	end
end

return EzTween