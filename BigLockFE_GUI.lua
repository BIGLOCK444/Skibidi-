-->> Tạo ScreenGui
local screenGui = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "BigLockExecutor"
screenGui.ResetOnSpawn = false

-->> Main GUI Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-->> Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -35, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.Parent = mainFrame

-->> Icon to reopen GUI
local icon = Instance.new("ImageButton")
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0.05, 0, 0.05, 0)
icon.Image = "rbxassetid://75989574651651"
icon.BackgroundTransparency = 1
icon.Visible = false
icon.Parent = screenGui
icon.Active = true
icon.Draggable = true

-->> Script to toggle GUI visibility
minimizeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	icon.Visible = true
end)

icon.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	icon.Visible = false
end)
