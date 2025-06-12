-- 👑 FE GUI BYPASS SCRIPT by BIGLOCK444
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "BigLockGui"

-- Main GUI Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0.5, -125, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Layout
local layout = Instance.new("UIListLayout", frame)
layout.Padding = UDim.new(0, 10)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center

-- Function tạo nút
local function createButton(text, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0, 200, 0, 40)
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
	btn.MouseButton1Click:Connect(callback)
end

-- 🔁 Nút 1: Đổi Skybox
createButton("Đổi Skybox", function()
	local Lighting = game:GetService("Lighting")
	local sky = Instance.new("Sky", Lighting)
	local img = "rbxassetid://104626750148651"
	sky.SkyboxBk = img
	sky.SkyboxDn = img
	sky.SkyboxFt = img
	sky.SkyboxLf = img
	sky.SkyboxRt = img
	sky.SkyboxUp = img
end)

-- 📡 Nút 2: Phá map + tạo mặt phẳng + dịch player
createButton("Phá map & Tạo mặt phẳng", function()
	local Players = game:GetService("Players")

	-- Xoá toàn bộ map (trừ player & camera)
	for _, obj in pairs(workspace:GetChildren()) do
		if not obj:IsA("Camera") and not Players:GetPlayerFromCharacter(obj) then
			obj:Destroy()
		end
	end

	-- Tạo mặt phẳng
	local plane = Instance.new("Part", workspace)
	plane.Size = Vector3.new(999, 1, 999)
	plane.Anchored = true
	plane.Position = Vector3.new(0, 100, 0)
	plane.BrickColor = BrickColor.new("Really black")

	-- Dịch toàn bộ player
	for _, p in pairs(Players:GetPlayers()) do
		if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			p.Character.HumanoidRootPart.CFrame = CFrame.new(plane.Position + Vector3.new(0, 5, 0))
		end
	end
end)

-- 🔊 Nút 3: Phát nhạc loud
createButton("Bật nhạc loud", function()
	local SoundService = game:GetService("SoundService")
	local sound = Instance.new("Sound", SoundService)
	sound.SoundId = "rbxassetid://9129993133"
	sound.Volume = 10
	sound.Looped = true
	sound:Play()
end)

-- 🧠 Nút 4: Credit
createButton("Made by BIGLOCK444", function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "🔥 Respect 🔥",
		Text = "Script by BIGLOCK444",
		Duration = 4
	})
end)
