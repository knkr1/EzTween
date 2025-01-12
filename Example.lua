local ez = require(game.ReplicatedStorage.EzTween)

local t1 = ez.Utilize(ez,2, workspace.joe,require(script.ExportedCurve),{"Position","Color"}, {Vector3.new(5,0,0),Color3.fromRGB(85, 170, 255)})

local ite = 1
while true do
	t1 = ez.Utilize(ez,2, workspace.joe,require(script.ExportedCurve),{"Position","Color"}, {Vector3.new(1*ite,0,0),Color3.fromRGB(85, 170, 255)})
	t1:Run()
	t1:Wait()
	ite+=1
end