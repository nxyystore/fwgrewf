-- Version: 3.1 | UI: Rayfield

local you = game.Players.LocalPlayer
local lighting = game.Lighting
local char = you.Character
local humanoid = char:FindFirstChildOfClass("Humanoid")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Ranxware | UTG V3.1",
	Icon = "tag",
	LoadingTitle = "Ranxware | UTG V3.1",
	LoadingSubtitle = "Untitled Tag Script",
	ShowText = "Ranxware",
	Theme = "Default",
	ToggleUIKeybind = Enum.KeyCode.RightShift,
	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil,
		FileName = "RanxwareUTG"
	},
	Discord = {
		Enabled = false,
		Invite = "noinvitelink",
		RememberJoins = true
	},
	KeySystem = false,
})

-- =====================
--   TABS
-- =====================

local TagTab      = Window:CreateTab("Tag Cheats",   "tag")
local MovementTab = Window:CreateTab("Movement",     "footprints")
local ExperiTab   = Window:CreateTab("Experimental", "flask-conical")
local MiscTab     = Window:CreateTab("Misc",         "wrench")

-- =====================
--   SECTIONS
-- =====================

local HitboxSec  = TagTab:CreateSection("Hitboxes")
local AutotagSec = TagTab:CreateSection("Autotag [BETA]")
local HumanSec   = MovementTab:CreateSection("Humanoid")
local PhysSec    = MovementTab:CreateSection("Physical")
local ExpMainSec = ExperiTab:CreateSection("Main")
local VisualsSec = ExperiTab:CreateSection("Visuals [BETA]")
local MiscSec    = MiscTab:CreateSection("Misc")

-- =====================
--   HITBOXES
-- =====================

local hbcon  = false
local hbsize = 2

TagTab:CreateToggle({
	Name         = "Hitbox Extend",
	CurrentValue = false,
	Flag         = "HitboxExtend",
	Callback     = function(value)
		hbcon = value
	end,
})

TagTab:CreateSlider({
	Name         = "Hitbox Size",
	Range        = {2, 15},
	Increment    = 1,
	Suffix       = "studs",
	CurrentValue = 2,
	Flag         = "HitboxSize",
	Callback     = function(value)
		hbsize = value
	end,
})

-- =====================
--   AUTOTAG
-- =====================

local atcon         = false
local at_teamcheck  = false
local at_runnercheck = true

TagTab:CreateDivider()

TagTab:CreateToggle({
	Name         = "Autotag",
	CurrentValue = false,
	Flag         = "Autotag",
	Callback     = function(value)
		atcon = value
	end,
})

TagTab:CreateToggle({
	Name         = "Team Check",
	CurrentValue = false,
	Flag         = "AutotagTeamCheck",
	Callback     = function(value)
		at_teamcheck = value
	end,
})

TagTab:CreateToggle({
	Name         = "Runner/Alive Check",
	CurrentValue = true,
	Flag         = "AutotagRunnerCheck",
	Callback     = function(value)
		at_runnercheck = value
	end,
})

-- =====================
--   HUMANOID (MOVEMENT)
-- =====================

local wsval, jpval   = 30, 32
local wscon, jpcon   = false, false
local changeWs, changeJp

MovementTab:CreateToggle({
	Name         = "Walkspeed",
	CurrentValue = false,
	Flag         = "WalkspeedToggle",
	Callback     = function(value)
		if value then
			wscon = true
			changeWs = function()
				humanoid.WalkSpeed = wsval
			end
			changeWs()
		else
			wscon = false
		end
	end,
})

MovementTab:CreateSlider({
	Name         = "Walkspeed Value",
	Range        = {26, 65},
	Increment    = 1,
	Suffix       = "speed",
	CurrentValue = 30,
	Flag         = "WalkspeedValue",
	Callback     = function(value)
		wsval = value
	end,
})

MovementTab:CreateDivider()

MovementTab:CreateToggle({
	Name         = "Jumppower",
	CurrentValue = false,
	Flag         = "JumppowerToggle",
	Callback     = function(value)
		if value then
			jpcon = true
			changeJp = function()
				humanoid.UseJumpPower = true
				humanoid.JumpPower = jpval
			end
			changeJp()
		else
			jpcon = false
		end
	end,
})

MovementTab:CreateSlider({
	Name         = "Jumppower Value",
	Range        = {30, 90},
	Increment    = 1,
	Suffix       = "power",
	CurrentValue = 32,
	Flag         = "JumppowerValue",
	Callback     = function(value)
		jpval = value
	end,
})

-- =====================
--   PHYSICAL (MOVEMENT)
-- =====================

local fclimbcon = false
local noclipcon = false
local fmovecon  = false
local infj      = false

MovementTab:CreateDivider()

MovementTab:CreateToggle({
	Name         = "Infinite Jump",
	CurrentValue = false,
	Flag         = "InfiniteJump",
	Callback     = function(value)
		infj = value
	end,
})

MovementTab:CreateToggle({
	Name         = "Fast Climb",
	CurrentValue = false,
	Flag         = "FastClimb",
	Callback     = function(value)
		fclimbcon = value
	end,
})

MovementTab:CreateToggle({
	Name         = "Free Move",
	CurrentValue = false,
	Flag         = "FreeMove",
	Callback     = function(value)
		fmovecon = value
	end,
})

MovementTab:CreateToggle({
	Name         = "Noclip",
	CurrentValue = false,
	Flag         = "Noclip",
	Callback     = function(value)
		noclipcon = value
	end,
})

-- =====================
--   EXPERIMENTAL MAIN
-- =====================

local atcoin = false

ExperiTab:CreateToggle({
	Name         = "Autocollect Coins [ALIVE ONLY!]",
	CurrentValue = false,
	Flag         = "AutocollectCoins",
	Callback     = function(value)
		atcoin = value
	end,
})

-- =====================
--   VISUALS / ESP
-- =====================

local esp         = false
local boxes       = false
local chams       = false
local tracers     = false
local names       = false
local roles       = false
local teamcheck   = true
local tracerorigin = "Bottom"
local rainbow_    = false

ExperiTab:CreateDivider()

ExperiTab:CreateToggle({
	Name         = "Enable ESP",
	CurrentValue = false,
	Flag         = "ESP",
	Callback     = function(value)
		esp = value
	end,
})

ExperiTab:CreateToggle({
	Name         = "Box ESP",
	CurrentValue = false,
	Flag         = "BoxESP",
	Callback     = function(value)
		boxes = value
	end,
})

ExperiTab:CreateToggle({
	Name         = "Cham ESP",
	CurrentValue = false,
	Flag         = "ChamESP",
	Callback     = function(value)
		chams = value
	end,
})

ExperiTab:CreateToggle({
	Name         = "Tracer ESP",
	CurrentValue = false,
	Flag         = "TracerESP",
	Callback     = function(value)
		tracers = value
	end,
})

ExperiTab:CreateToggle({
	Name         = "Name ESP",
	CurrentValue = false,
	Flag         = "NameESP",
	Callback     = function(value)
		names = value
	end,
})

ExperiTab:CreateToggle({
	Name         = "Role ESP",
	CurrentValue = false,
	Flag         = "RoleESP",
	Callback     = function(value)
		roles = value
	end,
})

ExperiTab:CreateDropdown({
	Name           = "Tracer Origin",
	Options        = {"Bottom", "Middle", "Top", "Mouse"},
	CurrentOption  = {"Bottom"},
	MultipleOptions = false,
	Flag           = "TracerOrigin",
	Callback       = function(options)
		tracerorigin = options[1]
	end,
})

ExperiTab:CreateToggle({
	Name         = "Team Check",
	CurrentValue = true,
	Flag         = "ESPTeamCheck",
	Callback     = function(value)
		teamcheck = value
	end,
})

ExperiTab:CreateToggle({
	Name         = "Rainbow ESP",
	CurrentValue = false,
	Flag         = "RainbowESP",
	Callback     = function(value)
		rainbow_ = value
	end,
})

-- =====================
--   MISC
-- =====================

local fbcon  = false
local acccon = false

MiscTab:CreateToggle({
	Name         = "Fullbright",
	CurrentValue = false,
	Flag         = "Fullbright",
	Callback     = function(value)
		fbcon = value
	end,
})

MiscTab:CreateToggle({
	Name         = "Anti-Color Change",
	CurrentValue = false,
	Flag         = "AntiColorChange",
	Callback     = function(value)
		acccon = value
	end,
})

-- =====================
--   CONNECTIONS / LOGIC
-- (unchanged from original)
-- =====================

local connections = {}

local function connect(signal, callback)
	local connection = signal:Connect(callback)
	table.insert(connections, connection)
	return connection
end

local wst__; wst__ = connect(humanoid:GetPropertyChangedSignal("WalkSpeed"), function()
	if wscon then changeWs() end
end)

local jpt__; jpt__ = connect(humanoid:GetPropertyChangedSignal("JumpPower"), function()
	if jpcon then changeJp() end
end)

local fct__; fct__ = connect(humanoid.Climbing, function()
	if fclimbcon then humanoid.Jump = true end
end)

connect(you.CharacterAdded, function(_nchar)
	char     = _nchar
	humanoid = char:FindFirstChildOfClass("Humanoid")

	wst__ = connect(humanoid:GetPropertyChangedSignal("WalkSpeed"), function()
		if wscon then changeWs() end
	end)

	jpt__ = connect(humanoid:GetPropertyChangedSignal("JumpPower"), function()
		if jpcon then changeJp() end
	end)

	fct__ = connect(humanoid.Climbing, function()
		if fclimbcon then humanoid.Jump = true end
	end)
end)

connect(game:GetService("RunService").Stepped, function()
	-- Hitboxes
	if hbcon then
		for _, i in next, game.Players:GetPlayers() do
			if i ~= you and i.Character then
				local hum = i.Character:FindFirstChildOfClass("Humanoid")
				if hum then
					local root = hum.RootPart
					if root then
						root.Size        = Vector3.new(hbsize, hbsize, hbsize)
						root.Transparency = .5
					end
				end
			end
		end
	else
		for _, i in next, game.Players:GetPlayers() do
			if i ~= you and i.Character then
				local hum = i.Character:FindFirstChildOfClass("Humanoid")
				if hum then
					local root = hum.RootPart
					if root then
						root.Size        = Vector3.new(2, 2, 1)
						root.Transparency = 1
					end
				end
			end
		end
	end

	-- Noclip
	if noclipcon then
		for _, p in next, char:GetDescendants() do
			if p:IsA("BasePart") then
				p.CanCollide = false
			end
		end
	end

	-- Fullbright
	if fbcon then
		lighting.Brightness          = 2
		lighting.ClockTime           = 14
		lighting.FogEnd              = 100000
		lighting.GlobalShadows       = false
		lighting.OutdoorAmbient      = Color3.fromRGB(128, 128, 128)
		lighting.ExposureCompensation = 0
		for _, atmosphere in next, lighting:GetChildren() do
			if atmosphere:IsA("Atmosphere") then atmosphere:Destroy() end
		end
	end

	-- Anti-Color Change
	if acccon then
		for _, i in next, lighting:GetChildren() do
			if i:IsA("ColorCorrectionEffect") then
				if i.Name ~= "VHS" and i.Name ~= "Deepfry" then
					i:Destroy()
				end
			end
		end
	end

	-- Autocollect Coins
	if atcoin then
		if you.PlayerRole.Value ~= "Dead" then
			local root = humanoid.RootPart
			if root then
				local closestCoin = nil
				local closestDist = math.huge
				for _, v in pairs(workspace:GetDescendants()) do
					if v:IsA("MeshPart") and v.MeshId == "rbxassetid://8483581926" then
						local dist = (v.Position - root.Position).Magnitude
						if dist < closestDist then
							closestDist = dist
							closestCoin = v
						end
					end
				end
				if closestCoin and closestDist <= 15 then
					humanoid.RootPart.CFrame = closestCoin.CFrame
				end
			end
		end
	end

	-- Free Move
	if fmovecon then
		char.LockMoveVector.Value = false
	end
end)

connect(game:GetService("UserInputService").JumpRequest, function()
	if infj then
		humanoid.RootPart.Velocity = Vector3.new(
			humanoid.RootPart.Velocity.X,
			humanoid.JumpPower or humanoid.JumpHeight,
			humanoid.RootPart.Velocity.Z
		)
	end
end)

connect(game:GetService("RunService").Heartbeat, function()
	local youroot = humanoid.RootPart

	if atcon then
		for _, i in next, game.Players:GetPlayers() do
			if i ~= you and i.Character then
				if at_runnercheck then
					if you.PlayerRole.Value ~= "Runner" and you.PlayerRole.Value ~= "Dead" then
						if at_teamcheck then
							if i.PlayerRole.Value ~= you.PlayerRole.Value then
								local hum = i.Character:FindFirstChildOfClass("Humanoid")
								if hum then
									local root = hum.RootPart
									if root then
										local distance = (root.Position - youroot.Position).Magnitude
										if distance <= root.Size.Magnitude then mouse1click() end
									end
								end
							end
						else
							local hum = i.Character:FindFirstChildOfClass("Humanoid")
							if hum then
								local root = hum.RootPart
								if root then
									local distance = (root.Position - youroot.Position).Magnitude
									if distance <= root.Size.Magnitude then mouse1click() end
								end
							end
						end
					end
				else
					if at_teamcheck then
						if i.PlayerRole.Value ~= you.PlayerRole.Value then
							local hum = i.Character:FindFirstChildOfClass("Humanoid")
							if hum then
								local root = hum.RootPart
								if root then
									local distance = (root.Position - youroot.Position).Magnitude
									if distance <= root.Size.Magnitude then mouse1click() end
								end
							end
						end
					else
						local hum = i.Character:FindFirstChildOfClass("Humanoid")
						if hum then
							local root = hum.RootPart
							if root then
								local distance = (root.Position - youroot.Position).Magnitude
								if distance <= root.Size.Magnitude then mouse1click() end
							end
						end
					end
				end
			end
		end
	end
end)

-- =====================
--   ESP
-- =====================

local function addEsp(target)
	local function addBox()
		local box = Drawing.new("Square")
		box.Color       = Color3.new(1, 1, 1)
		box.Thickness   = 0.5
		box.Filled      = false
		box.Transparency = 1
		return box
	end

	local function addLine()
		local line = Drawing.new("Line")
		line.Color     = Color3.new(1, 1, 1)
		line.Thickness = 0.5
		return line
	end

	local function addText()
		local text = Drawing.new("Text")
		text.Color  = Color3.new(1, 1, 1)
		text.Size   = 11
		text.Center = true
		text.Font   = 3
		return text
	end

	local function addCham()
		local cham = Instance.new("BoxHandleAdornment", gethui() or game.CoreGui)
		cham.Color3      = Color3.new(1, 1, 1)
		cham.Transparency = .5
		cham.AlwaysOnTop = true
		cham.ZIndex      = 2
		return cham
	end

	local function alive(t) return t.PlayerRole.Value ~= "Dead" end
	local function isSameTeam(t) return t.PlayerRole.Value == you.PlayerRole.Value end

	local box    = addBox()
	local tracer = addLine()
	local name   = addText()
	local role   = addText()
	local text   = addText()
	local head   = addCham()
	local torso  = addCham()
	local larm   = addCham()
	local rarm   = addCham()
	local lleg   = addCham()
	local rleg   = addCham()

	local function hideAll()
		box.Visible    = false
		tracer.Visible = false
		name.Visible   = false
		role.Visible   = false
		text.Visible   = false
		head.Visible   = false
		torso.Visible  = false
		larm.Visible   = false
		rarm.Visible   = false
		lleg.Visible   = false
		rleg.Visible   = false
	end

	connect(game.Players.PlayerRemoving, function(player)
		if player == target then
			box:Destroy(); tracer:Destroy(); name:Destroy(); role:Destroy(); text:Destroy()
			head:Destroy(); torso:Destroy(); larm:Destroy(); rarm:Destroy(); lleg:Destroy(); rleg:Destroy()
		end
	end)

	connect(game:GetService("RunService").Stepped, function()
		if not esp then hideAll() return end

		if not (target.Character and alive(target)) then hideAll() return end

		local hum = target.Character:FindFirstChildOfClass("Humanoid")
		if not hum or not hum.RootPart then hideAll() return end

		local mainpos, vis = workspace.CurrentCamera:WorldToViewportPoint(hum.RootPart.Position)
		local headPart = target.Character:FindFirstChild("Head")
		if not headPart then return end

		local miscpos1 = workspace.CurrentCamera:WorldToViewportPoint(headPart.Position + Vector3.new(0, 0.5, 0))
		local miscpos2 = workspace.CurrentCamera:WorldToViewportPoint(hum.RootPart.Position - Vector3.new(0, 4, 0))

		if teamcheck and (isSameTeam(target) or target.PlayerRole.Value == "") then
			hideAll() return
		end

		-- Colors
		local col
		if rainbow_ then
			col = Color3.fromHSV(tick() % 5 / 5, 1, 1)
		else
			local torsopart = target.Character:FindFirstChild("Torso")
			col = torsopart and torsopart.Color or Color3.new(1, 1, 1)
		end

		box.Color    = col
		tracer.Color = col
		name.Color   = col
		role.Color   = col
		text.Color   = col
		for _, cham in next, {head, torso, larm, rarm, lleg, rleg} do
			cham.Color3 = col
		end

		-- Box
		if boxes then
			box.Visible  = vis
			box.Size     = Vector2.new((2350 / mainpos.Z) + 2.5, miscpos1.Y - miscpos2.Y)
			box.Position = Vector2.new((mainpos.X - box.Size.X / 2) - 1, mainpos.Y - box.Size.Y / 2)
		else
			box.Visible = false
		end

		-- Chams
		if chams then
			local parts = {
				{head,  "Head"},
				{torso, "Torso"},
				{larm,  "Left Arm"},
				{rarm,  "Right Arm"},
				{lleg,  "Left Leg"},
				{rleg,  "Right Leg"},
			}
			for _, pair in next, parts do
				local cham, partName = pair[1], pair[2]
				local part = target.Character:FindFirstChild(partName)
				cham.Visible = true
				cham.Adornee = part
				if part then cham.Size = part.Size end
			end
		else
			for _, cham in next, {head, torso, larm, rarm, lleg, rleg} do
				cham.Visible = false
			end
		end

		-- Tracers
		if tracers then
			tracer.Visible = vis
			local from = Vector2.new(mainpos.X - 1, mainpos.Y + (miscpos1.Y - miscpos2.Y) / 2)
			local fromMid = Vector2.new(mainpos.X - 1, (mainpos.Y + (miscpos1.Y - miscpos2.Y) / 2) - ((miscpos1.Y - miscpos2.Y) / 2))
			local vp = workspace.CurrentCamera.ViewportSize
			if tracerorigin == "Top" then
				tracer.From = from
				tracer.To   = Vector2.new(vp.X / 2, 0)
			elseif tracerorigin == "Middle" then
				tracer.From = fromMid
				tracer.To   = vp / 2
			elseif tracerorigin == "Bottom" then
				tracer.From = from
				tracer.To   = Vector2.new(vp.X / 2, 1000)
			elseif tracerorigin == "Mouse" then
				tracer.From = fromMid
				tracer.To   = game:GetService("UserInputService"):GetMouseLocation()
			end
		else
			tracer.Visible = false
		end

		-- Names / Roles
		local hpos = workspace.CurrentCamera:WorldToViewportPoint(headPart.Position)
		local labelPos = Vector2.new(hpos.X, hpos.Y - 20)

		if names and roles then
			name.Visible = false
			role.Visible = false
			text.Visible = vis
			text.Position = labelPos
			text.Text = target.Name .. " | " .. target.PlayerRole.Value
		else
			text.Visible = false
			if names then
				name.Visible  = vis
				name.Position = labelPos
				name.Text     = target.Name
			else
				name.Visible = false
			end
			if roles then
				role.Visible  = vis
				role.Position = labelPos
				role.Text     = target.PlayerRole.Value
			else
				role.Visible = false
			end
		end
	end)
end

for _, i in next, game.Players:GetPlayers() do
	if i ~= you then addEsp(i) end
end

connect(game.Players.PlayerAdded, function(i)
	if i ~= you then addEsp(i) end
end)

Rayfield:LoadConfiguration()

--[[
	~ UPDATE LOGS: ~
	* 11/5/22  - First version of UTG script created (the usual stuff...)
	* 11/13/22 - Created coin autocollect module for script
	* 11/14/22 - Second version released (removed the useless authentication system; fixed bugs; added new features)
	* 12/29/22 - 2.5 version released
	* 2/14/23  - closed script... (update for v3 soon.)
	* 2/22/23  - Third version released (revamped features; new ui library [orion]; added esp [experimental])
	* 2/23/23  - [Third version was broken lol] v3.1 (bug fixes)
	* 2/24/23  - Visual updates/fixes; movement fixes; free-move
	* 3/9/23   - Visual fixes; coin-collect alive check policy; replaced anti-highcontrast w/ anti-colorchange [vhs and deepfry not included]
	* Fixed    - Nil character checks added throughout (hitboxes, autotag, ESP)
	* UI Rewrite - Migrated from Orion to Rayfield (docs.sirius.menu/rayfield)
]]
