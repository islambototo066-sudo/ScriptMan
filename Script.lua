local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "KingVonGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(280, 340)
frame.Position = UDim2.new(0.5, -140, 0.5, -170)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
frame.Active = true
frame.Parent = gui

local image = Instance.new("ImageLabel")
image.Parent = frame
image.Size = UDim2.fromOffset(180, 165)
image.Position = UDim2.new(0.5, -90, 0, 40)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://74998534075275"

local function makeButton(name, text, y, color)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Parent = frame
    b.Size = UDim2.new(1, -40, 0, 45)
    b.Position = UDim2.fromOffset(20, y)
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Text = text
    b.TextScaled = true
    return b
end

local kick = makeButton("KickButton", "KICK", 220,
    Color3.fromRGB(190, 35, 35))

local face = makeButton("FaceButton", "FACE", 275,
    Color3.fromRGB(35, 100, 200))

local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -35, 0, 0)
close.Text = "X"
close.TextScaled = true
close.BackgroundColor3 = Color3.fromRGB(190, 35, 35)

face.Activated:Connect(function()
    for _, p in ipairs(Players:GetPlayers()) do
        local char = p.Character
        local head = char and char:FindFirstChild("Head")

        if head and not head:FindFirstChild("ImageBillboard") then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ImageBillboard"
            billboard.Adornee = head
            billboard.Size = UDim2.fromOffset(100, 100)
            billboard.StudsOffset = Vector3.new(0, 0, 2)
            billboard.AlwaysOnTop = true
            billboard.Parent = head

            local img = Instance.new("ImageLabel")
            img.Size = UDim2.fromScale(1, 1)
            img.BackgroundTransparency = 1
            img.Image = "rbxassetid://74998534075275"
            img.Parent = billboard
        end
    end
end)

kick.Activated:Connect(function()
    warn("THIS SERVER HAS BEEN HACKED BY KING VON!")
end)

close.Activated:Connect(function()
    gui:Destroy()
end)

-- تحريك الواجهة بالماوس أو اللمس
local dragging = false
local dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
