local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local uis = game:GetService("UserInputService")
-- VERSION == 3.3
---
local onRecording = false
---

---
local onPlaying = false
---

---
local FR = 0
---


---
local FRAMES = {}
---

local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "RORecord(CHEAT)"


local record_button2 = Instance.new("TextButton", screenGui) local uiCorner = Instance.new("UICorner", record_button2)
record_button2.Name = "RecordButtonREAL"
record_button2.Position = UDim2.new(0.303, 0,0, 0)
record_button2.Size = UDim2.new(0.125, 0,0.08, 0)
record_button2.TextColor = BrickColor.new("Really red")
record_button2.Text = "Record"
record_button2.TextScaled = true
record_button2.Style = Enum.ButtonStyle.RobloxButton

local play_button = Instance.new("TextButton", screenGui) local uiCorner2 = Instance.new("UICorner", play_button)
play_button.Name = "Play_Button"
play_button.Position = UDim2.new(0.572, 0,0, 0)
play_button.Size = UDim2.new(0.125, 0,0.08, 0)
play_button.TextColor = BrickColor.new("Lime green")
play_button.Text = "Play"
play_button.TextScaled = true
play_button.Style = Enum.ButtonStyle.RobloxButton

local enter_speed_reverse = Instance.new("TextBox", screenGui) local uiCorner3 = Instance.new("UICorner", enter_speed_reverse)
enter_speed_reverse.Name = "Reverse Speed"
enter_speed_reverse.Position = UDim2.new(0.437, 0,0, 0)
enter_speed_reverse.Size = UDim2.new(0.125, 0,0.08, 0)
enter_speed_reverse.TextColor = BrickColor.new("Lime green")
enter_speed_reverse.BackgroundColor = BrickColor.new("Dark grey")
enter_speed_reverse.Text = "Enter your speed (number)"
enter_speed_reverse.PlaceholderText = "Number"
enter_speed_reverse.TextScaled = true

local time_recording_label = Instance.new("TextLabel", screenGui) local uiCorner4 = Instance.new("UICorner", time_recording_label)
time_recording_label.Name = "time_recording"
time_recording_label.BackgroundTransparency = 0.5
time_recording_label.BackgroundColor = BrickColor.new("Really black")
time_recording_label.Position = UDim2.new(0.317, 0,0.092, 0)
time_recording_label.Size = UDim2.new(0.097, 0,0.066, 0)
time_recording_label.TextColor = BrickColor.new("Grey")
time_recording_label.Text = 0
time_recording_label.Visible = false
time_recording_label.TextScaled = true

enter_speed_reverse:GetPropertyChangedSignal("Text"):Connect(function()
	pcall(function()
		if tonumber(enter_speed_reverse.Text) > 50 then
			enter_speed_reverse.TextColor = BrickColor.new("Really red")
		else
			enter_speed_reverse.TextColor = BrickColor.new("Lime green")
		end
	end)
end)


record_button2.MouseButton1Click:Connect(function()
	if onRecording then
		onRecording = false
		time_recording_label.Visible = false
		record_button2.Text = "Record"
	else
		onRecording = true
		time_recording_label.Visible = true
		record_button2.Text = "Recording"
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if onRecording then
		table.insert(FRAMES, character:FindFirstChild("HumanoidRootPart").CFrame)
		FR += 1
		time_recording_label.Text = "Frames: " .. FR
	end
end)

play_button.MouseButton1Click:Connect(function()
	if tonumber(enter_speed_reverse.Text) <= 50 then

		play_button.Text = "Playing"
		onPlaying = true
		onRecording = false
		time_recording_label.Visible = false

		record_button2.Text = "Record"
		for i = #FRAMES, 1, -tonumber(enter_speed_reverse.Text) do
			task.wait()
			character:FindFirstChild("HumanoidRootPart").CFrame = FRAMES[i]
		end
	end
	play_button.Text = "Play"
	onPlaying = false
	table.clear(FRAMES)
	time_recording_label.Text = 0
	FR = 0
end)

uis.InputBegan:Connect(function(input, proccess)
	if proccess then
		return
	end
	if input.KeyCode == Enum.KeyCode.R then
		if onRecording then
			onRecording = false
			time_recording_label.Visible = false
			record_button2.Text = "Record"
		else
			onRecording = true
			time_recording_label.Visible = true
			record_button2.Text = "Recording"
		end
	end
end)

uis.InputBegan:Connect(function(input, proccess)
	if proccess then
		return
	end
	if input.KeyCode == Enum.KeyCode.X then
		if tonumber(enter_speed_reverse.Text) <= 50 then

			play_button.Text = "Playing"
			onPlaying = true
			onRecording = false
			time_recording_label.Visible = false

			record_button2.Text = "Record"
			for i = #FRAMES, 1, -tonumber(enter_speed_reverse.Text) do
				task.wait()
				character:FindFirstChild("HumanoidRootPart").CFrame = FRAMES[i]
			end
		end
		play_button.Text = "Play"
		onPlaying = false
		table.clear(FRAMES)
		time_recording_label.Text = 0
		FR = 0
		end
end)
