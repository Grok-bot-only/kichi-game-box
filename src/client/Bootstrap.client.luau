--!strict
-- Third-person default (Classic camera). Mobile-friendly landscape.
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function applyCamera()
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid", 10)
	if humanoid and humanoid:IsA("Humanoid") then
		player.CameraMode = Enum.CameraMode.Classic
		player.CameraMinZoomDistance = 8
		player.CameraMaxZoomDistance = 64
	end
end

task.spawn(applyCamera)
player.CharacterAdded:Connect(function()
	task.defer(applyCamera)
end)
