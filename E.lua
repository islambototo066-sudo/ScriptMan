local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local tool = script.Parent

local enabled = false
local strength = 0.3
local target = nil
local connection

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AutoItachi"
gui.ResetOnSpawn = false
gui.Enabled = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Name = "Main"
frame.Size = UDim2.fromOffset(200, 95)
frame.Position = UDim2.new(0.5, -100, 0.5, -48)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "أوتو: إيتاشي"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 35)
button.Position = UDim2.fromOffset(10, 50)
button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "تشغيل"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Parent = frame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = button

-- Rainbow
task.spawn(function()
	local hue = 0

	while gui.Parent do
		hue = (hue + 0.01) % 1
		title.TextColor3 = Color3.fromHSV(hue, 1, 1)
		task.wait(0.03)
	end
end)

local function getRoot(character)
	if not character then
		return nil
	end

	return character:FindFirstChild("HumanoidRootPart")
end

local function getClosestPlayer()
	local character = player.Character
	local root = getRoot(character)

	if not root then
		return nil
	end

	local closest = nil
	local closestDistance = math.huge

	for _, other in ipairs(Players:GetPlayers()) do
		if other ~= player then
			local otherCharacter = other.Character
			local otherRoot = getRoot(otherCharacter)
			local humanoid = otherCharacter and
				otherCharacter:FindFirstChildOfClass("Humanoid")

			if otherRoot and humanoid and humanoid.Health > 0 then
				local distance =
					(root.Position - otherRoot.Position).Magnitude

				if distance < closestDistance then
					closestDistance = distance
					closest = other
				end
			end
		end
	end

	return closest
end

local function stopFollowing()
	enabled = false
	target = nil
	button.Text = "تشغيل"
end

local function startFollowing()
	target = getClosestPlayer()

	if target then
		enabled = true
		button.Text = "إيقاف"
	else
		enabled = false
		button.Text = "لا يوجد لاعب"
		
		task.delay(1, function()
			if not enabled then
				button.Text = "تشغيل"
			end
		end)
	end
end

button.MouseButton1Click:Connect(function()
	if enabled then
		stopFollowing()
	else
		startFollowing()
	end
end)

tool.Equipped:Connect(function()
	gui.Enabled = true
end)

tool.Unequipped:Connect(function()
	stopFollowing()
	gui.Enabled = false
end)

connection = RunService.Heartbeat:Connect(function()
	if not enabled or not target then
		return
	end

	local character = player.Character
	local targetCharacter = target.Character

	local root = getRoot(character)
	local targetRoot = getRoot(targetCharacter)

	if not root or not targetRoot then
		target = getClosestPlayer()
		return
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")

	if not humanoid or humanoid.Health <= 0 then
		return
	end

	-- يتجه ويتحرك نحو الهدف بقوة 0.3
	local direction = targetRoot.Position - root.Position

	if direction.Magnitude > 2 then
		humanoid:MoveTo(targetRoot.Position)
	end

	if direction.Magnitude > 0.1 then
		local lookPosition = root.Position + direction.Unit

		root.CFrame = root.CFrame:Lerp(
			CFrame.lookAt(root.Position, lookPosition),
			strength
		)
	end
end)
