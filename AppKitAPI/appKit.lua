-- Put this script in YOURAPP > appKit.lua
-- This script is a MODULESCRIPT

-- Copyright 2024 YHStudios

-- Services and others
local TweeenService = game:GetService("TweenService")
local module = {}
local player = game.Players.LocalPlayer
local logo = script.Parent.mainWindow.loading.logo

function module.Execute()
  -- Set launching to true
	script.Parent.launching.Value = true
  
	-- Prepare legacy window copy
	local copy = script.Parent:Clone()
	copy.Parent = game.ReplicatedStorage
  -- REPLACE "APPNAMEHERE" WITH YOUR APP NAME BELOW --
	copy.Name = "APPNAMEHERE"

  -- Check how many instances of this app already exist
	local children = player.PlayerGui:GetChildren()
	local highestnumber = 1
	for i=1, #children do
    -- REPLACE "APPNAMEHERE" WITH YOUR APP NAME BELOW, THEN ADD "INSTANCE" TO THE END--
		if children[i].Name:match("APPNAMEHEREINSTANCE") then
			print(i)
			print(children[i].Name)
			highestnumber += 1
		end
	end
	print("HIGHEST NUMBER"..highestnumber)
  -- REPLACE "APPNAMEHERE" WITH YOUR APP NAME BELOW, THEN ADD "INSTANCE" TO THE END--
	script.Parent.Name = "APPNAMEHEREINSTANCE"..highestnumber
	local instanceicon = player.PlayerGui.desktop.taskbar.YDOCSINSTANCE:Clone()
	instanceicon.Parent = player.PlayerGui.desktop.taskbar
  
	instanceicon.Name = "YDOCSINSTANCE" .. highestnumber
	instanceicon.Visible = true
	print(instanceicon.Name)
	
	-- Prepare current window
	script.Parent.Parent = player.PlayerGui
	
	-- Close other pages
	script.Parent.mainWindow.about.Visible = false
	script.Parent.mainWindow.documentEditor.Visible = false
	script.Parent.mainWindow.load.Visible = false
	script.Parent.mainWindow.sidebar.Visible = false
	script.Parent.mainWindow.loading.Visible = true
	
	
	-- Display window
	script.Parent.Enabled = true
	
	-- Show cool intro
	logo.Parent.explorertext.TextTransparency = 1
	logo.ImageTransparency = 0
	logo.Parent.BackgroundTransparency = 0
	logo.TileSize = UDim2.new(0,1,0,1)
	local tilegoal = {TileSize = UDim2.new(0,150,0,150)}
	logo.Position = UDim2.new(0,0,0,0)
	local posgoal = {Position = UDim2.new(0.5,-75,0.5,-75)}
	logo.Size = UDim2.new(1,0,1,0)
	local sizegoal = {Size = UDim2.new(0,150,0,150)}
	local tiletween = TweeenService:Create(logo,TweenInfo.new(1.5, Enum.EasingStyle.Back), tilegoal)
	local postween = TweeenService:Create(logo,TweenInfo.new(1.5, Enum.EasingStyle.Circular), posgoal)
	local sizetween = TweeenService:Create(logo,TweenInfo.new(1.5, Enum.EasingStyle.Circular), sizegoal)

	tiletween:Play()
	postween:Play()
	sizetween:Play()
	
	wait(1)
	
	logo.Parent.explorertext.TextTransparency = 1
	local transparencygoal = {TextTransparency = 0}
	local transparencytween = TweeenService:Create(logo.Parent.explorertext,TweenInfo.new(0.5), transparencygoal)
	transparencytween:Play()
	
	wait(math.random(1,4))
	script.Parent.mainWindow.about.Visible = true
	script.Parent.mainWindow.load.Visible = true
	script.Parent.mainWindow.sidebar.Visible = true

	local frametransparencygoal = {BackgroundTransparency = 1}
	local imagetransparencygoal = {ImageTransparency = 1}
	local texttransparencygoal = {TextTransparency = 1}
	
	local frametween = TweeenService:Create(logo.Parent, TweenInfo.new(0.25), frametransparencygoal)
	local imagetween = TweeenService:Create(logo, TweenInfo.new(0.25), imagetransparencygoal)
	local texttween = TweeenService:Create(logo.Parent.explorertext, TweenInfo.new(0.25), texttransparencygoal)
	
	frametween:Play()
	imagetween:Play()
	texttween:Play()
	
	wait(0.25)
	
	
	script.Parent.mainWindow.loading.Visible = false
	script.Parent.launching.Value = false
	
end

return module
