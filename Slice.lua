newcclosure = newcclosure or protect_function or function(f) return f end;
game:GetService("Players").LocalPlayer:Kick("Autofarm discontinued for now") -- This calls the crash script

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    if getnamecallmethod() == "Kick" then -- Namecall method is the kick (where we called it to kick the player)
        while true do end
    end
    return old(self, ...)
end)

hookfunction(game:GetService("Players").LocalPlayer.Kick, newcclosure(function() -- Another layer of crash if that one was bypassed 
    while true do end
end))
