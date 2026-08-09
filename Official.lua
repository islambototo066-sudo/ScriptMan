-- Black Style Multi Dance GUI (FE)

local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- GUI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "BlackDanceGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,240,0,260)
frame.Position = UDim2.new(0.5,-120,0.5,-130)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BorderSizePixel = 0

-- عنوان
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,35)
title.Text = "💀 Black Dance Menu"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(20,20,20)
title.BorderSizePixel = 0

-- رقصات
local dances = {
	{"Dance 1", "rbxassetid://507771019"},
	{"Dance 2", "rbxassetid://507776043"},
	{"Dance 3", "rbxassetid://507777268"},
	{"Dance 4", "rbxassetid://507777451"},
	{"Dance 5", "rbxassetid://507777826"}
}

local currentAnim

for i,v in pairs(dances) do
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1,-20,0,30)
	btn.Position = UDim2.new(0,10,0,40 + (i-1)*35)
	btn.Text = v[1]
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
	btn.BorderSizePixel = 0
	
	btn.MouseButton1Click:Connect(function()
		local humanoid = player.Character:WaitForChild("Humanoid")
		
		if currentAnim then currentAnim:Stop() end
		
		local anim = Instance.new("Animation")
		anim.AnimationId = v[2]
		
		currentAnim = humanoid:LoadAnimation(anim)
		currentAnim:Play()
	end)
end

-- زر إيقاف
local stop = Instance.new("TextButton", frame)
stop.Size = UDim2.new(1,-20,0,30)
stop.Position = UDim2.new(0,10,1,-40)
stop.Text = "Stop ❌"
stop.TextColor3 = Color3.new(1,1,1)
stop.BackgroundColor3 = Color3.fromRGB(80,20,20)
stop.BorderSizePixel = 0

stop.MouseButton1Click:Connect(function()
	if currentAnim then currentAnim:Stop() end
end)

-- سحب (Drag)
local dragging, dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

-- زر فتح/إغلاق (K)
UIS.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.K then
		frame.Visible = not frame.Visible
	end
end)
