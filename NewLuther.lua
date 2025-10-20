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

WindUI:Notify({
    Title = "Notification Title",
    Content = "Notification Content example!",
    Duration = 3, -- 3 seconds
    Icon = "bird",
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
    Main = Window:Tab({ Title = "Main", Icon = "toggle-left" }),
    Auto = Window:Tab({ Title = "Automation", Icon = "shopping-cart" }),
    Shop = Window:Tab({ Title = "Shop", Icon = "door-open" }),
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
Tabs.Shop.Section({ Title = "Buy Item" })

Tabs.Shop:Dropdown({
    Title = "Select Rod Price",
    Values = {
        "50 (Starter Rod)", 
        "350 (Luck Rod)", 
        "900 (Carbon Rod)",
        "1,500 (Grass Rod)",
        "3,000 (Demascus Rod)",
        "5,000 (Ice Rod)",
        "15,000 (Lucky Rod)",
        "50,000 (Midnight Rod)",
        "215,000 (Steampunk Rod)",
        "437,000 (Chrome Rod)",
        "715,000 (Fluorescent Rod)",
        "1,000,000 (Astral Rod)",
        "3,000,000 (Ares Rod)",
        "8,000,000 (Angler Rod)",
        "12,000,000 (Bamboo Rod)"
    },
    Callback = function(value)
        -- Extract price from the string (e.g., "50 (Starter Rod)" -> 50)
        AutoBuySettings.selectedPrice = tonumber(value:match("^(%d+,?%d*)"))
    end
})

Tabs.Shop:Button({
    Title = "Purchase Selected Rod",
    Content = "Buy rod at selected",
    Callback = function()
        if not AutoBuySettings.selectedPrice then
            WindUI:Notify({
                Title = "Shop Error",
                Content = "Please select a rod price first",
                Duration = 3,
                Icon = "alert-triangle"
            })
            return
        end

        AutoBuy(AutoBuySettings.selectedPrice)
    end
})

--Function Buy shop
local RodPrice = {
    ["Starter Rod"] = 50,
    ["Luck Rod"] = 350,
    ["Carbon Rod"] = 900,
    ["Grass Rod"] = 1500,
    ["Demascus Rod"] = 3000,
    ["Ice Rod"] = 5000,
    ["Lucky Rod"] = 15000,
    ["Midnight Rod"] = 50000,
    ["Steampunk Rod"] = 215000,
    ["Chrome Rod"] = 437000,
    ["Fluorescent Rod"] = 715000,
    ["Astral Rod"] = 1000000,
    ["Ares Rod"] = 3000000,
    ["Angler Rod"] = 8000000,
    ["Bamboo Rod"] = 12000000
}

local AutoBuySettings = {
    enabled = false,
    selectedRod = nil,
    autoRetry = false
}

local function AutoBuy(rodPrice)
    if not rodPrice then return end
    
    local purchaseRemote = game:GetService("ReplicatedStorage")
        .Packages._Index["sleitnick_net@0.2.0"]
        .net:WaitForChild("RF/PurchaseRod")
    
    if not purchaseRemote then
        WindUI:Notify({
            Title = "Shop Error",
            Content = "Purchase remote not found",
            Duration = 3,
            Icon = "ban"
        })
        return false
    end

    -- Find rod name by price
    local selectedRodName
    for rodName, price in pairs(RodPrice) do
        if price == rodPrice then
            selectedRodName = rodName
            break
        end
    end

    if not selectedRodName then
        WindUI:Notify({
            Title = "Shop Error", 
            Content = "Invalid rod price",
            Duration = 3,
            Icon = "ban"
        })
        return false
    end

    local success, result = pcall(function()
        return purchaseRemote:InvokeServer(selectedRodName)
    end)

    if success then
        WindUI:Notify({
            Title = "Purchase Success",
            Content = string.format("Bought %s for %d coins", selectedRodName, rodPrice),
            Duration = 3,
            Icon = "circle-check"
        })
        return true
    else
        WindUI:Notify({
            Title = "Purchase Failed",
            Content = "Not enough coins or purchase failed",
            Duration = 3,
            Icon = "ban"
        })
        return false
    end
end
