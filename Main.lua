local timo = false
local search = ""
local library = loadstring(game:HttpGet("http://zerotwo.ga/script/wally", true))()
local Visual = library:CreateWindow("Visual")
local Misc = library:CreateWindow("Misc")
local TP = library:CreateWindow("Teleport (beta)")

-----------------------
 
local function randomtp()
	print("trying to randomtp")
	for i, thing in pairs(workspace.SpecialRegions:GetChildren()) do
		if thing.Name == "Anomaly" then
			if thing.Active.Value == true then
				print(thing.Active.Value)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = thing.CFrame
				break
			end
		end
	end
	print("randomtp complete or failed")
end

local function shiptp()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.GameIntro.Seat.CFrame
end


local function lookattimo()
    local i = 0
    repeat
        i = i + 1
        wait()
        local rotframe = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, workspace.Monster.A.Torso.Position)
        workspace.CurrentCamera.CFrame = rotframe
 
    until (i > 20)
end
 
local function CRATESP(state)
    if state == true then
        local fold = Instance.new("Part",workspace)
        fold.Name = "CRATESP"
        fold.Anchored = true
        for i, item in pairs(workspace:GetChildren()) do
            if item.Name == "Crate" then
                local lol = Instance.new("BillboardGui",fold)
                lol.AlwaysOnTop = true
                lol.Enabled = true
                lol.MaxDistance = math.huge
                lol.Size = UDim2.new(0, 80, 0, 5)
                lol.Adornee = item.Spawner
                local txt = Instance.new("TextLabel", lol)
                txt.Text = "Crate: "..item["#Bypassable"].Item.Value
                txt.BackgroundTransparency = 1
                txt.Position = UDim2.new(0, 0, -0.9, 0)
                txt.Size = UDim2.new(1, 0, 0, 46)
                txt.Font = Enum.Font.SourceSansBold
                txt.TextColor3 = Color3.fromRGB(100, 255, 100)
                if string.match(item.Name, search) and search ~= "" then
                    txt.TextColor3 = Color3.fromRGB(0, 255, 255)
                end
                txt.TextScaled = true
                txt.TextStrokeTransparency = 0.5
            end
        end
    else
        workspace.CRATESP:Destroy()
    end
end
 
local function ITEMESP(state)
    if state == true then
        local fold = Instance.new("Part",workspace)
        fold.Name = "ITEMESP"
        fold.Anchored = true
        for i, item in pairs(workspace.Tools:GetChildren()) do
            local lol = Instance.new("BillboardGui",fold)
            lol.AlwaysOnTop = true
            lol.Enabled = true
            lol.MaxDistance = math.huge
            lol.Size = UDim2.new(0, 50, 0, 5)
            lol.Adornee = item.Handle
            local txt = Instance.new("TextLabel", lol)
            txt.Text = item.Name
            txt.BackgroundTransparency = 1
            txt.Position = UDim2.new(0, 0, -0.9, 0)
            txt.Size = UDim2.new(1, 0, 0, 46)
            txt.Font = Enum.Font.SourceSansBold
            txt.TextColor3 = Color3.fromRGB(255, 255, 255)
            if string.match(item.Name, search) and search ~= "" then
                txt.TextColor3 = Color3.fromRGB(0, 255, 255)
            end
            txt.TextScaled = true
            txt.TextStrokeTransparency = 0.5
        end
    else
        workspace.ITEMESP:Destroy()
    end
end
 
local function MERCESP(state)
    if state == true then
        local fold = Instance.new("Part",workspace)
        fold.Name = "MERCESP"
        fold.Anchored = true
        for i, item in pairs(workspace.AIHunter:GetChildren()) do
            if item:FindFirstChild("Head") then
                local lol = Instance.new("BillboardGui",fold)
                lol.AlwaysOnTop = true
                lol.Enabled = true
                lol.MaxDistance = math.huge
                lol.Size = UDim2.new(0, 50, 0, 5)
                lol.Adornee = item.Head
                local txt = Instance.new("TextLabel", lol)
                txt.Text = item.Name
                txt.BackgroundTransparency = 1
                txt.Position = UDim2.new(0, 0, -0.9, 0)
                txt.Size = UDim2.new(1, 0, 0, 46)
                txt.Font = Enum.Font.SourceSansBold
                txt.TextColor3 = Color3.fromRGB(255, 100, 100)
                if string.match(item.Name, search) and search ~= "" then
                    txt.TextColor3 = Color3.fromRGB(0, 255, 255)
                end
                txt.TextScaled = true
                txt.TextStrokeTransparency = 0.5
            end
           
        end
    else
        workspace.MERCESP:Destroy()
    end
end
 
local function COLESP(state)
    if state == true then
        local fold = Instance.new("Part",workspace)
        fold.Name = "COLESP"
        fold.Anchored = true
        for i, item in pairs(workspace.Collectibles:GetChildren()) do
            local lol = Instance.new("BillboardGui",fold)
            lol.AlwaysOnTop = true
            lol.Enabled = true
            lol.MaxDistance = math.huge
            lol.Size = UDim2.new(0, 50, 0, 5)
            lol.Adornee = item
            local txt = Instance.new("TextLabel", lol)
            txt.Text = item.Name
            txt.BackgroundTransparency = 1
            txt.Position = UDim2.new(0, 0, -0.9, 0)
            txt.Size = UDim2.new(1, 0, 0, 46)
            txt.Font = Enum.Font.SourceSansBold
            txt.TextColor3 = Color3.fromRGB(255, 255, 255)
            if string.match(item.Name, search) and search ~= "" then
                txt.TextColor3 = Color3.fromRGB(0, 255, 255)
            end
            txt.TextScaled = true
            txt.TextStrokeTransparency = 0.5
        end
    else
        workspace.COLESP:Destroy()
    end
end
--------------------
--[[local credits = library:CreateWindow({text='Credits'})
credits:AddLabel("Credits")
credits:AddLabel("Aaro On V3RM: Scripting")
credits:AddLabel("wally: UI")
credits:AddLabel("--[ ISLE HUB ]--")--]]
local function setsearch(item)
    search = item
end
Visual:SearchBox("Search", {
   location = shared;
   flag = "Search";
   list = {
       "Battle Rifle";
       "Revolver";
       "Scoped Rifle";
       "Proton Cannon";
       "Double Barrel Shotgun";
       "Combat Shotgun";
       "Sub-machine Gun";
       "Tactical Pistol";
       "Light Machine Gun";
       "Gatling Gun";
       "Grenade Launcher";
       "Orbital Strike";
       "Tactical Shotgun";
       "Sniper Rifle";
       "Assault shotgun";
       "Energy Lancer";
       "Strange Drink";
   }
}, setsearch)
 
-- add buttons thingos

Visual:Toggle("Item ESP",{} ,function(state)
    ITEMESP(state)
end)
 
Visual:Toggle("Collectible ESP",{} , function(state)
    COLESP(state)
end)
 
Visual:Toggle("Merc ESP",{} , function(state)
    MERCESP(state)
end)
 
Visual:Toggle("Crate ESP",{} , function(state)
    CRATESP(state)
end)
 
Misc:Toggle("Anti-Stan",{} , function(state)
    timo = state
end)
 
Misc:Button("Lab Code", function()
    for i, thing in pairs(workspace:GetChildren()) do
        if thing.Name == "Part" and thing:FindFirstChild("SurfaceGui") then
            if thing.SurfaceGui:FindFirstChild("TextLabel") then
                if tonumber(thing.SurfaceGui.TextLabel.Text) ~= nil then
                    print(thing.SurfaceGui.TextLabel.Text)
                end
            end
        end
    end
end)
 
Misc:Button("Portal Email", function()
    print(workspace.ObservatoryComputer.Monitor.SurfaceGui.Email["6"].Message2.Text)
end)

TP:Button("Random TP", function()
    randomtp()
end)
TP:Button("Ship TP (only day1)", function()
    shiptp()
end)
 

--[[local dropdown;
dropdown = Visual:AddDropdown({'Synapse', 'ProtoSmasher', 'Elysian', 'SirHurt', 'Visenya', 'Sk8r', 'JJSploit', 'Axon', 'Axon Infinite', 'Venyx', 'Game Ended', 'Ventura', 'Proxo', 'P4.0'}, function(a)
if a == 'Elysian' then
dropdown:Refresh({'A', 'B', 'C'})
end
end)--]]

--LOOP at end

while true do
    wait(0.1)
    local magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Monster.A.Torso.Position).Magnitude
    if magnitude < 200 and timo == true then
        if workspace.Monster.A.Torso.Transparency == 0 then
            lookattimo()
        end
    end
   
end
