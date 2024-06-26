local rotationAngle = 220

local players = game:GetService("Players")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "fling!";
    Text = "script by drapak";
    Icon = "rbxthumb://type=AvatarHeadShot&id=" .. players.LocalPlayer.UserId .. "&w=180&h=180 true";
    Duration = 2
})

local allowedUsernames = {
    "getitonamazon1",
    "hazem10477",
    "adaas6raz"
}

local function isUsernameAllowed(username)
    for _, allowedUsername in ipairs(allowedUsernames) do
        if username:lower() == allowedUsername:lower() then
            return true
        end
    end
    return false
end

local function performHeadstand(character)
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(rotationAngle), 0, 0)
    end
end

local function showNoPermissionNotification()
    local notification = Instance.new("ScreenGui")
    notification.Name = "NoPermissionNotification"
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.1, 0)
    frame.Position = UDim2.new(0.25, 0, 0.85, 0)
    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    frame.BorderSizePixel = 0
    frame.Parent = notification
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = "No permission!"
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.BackgroundTransparency = 1
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 20
    textLabel.Parent = frame
    
    notification.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- Remove notification after a few seconds
    wait(3)
    notification:Destroy()
end

local player = game.Players.LocalPlayer

player.CharacterAdded:Connect(function(character)
    character:WaitForChild("HumanoidRootPart")
    if isUsernameAllowed(player.Name) then
        performHeadstand(character)
    else
        showNoPermissionNotification()
    end
end)

if player.Character then
    if isUsernameAllowed(player.Name) then
        performHeadstand(player.Character)
    else
        showNoPermissionNotification()
    end
end
