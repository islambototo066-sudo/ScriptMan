الكاميرا المحلية = مساحة العمل.الكاميرا الحالية

إذا كانت قيمة getgenv().StretchActive تساوي nil،
    game:GetService("RunService").RenderStepped:Connect(function()
        Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.67, 0, 0, 0, 1)
    نهاية)
نهاية

getgenv().StretchActive = true
