local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local run = game:GetService("RunService")

local speed = 50
local flying = false
local bv

function startFly()
    local char = plr.Character or plr.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")

    bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e5,1e5,1e5)
    bv.Velocity = Vector3.zero
    bv.Parent = root

    run.RenderStepped:Connect(function()
        if not flying then return end

        local dir = Vector3.zero
        local cam = workspace.CurrentCamera

        if uis:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
        if uis:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= Vector3.new(0,1,0) end

        if dir.Magnitude > 0 then
            bv.Velocity = dir.Unit * speed
        else
            bv.Velocity = Vector3.zero
        end

        root.AssemblyLinearVelocity = Vector3.zero
    end)
end

function stopFly()
    if bv then bv:Destroy() end
end

uis.InputBegan:Connect(function(key, g)
    if g then return end

    if key.KeyCode == Enum.KeyCode.F then
        flying = not flying
        if flying then
            startFly()
        else
            stopFly()
        end
    end
end)
