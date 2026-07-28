local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- 1. إنشاء شاشة الواجهة الرئيسية (ScreenGui)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ItachiFlyGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

---------------------------------------------------------
-- شاشة البداية (Splash Screen)
---------------------------------------------------------
local introFrame = Instance.new("Frame")
introFrame.Size = UDim2.new(1, 0, 1, 0)
introFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
introFrame.BackgroundTransparency = 0.2
introFrame.Parent = screenGui

-- صورة خلفية إيتاشي (يمكنك استبدال الرقم بـ AssetID الخاص بصورتك المرفوعة على روبلوكس)
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(0, 300, 0, 300)
bgImage.Position = UDim2.new(0.5, -150, 0.3, -150)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://1000007249" -- ضع معرف الصورة هنا إذا تم رفعها للعبة
bgImage.Parent = introFrame

-- النص المتلون "ايتاشي عمك"
local introText = Instance.new("TextLabel")
introText.Size = UDim2.new(1, 0, 0, 60)
introText.Position = UDim2.new(0, 0, 0.75, 0)
introText.BackgroundTransparency = 1
introText.Text = "ايتاشي عمك"
introText.TextSize = 36
introText.Font = Enum.Font.SourceSansBold
introText.Parent = introFrame

-- تأثير تغيير ألوان النص (Rainbow Effect)
task.spawn(function()
    local hue = 0
    while introFrame.Parent do
        hue = (hue + 0.01) % 1
        introText.TextColor3 = Color3.fromHSV(hue, 1, 1)
        task.wait(0.03)
    end
end)

---------------------------------------------------------
-- النافذة الرئيسية للتحكم للطيران
---------------------------------------------------------
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 260, 0, 240)
mainFrame.Position = UDim2.new(0.5, -130, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false -- ستظهر بعد انتهاء شاشة البداية
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- عنوان "صلي على النبي"
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 35)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "صلي على النبي"
titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
titleLabel.TextSize = 20
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

-- زر جون سينا
local cenaButton = Instance.new("TextButton")
cenaButton.Size = UDim2.new(0.85, 0, 0, 35)
cenaButton.Position = UDim2.new(0.075, 0, 0.2, 0)
cenaButton.BackgroundColor3 = Color3.fromRGB(40, 40, 80)
cenaButton.Text = "جون سينا"
cenaButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cenaButton.TextSize = 16
cenaButton.Font = Enum.Font.SourceSansBold
cenaButton.Parent = mainFrame

local cenaCorner = Instance.new("UICorner")
cenaCorner.CornerRadius = UDim.new(0, 6)
cenaCorner.Parent = cenaButton

-- حقل إدخال تحديد سرعة الطيران
local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0.85, 0, 0, 35)
speedInput.Position = UDim2.new(0.075, 0, 0.42, 0)
speedInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
speedInput.Text = "50" -- السرعة الافتراضية
speedInput.PlaceholderText = "أدخل سرعة الطيران..."
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.TextSize = 16
speedInput.Font = Enum.Font.SourceSans
speedInput.Parent = mainFrame

local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0, 6)
speedCorner.Parent = speedInput

-- زر تفعيل/إيقاف الطيران
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0.85, 0, 0, 40)
flyButton.Position = UDim2.new(0.075, 0, 0.65, 0)
flyButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
flyButton.Text = "الطيران: إيقاف"
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flyButton.TextSize = 18
flyButton.Font = Enum.Font.SourceSansBold
flyButton.Parent = mainFrame

local flyCorner = Instance.new("UICorner")
flyCorner.CornerRadius = UDim.new(0, 6)
flyCorner.Parent = flyButton

---------------------------------------------------------
-- الصوت والتشغيل
---------------------------------------------------------
local sound = Instance.new("Sound")
sound.Name = "SalliSound"
sound.SoundId = "rbxassetid://0" -- يمكن وضع ID صوت "صلي على النبي" هنا
sound.Volume = 1
sound.Parent = mainFrame

-- عند الضغط على زر جون سينا
cenaButton.MouseButton1Click:Connect(function()
    print("صلي على النبي مافي جون سينا")
    if sound.SoundId ~= "rbxassetid://0" then
        sound:Play()
    end
end)

---------------------------------------------------------
-- برمجة نظام الطيران (Fly)
---------------------------------------------------------
local isFlying = false
local flySpeed = 50
local flyConnection = nil

local function startFlying()
    local character = player.Character
    if not character then return end
    local root = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return end

    humanoid.PlatformStand = true

    flyConnection = RunService.RenderStepped:Connect(function()
        if not isFlying then return end

        local moveDir = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir = moveDir + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDir = moveDir - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end

        if moveDir.Magnitude > 0 then
            root.AssemblyLinearVelocity = moveDir.Unit * flySpeed
        else
            root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        end
    end)
end

local function stopFlying()
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
    end
end

-- قراءة السرعة وتغيير حالة الطيران
speedInput.FocusLost:Connect(function()
    local newSpeed = tonumber(speedInput.Text)
    if newSpeed then
        flySpeed = newSpeed
    else
        speedInput.Text = tostring(flySpeed)
    end
end)

flyButton.MouseButton1Click:Connect(function()
    isFlying = not isFlying
    if isFlying then
        flyButton.Text = "الطيران: تفعيل"
        flyButton.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
        startFlying()
    else
        flyButton.Text = "الطيران: إيقاف"
        flyButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        stopFlying()
    end
end)

---------------------------------------------------------
-- اختفاء شاشة البداية وظهور القائمة
---------------------------------------------------------
task.delay(3, function()
    introFrame:Destroy()
    mainFrame.Visible = true
end)
