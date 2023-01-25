local lib = {}
local list = {}

function lib:Draw(Parent, config)

	local ESP = Instance.new("Folder")
	ESP.Name = "ESP"

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

	Object.Adornee = nil
	Object.Parent = ESP

	local border = Instance.new("Frame")
	border.Name = "border"

	border.Size = UDim2.fromScale(0.95, 0.95)
	border.AnchorPoint = Vector2.new(0.5, 0.5)
	border.Position = UDim2.fromScale(0.5, 0.5)

	border.Visible = true
	border.Transparency = 1
	border.ZIndex = 1

	border.ClipsDescendants = false
	border.Parent = Object

	local UIStroke = Instance.new("UIStroke")
	
	UIStroke.Thickness = 4
	UIStroke.Parent = border
	UIStroke.Color = config.Color

	list[Parent.Name] = {
		["ESP"] = ESP,
		["Objects"] = {
			["border"] = Object
		}
	}

	list[Parent.Name].ESP.Parent = Parent
	list[Parent.Name].Objects.border.Parent = ESP

	list[Parent.Name].Objects.border.Adornee = Parent:FindFirstChild("HumanoidRootPart")

end

function lib:Delete(object)
	if typeof(object) ~= "Instance" and type(object) == "string" then
		workspace:FindFirstChild(object, true):FindFirstChild("ESP"):Remove()
	elseif typeof(object) == "Instance" then
		object:FindFirstChild("ESP"):Remove()
	end
end

function lib:SetDistance(object, newDistance)
	list[object].Objects.__object.MaxDistance = newDistance
end

return lib
