local EzTween = {}
EzTween.__index = EzTween

function EzTween:Utilize(duration, target, curve, tab)
	local new = {}
	setmetatable(new,EzTween)
	new.duration=duration
	new.target = target
	new.curve = curve
	new.goal = tab
	new.t = "cframe"
	new.connection = nil
	new.isHeart = false
	
	return new
end

function EzTween:Run()
	local duration = self.duration
	local target = self.target
	local start = self.goal[1]
	local goal = self.goal[2]
	local startTime = tick()
	local progress
	if self.t == "cframe" then
		--target.CFrame = start
		self.isHeart = true
		self.connection = game:GetService("RunService").Heartbeat:Connect(function()
			local elapsedTime = tick() - startTime
			progress = elapsedTime / duration

			if progress >= 1 then
				progress = 1
				self.isHeart = false
				self.connection:Disconnect()
			end

			target.CFrame = start:Lerp(goal, self.curve:Get(progress))
		end)
	end
end

function EzTween:Wait()
	if self.connection ~= nil then
		repeat task.wait() until self.isHeart == false
	end
end

return EzTween