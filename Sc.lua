local plr = game.Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", plr.PlayerGui)

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(1,0,1,0)
frame.BackgroundColor3 = Color3.new(0,0,0)

-- النص الأول
local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1,0,0.2,0)
text.Position = UDim2.new(0,0,0.3,0)
text.Text = "صلّي على سيدنا محمد ﷺ"
text.TextScaled = true
text.BackgroundTransparency = 1
text.TextColor3 = Color3.new(1,1,1)

-- شريط التحميل
local loading = Instance.new("TextLabel", frame)
loading.Size = UDim2.new(1,0,0.1,0)
loading.Position = UDim2.new(0,0,0.6,0)
loading.Text = "Loading..."
loading.TextScaled = true
loading.BackgroundTransparency = 1
loading.TextColor3 = Color3.new(1,1,1)

-- تأثير ألوان
task.spawn(function()
    while true do
        text.TextColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
        task.wait(0.3)
    end
end)

-- تحميل وهمي
for i = 1,100 do
    loading.Text = "Loading... "..i.."%"
    task.wait(0.02)
end

-- الرسالة الثانية 😂
text.Text = "تراني مبتدئ بالبرمجة ادعموني 😂"
loading.Text = ""
task.wait(2)

-- حذف الشاشة
gui:ClearAllChildren()

----------------------------------------------------------------
-- 💃 قائمة الرقصات
----------------------------------------------------------------

local dances = {
    ["Dance 1"] = "rbxassetid://507771019",
    ["Dance 2"] = "rbxassetid://507776043",
    ["Dance 3"] = "rbxassetid://507777268",
    ["Robot"]   = "rbxassetid://507766388"
}

local frame2 = Instance.new("Frame", gui)
frame2.Size = UDim2.new(0,200,0,250)
frame2.Position = UDim2.new(0,20,0.5,-125)
frame2.BackgroundColor3 = Color3.fromRGB(30,30,30)

local layout = Instance.new("UIListLayout", frame2)

local currentAnim

function playDance(id)
    local char = plr.Character or plr.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")

    if currentAnim then
        currentAnim:Stop()
    end

    local anim = Instance.new("Animation")
    anim.AnimationId = id

    currentAnim = humanoid:LoadAnimation(anim)
    currentAnim:Play()
end

for name, id in pairs(dances) do
    local btn = Instance.new("TextButton", frame2)
    btn.Size = UDim2.new(1,0,0,40)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.new(1,1,1)

    btn.MouseButton1Click:Connect(function()
        playDance(id)
    end)
end
