local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local BreathGui = player:WaitForChild("PlayerGui"):WaitForChild("BreathGui")
local BreathMeterBar = BreathGui:WaitForChild("BreathAmountFrame"):WaitForChild("BreathAmount")

local breathAmount = 0

local BreathMeter = {}

function BreathMeter.UpdateBreathAmount(amount: number)
    if breathAmount == 0 and amount <= 0 then
        return
    end
    if breathAmount == 100 and amount >= 100 then
        return
    end

    breathAmount += amount

    if breathAmount > 100 then
        breathAmount = 100
    end
    if breathAmount < 0 then
        breathAmount = 0
    end
    
    

    print(breathAmount)

    local tweenGui = {}
    tweenGui.Size = UDim2.new(1, 0, breathAmount/100, 0)
    tweenGui.Position = UDim2.new(0, 0, 1 - (breathAmount/100), 0)

    local breathMeterTween = TweenService:Create(BreathMeterBar, TweenInfo.new(0.01, Enum.EasingStyle.Exponential), tweenGui)
    breathMeterTween:Play()
end

function BreathMeter.ReturnBreathAmount()
    return breathAmount
end

return BreathMeter