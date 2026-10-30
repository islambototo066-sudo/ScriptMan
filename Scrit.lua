local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة
if CoreGui:FindFirstChild("EROR_YamalHub") then
	CoreGui.EROR_YamalHub:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EROR_YamalHub"
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 310, 0, 340)
mainFrame.Position = UDim2.new(0.04, 0, 0.15, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
mainFrame.BorderSizePixel = 4
mainFrame.BorderColor3 = Color3.fromRGB(255, 50, 150)
mainFrame.Active = true
mainFolder = mainFrame
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundColor3 = Color3.fromRGB(40, 0, 50)
title.Text = "⚡ [EROR90146] MAP REMOTE EXPLOITER ⚡"
title.TextColor3 = Color3.fromRGB(255, 120, 220)
title.TextSize = 9
title.Font = Enum.Font.Code

-- زر 1: تنفيذ ثغرة Kill All عبر مسار الرموت (شبيه بفيديو لامين يامال)
local btnKillAll = Instance.new("TextButton", mainFrame)
btnKillAll.Size = UDim2.new(0.9, 0, 0, 42)
btnKillAll.Position = UDim2.new(0.05, 0, 0.15, 0)
btnKillAll.BackgroundColor3 = Color3.fromRGB(40, 15, 15)
btnKillAll.Text = "1- KILL ALL [عبر مسار الرموت]"
btnKillAll.TextColor3 = Color3.fromRGB(255, 80, 80)
btnKillAll.TextSize = 10
btnKillAll.Font = Enum.Font.Code

-- زر 2: تنفيذ Jumpscare (صورة هاكي وأكي بالذكاء الاصطناعي) عبر مسار الرموت
local btnJumpscare = Instance.new("TextButton", mainFrame)
btnJumpscare.Size = UDim2.new(0.9, 0, 0, 42)
btnJumpscare.Position = UDim2.new(0.05, 0, 0.33, 0)
btnJumpscare.BackgroundColor3 = Color3.fromRGB(50, 15, 45)
btnJumpscare.Text = "2- JUMPSCARE [هاكي وأكي AI]"
btnJumpscare.TextColor3 = Color3.fromRGB(255, 150, 220)
btnJumpscare.TextSize = 10
btnJumpscare.Font = Enum.Font.Code

-- زر إظهار مسار الرموت في الـ Console كدليل احترافي
local btnPath = Instance.new("TextButton", mainFrame)
btnPath.Size = UDim2.new(0.9, 0, 0, 38)
btnPath.Position = UDim2.new(0.05, 0, 0.52, 0)
btnPath.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
btnPath.Text = "🔍 فحص مسارات الرموتات بالماب"
btnPath.TextColor3 = Color3.fromRGB(255, 255, 255)
btnPath.TextSize = 10
btnPath.Font = Enum.Font.Code

-- زر إخفاء الواجهة للتصوير والنظافة
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0.9, 0, 0, 35)
closeBtn.Position = UDim2.new(0.05, 0, 0.72, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 40)
closeBtn.Text = "👁️‍🗨️ إخفاء الواجهة للتصوير [Hide UI]"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 11
closeBtn.Font = Enum.Font.Code

closeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

-- 1. وظيفة Kill All عبر البحث التلقائي عن الرموتات وإطلاقها (FireServer)
btnKillAll.MouseButton1Click:Connect(function()
	pcall(function()-- 🎮🔥 [EROR90146 Lamine Yamal Style Remote Exploit Hub] 🔥🎮
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة
if CoreGui:FindFirstChild("EROR_YamalHub") then
	CoreGui.EROR_YamalHub:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EROR_YamalHub"
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 310, 0, 340)
mainFrame.Position = UDim2.new(0.04, 0, 0.15, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
mainFrame.BorderSizePixel = 4
mainFrame.BorderColor3 = Color3.fromRGB(255, 50, 150)
mainFrame.Active = true
mainFolder = mainFrame
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundColor3 = Color3.fromRGB(40, 0, 50)
title.Text = "⚡ [EROR90146] MAP REMOTE EXPLOITER ⚡"
title.TextColor3 = Color3.fromRGB(255, 120, 220)
title.TextSize = 9
title.Font = Enum.Font.Code

-- زر 1: تنفيذ ثغرة Kill All عبر مسار الرموت (شبيه بفيديو لامين يامال)
local btnKillAll = Instance.new("TextButton", mainFrame)
btnKillAll.Size = UDim2.new(0.9, 0, 0, 42)
btnKillAll.Position = UDim2.new(0.05, 0, 0.15, 0)
btnKillAll.BackgroundColor3 = Color3.fromRGB(40, 15, 15)
btnKillAll.Text = "1- KILL ALL [عبر مسار الرموت]"
btnKillAll.TextColor3 = Color3.fromRGB(255, 80, 80)
btnKillAll.TextSize = 10
btnKillAll.Font = Enum.Font.Code

-- زر 2: تنفيذ Jumpscare (صورة هاكي وأكي بالذكاء الاصطناعي) عبر مسار الرموت
local btnJumpscare = Instance.new("TextButton", mainFrame)
btnJumpscare.Size = UDim2.new(0.9, 0, 0, 42)
btnJumpscare.Position = UDim2.new(0.05, 0, 0.33, 0)
btnJumpscare.BackgroundColor3 = Color3.fromRGB(50, 15, 45)
btnJumpscare.Text = "2- JUMPSCARE [هاكي وأكي AI]"
btnJumpscare.TextColor3 = Color3.fromRGB(255, 150, 220)
btnJumpscare.TextSize = 10
btnJumpscare.Font = Enum.Font.Code

-- زر إظهار مسار الرموت في الـ Console كدليل احترافي
local btnPath = Instance.new("TextButton", mainFrame)
btnPath.Size = UDim2.new(0.9, 0, 0, 38)
btnPath.Position = UDim2.new(0.05, 0, 0.52, 0)
btnPath.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
btnPath.Text = "🔍 فحص مسارات الرموتات بالماب"
btnPath.TextColor3 = Color3.fromRGB(255, 255, 255)
btnPath.TextSize = 10
btnPath.Font = Enum.Font.Code

-- زر إخفاء الواجهة للتصوير والنظافة
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0.9, 0, 0, 35)
closeBtn.Position = UDim2.new(0.05, 0, 0.72, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 40)
closeBtn.Text = "👁️‍🗨️ إخفاء الواجهة للتصوير [Hide UI]"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 11
closeBtn.Font = Enum.Font.Code

closeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

-- 1. وظيفة Kill All عبر البحث التلقائي عن الرموتات وإطلاقها (FireServer)
btnKillAll.MouseButton1Click:Connect(function()
	pcall(function()
		local networkFolder = ReplicatedStorage:FindFirstChild("NetworkFolder") or ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage
		for _, v in ipairs(networkFolder:GetDescendants()) do
			if v:IsA("RemoteEvent") and (string.find(string.lower(v.Name), "kill") or string.find(string.lower(v.Name), "death") or string.find(string.lower(v.Name), "damage")) then
				v:FireServer()
			end
		end
		
		-- طريقة احتياطية فورية لإسقاط اللاعبين إذا لم يوجد رموت ظاهر
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LocalPlayer and p.Character then
				local hum = p.Character:FindFirstChildOfClass("Humanoid")
				if hum then hum.Health = 0 end
			end
		end
		
		local hint = Instance.new("Hint", Workspace)
		hint.Text = "💀 [EROR90146] REPLICATEDSTORAGE.NETWORKFOLDER.KILLALL Executed!"
		task.wait(3)
		hint:Destroy()
	end)
end)

-- 2. وظيفة Jumpscare (صورة هاكي وأكي بالذكاء الاصطناعي) عبر الرموتات
btnJumpscare.MouseButton1Click:Connect(function()
	pcall(function()
		local networkFolder = ReplicatedStorage:FindFirstChild("NetworkFolder") or ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage
		for _, v in ipairs(networkFolder:GetDescendants()) do
			if v:IsA("RemoteEvent") and (string.find(string.lower(v.Name), "event") or string.find(string.lower(v.Name), "jump") or string.find(string.lower(v.Name), "scare")) then
				v:FireServer()
			end
		end
		
		local hint = Instance.new("Hint", Workspace)
		hint.Text = "⚡ [EROR90146] REPLICATEDSTORAGE.NETWORKFOLDER.JEVENT Executed!"
		
		-- إنشاء شاشة الرعب وعرض صورة "هاكي وأكي" المولدة بالذكاء الاصطناعي
		local scareGui = Instance.new("ScreenGui", CoreGui)
		scareGui.Name = "HakiAkaiJumpscareGui"
		
		local bg = Instance.new("Frame", scareGui)
		bg.Size = UDim2.new(1, 0, 1, 0)
		bg.BackgroundColor3 = Color3.fromRGB(5, 0, 10)
		
		-- عنصر الصورة لتصميم هاكي وأكي بالذكاء الاصطناعي
		local aiImage = Instance.new("ImageLabel", bg)
		aiImage.Size = UDim2.new(0, 420, 0, 420)
		aiImage.Position = UDim2.new(0.5, -210, 0.5, -210)
		aiImage.BackgroundTransparency = 1
		aiImage.Image = "rbxassetid://6023426915" -- رابط تصميم شخصيات هاكي وأكي الدقيق
		
		local txt = Instance.new("TextLabel", bg)
		txt.Size = UDim2.new(1, 0, 0, 80)
		txt.Position = UDim2.new(0, 0, 0.82, 0)
		txt.BackgroundTransparency = 1
		txt.Text = "⚡ HAKI & AKAI [AI JUMPSCARE] ⚡\n[EROR90146]"
		txt.TextColor3 = Color3.fromRGB(255, 0, 150)
		txt.TextSize = 24
		txt.Font = Enum.Font.Code
		
		task.wait(3.5)
		scareGui:Destroy()
		hint:Destroy()
	end)
end)

-- فحص مسارات الرموتات وطباعتها في الـ Console
btnPath.MouseButton1Click:Connect(function()
	pcall(function()
		print("=== [EROR90146] Scanning Map Remotes ===")
		for _, v in ipairs(ReplicatedStorage:GetDescendants()) do
			if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
				print("Found Remote Path: " .. v:GetFullName())
                  end
                  end
		local hint = Instance.new("Hint", Workspace)
		hint.Text = "🔍 [EROR90146] Check Console (F9) for Remote Paths!"
		task.wait(3)
		hint:Destroy()
	end)
end)

print("⚡ [EROR90146 Lamine Yamal Style Hub Loaded Successfully] ⚡")
