newcclosure = newcclosure or protect_function or function(f) return f end;
game:GetService("Players").LocalPlayer:Kick("Autofarm discontinued for now")

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    if getnamecallmethod() == "Kick" then
        while true do end
    end
    return old(self, ...)
end)

hookfunction(game:GetService("Players").LocalPlayer.Kick, newcclosure(function() 
    while true do end
end))
