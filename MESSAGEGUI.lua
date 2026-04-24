local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MessageSenderGUI"
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 250, 0, 120)
frame.Position = UDim2.new(0.5, -125, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Title
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0.25, 0)
title.BackgroundTransparency = 1
title.Text = "MESSAGE SENDER"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

-- TextBox
local textbox = Instance.new("TextBox")
textbox.Parent = frame
textbox.Size = UDim2.new(0.9, 0, 0.3, 0)
textbox.Position = UDim2.new(0.05, 0, 0.35, 0)
textbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textbox.TextColor3 = Color3.fromRGB(255, 0, 0)
textbox.PlaceholderText = "Enter message..."
textbox.Text = ""
textbox.Font = Enum.Font.SourceSans
textbox.TextScaled = true

-- Button
local button = Instance.new("TextButton")
button.Parent = frame
button.Size = UDim2.new(0.5, 0, 0.25, 0)
button.Position = UDim2.new(0.25, 0, 0.7, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 0, 0)
button.Text = "SEND"
button.Font = Enum.Font.SourceSansBold
button.TextScaled = true

-- Function
button.MouseButton1Click:Connect(function()
	local text = textbox.Text
	if text ~= "" then
		local args = {
			";mr " .. text
		}
		game:GetService("ReplicatedStorage")
			:WaitForChild("HDAdminHDClient")
			:WaitForChild("Signals")
			:WaitForChild("RequestCommandSilent")
			:InvokeServer(unpack(args))
	end
end)
