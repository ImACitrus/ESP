local lib = {}
lib.__index = lib

function lib:Draw(Parent, config)
	local self = setmetatable({}, lib)

	local ESP = Instance.new("Folder")
	ESP.Name = "ESP"
	ESP.Parent = nil

	local Name = Instance.new("BillboardGui")
	Name.Name = "Name"
	Name.Size = UDim2.fromScale(0.5, 1)
	Name.SizeOffset = Vector2.new(0, 4.5)

	Name.MaxDistance = 45
	Name.LightInfluence = 1

	Name.Archivable = true
	Name.Active = true
	Name.Enabled = true
	Name.AlwaysOnTop = true
	Name.ClipsDescendants = false
	Name.ResetOnSpawn = true
	Name.AutoLocalize = true

	local Object = Instance.new("BillboardGui")
	Object.Size = UDim2.fromScale(5, 6.5)
	Object.SizeOffset = Vector2.new(0, 0)

	Object.MaxDistance = 1500
	Object.LightInfluence = 1

	Object.Archivable = true
	Object.Active = true
	Object.Enabled = true
	Object.AlwaysOnTop = true
	Object.ClipsDescendants = false
	Object.ResetOnSpawn = true
	Object.AutoLocalize = true

	Name.Adornee = nil
	Object.Adornee = nil

	Name.Parent = ESP
	Object.Parent = ESP

	local value = Instance.new("TextLabel")
	value.Name = "value"
	value.FontFace = Font.fromEnum(Enum.Font.SourceSansSemibold)

	value.Size = UDim2.fromScale(1, 0.7)
	value.AnchorPoint = Vector2.new(0.5, 0.5)
	value.Position = UDim2.fromScale(0.5, 0.5)

	value.Visible = true
	value.Transparency = 1
	value.ZIndex = 1

	value.TextScaled = true
	value.ClipsDescendants = false

	local border = Instance.new("Frame")
	border.Name = "border"

	border.Size = UDim2.fromScale(0.95, 0.95)
	border.AnchorPoint = Vector2.new(0.5, 0.5)
	border.Position = UDim2.fromScale(0.5, 0.5)

	border.Visible = true
	border.Transparency = 1
	border.ZIndex = 1

	border.ClipsDescendants = false

	value.Parent = Name
	border.Parent = Object

	local UIScale = Instance.new("UIScale")
	UIScale.Scale = 3

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = 4

	UIScale.Parent = value
	UIStroke.Parent = border

	self.ESP = ESP

	self.name = self.ESP:WaitForChild("Name")
	self.object = self.ESP:WaitForChild("Object")

	self.name:WaitForChild("value")
	self.object:WaitForChild("border")

	self.name.Adornee = Parent
	self.object.Adornee = Parent

	self.ESP.Parent = Parent
	return self
end

function lib:Delete()
	self.ESP:Remove()
end

function lib:SetDistance(newDistance)
	self.object.MaxDistance = newDistance
end

function lib:DeleteAfter(seconds, callback)
	task.delay(seconds, function()
		self:Delete()
		callback()
	end)
end

function lib:Containing(name, delete)
	if string.lower(self.name.value.Text) == string.lower(name) then
		if delete then self:Delete() else
			return true
		end
	end
	return false
end

return lib
