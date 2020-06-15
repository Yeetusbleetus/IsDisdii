
if _G.CanCollide == nil then
	_G.CanCollide = false
end

local drones = {}

drones["Aaro_1"] = "Aaro_Drone"
drones["GINTASM2"] = "He1per_Drone"

local dronefolder = game:GetObjects("rbxassetid://5181517447")[1]
dronefolder.Parent = game.ReplicatedStorage

local fol = Instance.new("Folder",workspace)

local function insertdrone(plr)
	local dronemodel = dronefolder[drones[plr.Name]]:Clone()
	dronemodel.Name = plr.Name
	dronemodel.Parent = fol

	local primarypart = dronemodel.PrimaryPart
	for i, part in pairs(dronemodel:GetDescendants()) do
		
		if part == primarypart then
		elseif part:IsA("BasePart") then
			local weld = Instance.new("WeldConstraint")
			weld.Parent = primarypart
			weld.Part0 = primarypart
			weld.Part1 = part
			part.Anchored = false
			part.CanCollide = _G.CanCollide
		end
	end
	primarypart.Anchored = false
	primarypart.CanCollide = _G.CanCollide
	local BP = Instance.new("BodyPosition",primarypart)
	local BG = Instance.new("BodyGyro",primarypart)
	BP.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
	
	dronemodel:SetPrimaryPartCFrame(plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,5,0))
	
	BG.D = 500
	BP.D = 2000
end

local RS = game:GetService("RunService")



RS.RenderStepped:Connect(function()
	for i, p in pairs(game.Players:GetPlayers()) do
		if drones[p.Name] then
			if fol:FindFirstChild(p.Name) == nil then
				insertdrone(p)
			end
			local CF = ((p.Character.HumanoidRootPart.CFrame * CFrame.new(7,10,7))*CFrame.Angles(0,math.rad(180),0))
			local drone = fol:FindFirstChild(p.Name)
			local BG = drone.PrimaryPart:FindFirstChild("BodyGyro")
			local BP = drone.PrimaryPart:FindFirstChild("BodyPosition")
			BP.position = CF.p
			BG.CFrame = CF
		end
	end
end)
