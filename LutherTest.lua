local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({

    Title = "Luther's Playground",

    Icon = "door-open",
    Author = "by Luther",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true, -- <- or false
        Callback = function() print("clicked") end, -- <- optional
        Anonymous = false -- <- or true
    },
    SideBarWidth = 200,
    HasOutline = true,
    KeySystem = { -- <- keysystem enabled
        Key = { "1234", "5678" },
        Note = "Example Key System. \n\nThe Key is '1234' or '5678",
        URL = "https://github.com/Footagesus/WindUI", -- remove this if the key is not obtained from the link.
        SaveKey = true, -- optional
    },
})

--Function Info
local Info = Window:Tab({Title = "Information", Icon = "info" })

local InviteCode = "XErAwERk"
local DiscordAPI = "https://discord.com/api/v10/invites/" .. InviteCode .. "?with_counts=true&with_expiration=true"

local Response
local ErrorMessage = nil

xpcall(function()
    Response = game:GetService("HttpService"):JSONDecode(WindUI.Creator.Request({
        Url = DiscordAPI,
        Method = "GET",
        Headers = {
            ["Accept"] = "application/json"
        }
    }).Body)
end, function(err)
    warn("err fetching discord info: " .. tostring(err))
    ErrorMessage = tostring(err)
    Response = nil
end)

if Response and Response.guild then
    local ParagraphConfig = {
        Title = Response.guild.name,
        Desc =
            ' <font color="#52525b">•</font> Member Count: ' .. tostring(Response.approximate_member_count) ..
            '\n <font color="#16a34a">•</font> Online Count: ' .. tostring(Response.approximate_presence_count)
        ,
        Image = "https://cdn.discordapp.com/icons/" .. Response.guild.id .. "/" .. Response.guild.icon .. ".png?size=256",
        ImageSize = 42,
        Buttons = {
            {
                Icon = "link",
                Title = "Copy Discord Invite",
                Callback = function()
                    pcall(function()
                        setclipboard("https://discord.gg/" .. InviteCode)
                    end)
                end
            },
            {
                Icon = "refresh-cw",
                Title = "Update Info",
                Callback = function()
                    xpcall(function()
                        local UpdatedResponse = game:GetService("HttpService"):JSONDecode(WindUI.Creator.Request({
                            Url = DiscordAPI,
                            Method = "GET",
                        }).Body)
                        
                        if UpdatedResponse and UpdatedResponse.guild then
                            DiscordInfo:SetDesc(
                                ' <font color="#52525b">•</font> Member Count: ' .. tostring(UpdatedResponse.approximate_member_count) ..
                                '\n <font color="#16a34a">•</font> Online Count: ' .. tostring(UpdatedResponse.approximate_presence_count)
                            )
                        end
                    end, function(err)
                        warn("err updating discord info: " .. tostring(err))
                    end)
                end
            }
        }
    }
    
    if Response.guild.banner then
        ParagraphConfig.Thumbnail = "https://cdn.discordapp.com/banners/" .. Response.guild.id .. "/" .. Response.guild.banner .. ".png?size=256"
        ParagraphConfig.ThumbnailSize = 80
    end
    
    local DiscordInfo = Info:Paragraph(ParagraphConfig)
else
    Info:Paragraph({
        Title = "Error when receiving information about the Discord server",
        Desc = ErrorMessage or "Unknown error occurred",
        Image = "triangle-alert",
        ImageSize = 26,
        Color = "Red",
    })
end

--Function Tab
local Tabs = {
    Main = Window:Tab({ Title = "Main", Icon = "toggle-left", Desc = "Switch settings on and off." }),
    Auto = Window:Tab({ Title = "Automation", Icon = "shopping-cart" }),
    Shops = Window:Tab({ Title = "Shop", Icon = "door-open" }),
    Misc = Window:Tab({ Title = "Misc", Icon = "folder" }),
}

--Function Main
Tabs.Main:Section({ Title = "Fishing" })

Tabs.Main:Toggle({
    Title = "Auto Fish",
    Value = false,
    Callback = function(state) print("Auto Fish: " .. tostring(state)) end
})

Tabs.Main:Toggle({
    Title = "Auto Equip Rod",
    Value = false,
    Callback = function(state) print("Auto Equip Rod:" .. tostring(state)) end
})

Tabs.Main:Toggle({
    Title = "Auto Perfect",
    Value = false,
    Callback = function(state) print("Auto Perfect:" .. tostring(state)) end
})

Tabs.Main:Dropdown({
    Title = "Fishing Mode",
    Values = { "Legit", "Blatant", "Super Blatant" },
    Value = "Legit",
    Callback = function(option) print("Selected: " .. option) end
})

Tabs.Main.Section({ Title = "Fishing Spot" })

Tabs.Main:Dropdown({
    Title = "Select Spot",
    Values = { "Fisherman Island", "Ocean", "Weather Machine", "Kohana Volcano","Kohana", "Crater Island", "Coral Reefs", "Esoteric Depths", "Snow Island", "Sacred Temple", "Sishypus Statue", "Lost Isle", "Ancient Temple", },
    Value = "Fisherman Island",
    Callback = function(open) print("Selected: " .. option) end
})

Tabs.Main:Button({
    Title = "Teleport To Selected",
    Desc = "Teleport",
    Callback
     = function() print("Button Clicked") end
})

--Main Tab



--Shop Tab

