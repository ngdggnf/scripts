local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if (method:lower() == "gethttpresulthistory" and self == game:GetService("LogService")) and checkcaller() then
        return {}
    end
    if (method:lower() == "getoutputdevices" and self == game:GetService("SoundService")) and checkcaller() then
        return {}
    end
    if (method:lower() == "getcameradevices" and self == game:GetService("VideoCaptureService")) and checkcaller() then
        return {}
    end
    if (method:lower() == "getclientid" and self == game:GetService("RbxAnalyticsService")) and checkcaller() then
        return game:GetService("HttpService"):GenerateGUID(false):upper()
    end
    if (method:lower() == "getuseragent" and self == game:GetService("HttpService")) and checkcaller() then
        return ""
    end
    if (method:lower() == "togglefullscreen" and self == game:GetService("GuiService")) and checkcaller() then
        return nil
    end
    return old(self, unpack(args))
end)
local pressed = {}
local old
old = hookfunction(keypress, newcclosure(function(...)
    local key = ...
    table.insert(pressed, key)
    if table.find(pressed, 0x11) and table.find(pressed, 0x12) and table.find(pressed, 0x2E) then
        keyrelease(0x11); keyrelease(0x12); keyrelease(0x2E)
        local wanted = {0x11, 0x12, 0x2E}
        for i,v in pairs(pressed) do
            if table.find(wanted, v) then table.remove(pressed, i) end
        end
    end
    return old(...)
end))
warn("AntiSpy Loaded")
