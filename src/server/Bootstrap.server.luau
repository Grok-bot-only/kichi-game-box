--!strict
-- Empty box shell — no gameplay systems.
local Version = require(game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Version"))
print(string.format("[kichi-game-box] %s %s ready", Version.name, Version.version))
