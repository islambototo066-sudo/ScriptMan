local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local tool = script.Parent

local enabled = false
local strength = 0.3
local target = nil

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AutoItachi"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(190, 80)
frame.Position = UDim2.new(0.5, -95, 0.5, -40)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,35)
title.BackgroundTransparency = 1
title.Text = "أوتو: إيتاشي"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(1,-20,0,30)
button.Position = UDim2.new(0,10,0,42)
button.Text = "تشغيل"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Parent = frame

-- Rainbow للعنوان
task.spawn(function()
	local hue = 0
	while gui.Parent do
		hue = (hue + 0.01) % 1
		title.TextColor3 = Color3.fromHSV(hue,1,1)
		task.wait()
	end
end)

local function getClosestPlayer()
	local character = player.Character
	if not character then return nil end

	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then return nil end

	local closest
	local distance = math.huge

	for _, other in ipairs(Players:GetPlayers()) do
		if other ~= player and other.Character then
			local otherRoot = other.Character:FindFirstChild("HumanoidRootPart")
			local humanoid = other.Character:FindFirstChildOfClass("Humanoid")

			if otherRoot and humanoid and humanoid.Health > 0 then
				local d = (root.Position - otherRoot.Position).Magnitude

				if d < distance then
					distance = d
					closest = other
				end
			end
		end
	end

	return closest
end

button.MouseButton1Click:Connect(function()
	enabled = not enabled
	button.Text = enabled and "إيقاف" or "تشغيل"

	if enabled then
		target = getClosestPlayer()
	else
		target = nil
	end
end)

tool.Equipped:Connect(function()
	gui.Parent = player:WaitForChild("PlayerGui")
end)

tool.Unequipped:Connect(function()
	gui.Parent = nil
	enabled = false
	target = nil
end)

RunService.RenderStepped:Connect(function()
	if not enabled or not target then return end

	local character = player.Character
	local targetCharacter = target.Character

	if not character or not targetCharacter then return end

	local root = character:FindFirstChild("HumanoidRootPart")
	local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")

	if not root or not targetRoot then return end

	-- قوة التتبع 0.3
	root.CFrame = root.CFrame:Lerp(
		CFrame.lookAt(root.Position, targetRoot.Position),
		strength
	)

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid:MoveTo(targetRoot.Position)
	end
end)
