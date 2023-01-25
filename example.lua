-- Library
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImACitrus/ESP/main/box.lua"))()

-- Set esp (makes a border around Dummy - Model)
ESP:Draw(workspace.Dummy, {
  Color = Color3.fromRGB(255, 0, 0)
})

-- Sets range (display distance)
ESP:SetDistance("Dummy", 5000)

-- Removes esp (border)
ESP:Delete("Dummy")
