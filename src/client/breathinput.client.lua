local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")

local ACTION_BREATH = "Breath"

local BreathModule = require(script.Parent:WaitForChild("breathmeter"))

local qIsPressed = false

local function handleBreath(actionName: string, inputState: Enum)
    if actionName == ACTION_BREATH and inputState == Enum.UserInputState.Begin then
        qIsPressed = true
		repeat
            BreathModule.UpdateBreathAmount(2)
            task.wait(0.05)
            print("i")
        until qIsPressed == false or BreathModule.ReturnBreathAmount() >= 100
	end

    if actionName == ACTION_BREATH and inputState == Enum.UserInputState.End then
        qIsPressed = false
		repeat
            BreathModule.UpdateBreathAmount(-0.5)
            task.wait(0.1)
            print("i")
        until qIsPressed == true or BreathModule.ReturnBreathAmount() <= 0
	end
end

ContextActionService:BindAction(ACTION_BREATH, handleBreath, true, Enum.KeyCode.Q)