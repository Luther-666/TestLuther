local v0 = {
    Players = game:GetService("Players"), 
    RunService = game:GetService("RunService"), 
    HttpService = game:GetService("HttpService"), 
    RS = game:GetService("ReplicatedStorage"), 
    VIM = game:GetService("VirtualInputManager"), 
    PG = game:GetService("Players").LocalPlayer.PlayerGui, 
    Camera = workspace.CurrentCamera, 
    GuiService = game:GetService("GuiService"), 
    CoreGui = game:GetService("CoreGui")
};
_G.httpRequest = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request;
if not _G.httpRequest then
    return;
else
    local l_LocalPlayer_0 = v0.Players.LocalPlayer;
    local v2 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:WaitForChild("HumanoidRootPart") or l_LocalPlayer_0.CharacterAdded:Wait():WaitForChild("HumanoidRootPart");
    local v3 = "Chloe X/FishIt" .. "/Position.json";
    local v4 = {
        MerchantRoot = v0.PG.Merchant.Main.Background, 
        ItemsFrame = v0.PG.Merchant.Main.Background.Items.ScrollingFrame, 
        RefreshMerchant = v0.PG.Merchant.Main.Background.RefreshLabel
    };
    local v5 = {
        Net = v0.RS.Packages._Index["sleitnick_net@0.2.0"].net, 
        Replion = require(v0.RS.Packages.Replion), 
        FishingController = require(v0.RS.Controllers.FishingController), 
        TradingController = require(v0.RS.Controllers.ItemTradingController), 
        ItemUtility = require(v0.RS.Shared.ItemUtility), 
        VendorUtility = require(v0.RS.Shared.VendorUtility), 
        PlayerStatsUtility = require(v0.RS.Shared.PlayerStatsUtility)
    };
    local v6 = {
        Events = {
            RECutscene = v5.Net["RE/ReplicateCutscene"], 
            REStop = v5.Net["RE/StopCutscene"], 
            REFav = v5.Net["RE/FavoriteItem"], 
            REFavChg = v5.Net["RE/FavoriteStateChanged"], 
            REFishDone = v5.Net["RE/FishingCompleted"], 
            REFishGot = v5.Net["RE/FishCaught"], 
            RENotify = v5.Net["RE/TextNotification"], 
            REEquip = v5.Net["RE/EquipToolFromHotbar"], 
            REEquipItem = v5.Net["RE/EquipItem"], 
            REAltar = v5.Net["RE/ActivateEnchantingAltar"], 
            REAltar2 = v5.Net["RE/ActivateSecondEnchantingAltar"], 
            UpdateOxygen = v5.Net["URE/UpdateOxygen"], 
            REPlayFishEffect = v5.Net["RE/PlayFishingEffect"], 
            RETextEffect = v5.Net["RE/ReplicateTextEffect"], 
            REEvReward = v5.Net["RE/ClaimEventReward"], 
            Totem = v5.Net["RE/SpawnTotem"], 
            REObtainedNewFishNotification = v5.Net["RE/ObtainedNewFishNotification"]
        }, 
        Functions = {
            Trade = v5.Net["RF/InitiateTrade"], 
            BuyRod = v5.Net["RF/PurchaseFishingRod"], 
            BuyBait = v5.Net["RF/PurchaseBait"], 
            BuyWeather = v5.Net["RF/PurchaseWeatherEvent"], 
            ChargeRod = v5.Net["RF/ChargeFishingRod"], 
            StartMini = v5.Net["RF/RequestFishingMinigameStarted"], 
            UpdateRadar = v5.Net["RF/UpdateFishingRadar"], 
            Cancel = v5.Net["RF/CancelFishingInputs"], 
            Dialogue = v5.Net["RF/SpecialDialogueEvent"]
        }
    };
    local v7 = {
        Data = v5.Replion.Client:WaitReplion("Data"), 
        Items = v0.RS:WaitForChild("Items"), 
        PlayerStat = require(v0.RS.Packages._Index:FindFirstChild("ytrev_replion@2.0.0-rc.3").replion)
    };
    local v8 = {
        autoInstant = false, 
        selectedEvents = {}, 
        autoWeather = false, 
        autoSellEnabled = false, 
        autoFavEnabled = false, 
        autoEventActive = false, 
        canFish = true, 
        savedCFrame = nil, 
        sellMode = "Delay", 
        sellDelay = 60, 
        inputSellCount = 50, 
        selectedName = {}, 
        selectedRarity = {}, 
        selectedVariant = {}, 
        rodDataList = {}, 
        rodDisplayNames = {}, 
        baitDataList = {}, 
        baitDisplayNames = {}, 
        selectedRodId = nil, 
        selectedBaitId = nil, 
        rods = {}, 
        baits = {}, 
        weathers = {}, 
        lcc = 0, 
        player = l_LocalPlayer_0, 
        stats = l_LocalPlayer_0:WaitForChild("leaderstats"), 
        caught = l_LocalPlayer_0:WaitForChild("leaderstats"):WaitForChild("Caught"), 
        char = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait(), 
        vim = v0.VIM, 
        cam = v0.Camera, 
        offs = {
            ["Worm Hunt"] = 25
        }, 
        curCF = nil, 
        origCF = nil, 
        flt = false, 
        con = nil, 
        Instant = false, 
        CancelWaitTime = 3, 
        ResetTimer = 0.5, 
        hasTriggeredBug = false, 
        lastFishTime = 0, 
        fishConnected = false, 
        lastCancelTime = 0, 
        hasFishingEffect = false, 
        trade = {
            selectedPlayer = nil, 
            selectedItem = nil, 
            tradeAmount = 1, 
            targetCoins = 0, 
            trading = false, 
            awaiting = false, 
            lastResult = nil, 
            successCount = 0, 
            failCount = 0, 
            totalToTrade = 0, 
            sentCoins = 0, 
            successCoins = 0, 
            failCoins = 0, 
            totalReceived = 0, 
            currentGrouped = {}, 
            TotemActive = false
        }, 
        ignore = {
            Cloudy = true, 
            Day = true, 
            ["Increased Luck"] = true, 
            Mutated = true, 
            Night = true, 
            Snow = true, 
            ["Sparkling Cove"] = true, 
            Storm = true, 
            Wind = true, 
            UIListLayout = true, 
            ["Admin - Shocked"] = true, 
            ["Admin - Super Mutated"] = true, 
            Radiant = true
        }, 
        notifConnections = {}, 
        defaultHandlers = {}, 
        disabledCons = {}, 
        CEvent = true
    };
    _G.Celestial = _G.Celestial or {};
    _G.Celestial.DetectorCount = _G.Celestial.DetectorCount or 0;
    _G.Celestial.InstantCount = _G.Celestial.InstantCount or 0;
    getFishCount = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref)
        local l_BagSize_0 = v8.player.PlayerGui:WaitForChild("Inventory"):WaitForChild("Main"):WaitForChild("Top"):WaitForChild("Options"):WaitForChild("Fish"):WaitForChild("Label"):WaitForChild("BagSize");
        return tonumber((l_BagSize_0.Text or "0/???"):match("(%d+)/")) or 0;
    end;
    clickCenter = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref)
        local l_ViewportSize_0 = v8.cam.ViewportSize;
        v8.vim:SendMouseButtonEvent(l_ViewportSize_0.X / 2, l_ViewportSize_0.Y / 2, 0, true, nil, 0);
        v8.vim:SendMouseButtonEvent(l_ViewportSize_0.X / 2, l_ViewportSize_0.Y / 2, 0, false, nil, 0);
    end;
    local v11 = {};
    for _, v13 in ipairs(v7.Items:GetChildren()) do
        if v13:IsA("ModuleScript") then
            local l_status_0, l_result_0 = pcall(require, v13);
            if l_status_0 and l_result_0.Data and l_result_0.Data.Type == "Fishes" then
                table.insert(v11, l_result_0.Data.Name);
            end;
        end;
    end;
    table.sort(v11);
    _G.TierFish = {
        [1] = "Uncommon", 
        [2] = "Common", 
        [3] = "Rare", 
        [4] = "Epic", 
        [5] = "Legendary", 
        [6] = "Mythic", 
        [7] = "Secret"
    };
    _G.Variant = {
        "Galaxy", 
        "Corrupt", 
        "Gemstone", 
        "Ghost", 
        "Lightning", 
        "Fairy Dust", 
        "Gold", 
        "Midnight", 
        "Radioactive", 
        "Stone", 
        "Holographic", 
        "Albino"
    };
    toSet = function(v16) --[[ Line: 0 ]] --[[ Name:  ]]
        local v17 = {};
        if type(v16) == "table" then
            for _, v19 in ipairs(v16) do
                v17[v19] = true;
            end;
            for v20, v21 in pairs(v16) do
                if v21 then
                    v17[v20] = true;
                end;
            end;
        end;
        return v17;
    end;
    local v22 = {};
    v6.Events.REFavChg.OnClientEvent:Connect(function(v23, v24) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v22 (ref)
        rawset(v22, v23, v24);
    end);
    checkAndFavorite = function(v25) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v5 (ref), v22 (ref), v6 (ref)
        if not v8.autoFavEnabled then
            return;
        else
            local v26 = v5.ItemUtility.GetItemDataFromItemType("Items", v25.Id);
            if not v26 or v26.Data.Type ~= "Fishes" then
                return;
            else
                local v27 = _G.TierFish[v26.Data.Tier];
                local l_Name_0 = v26.Data.Name;
                local v29 = v25.Metadata and v25.Metadata.VariantId or "None";
                local v30 = v8.selectedName[l_Name_0];
                local v31 = v8.selectedRarity[v27];
                local v32 = v8.selectedVariant[v29];
                local v33 = rawget(v22, v25.UUID);
                if v33 == nil then
                    v33 = v25.Favorited;
                end;
                local v34 = false;
                if next(v8.selectedVariant) ~= nil and next(v8.selectedName) ~= nil then
                    v34 = v30 and v32;
                else
                    v34 = v30 or v31;
                end;
                if v34 and not v33 then
                    v6.Events.REFav:FireServer(v25.UUID);
                    rawset(v22, v25.UUID, true);
                end;
                return;
            end;
        end;
    end;
    scanInventory = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v7 (ref)
        if not v8.autoFavEnabled then
            return;
        else
            for _, v36 in ipairs(v7.Data:GetExpect({
                "Inventory", 
                "Items"
            })) do
                checkAndFavorite(v36);
            end;
            return;
        end;
    end;
    for _, v38 in ipairs(v0.RS.Items:GetChildren()) do
        if v38:IsA("ModuleScript") and v38.Name:match("Rod") then
            local l_status_1, l_result_1 = pcall(require, v38);
            if l_status_1 and typeof(l_result_1) == "table" and l_result_1.Data then
                local v41 = l_result_1.Data.Name or "Unknown";
                local v42 = l_result_1.Data.Id or "Unknown";
                local v43 = l_result_1.Price or 0;
                local v44 = v41:gsub("^!!!%s*", "");
                local v45 = v44 .. " ($" .. v43 .. ")";
                local v46 = {
                    Name = v44, 
                    Id = v42, 
                    Price = v43, 
                    Display = v45
                };
                v8.rods[v42] = v46;
                v8.rods[v44] = v46;
                table.insert(v8.rodDisplayNames, v45);
            end;
        end;
    end;
    BaitsFolder = v0.RS:WaitForChild("Baits");
    for _, v48 in ipairs(BaitsFolder:GetChildren()) do
        if v48:IsA("ModuleScript") then
            local l_status_2, l_result_2 = pcall(require, v48);
            if l_status_2 and typeof(l_result_2) == "table" and l_result_2.Data then
                local v51 = l_result_2.Data.Name or "Unknown";
                local v52 = l_result_2.Data.Id or "Unknown";
                local v53 = l_result_2.Price or 0;
                local v54 = v51 .. " ($" .. v53 .. ")";
                local v55 = {
                    Name = v51, 
                    Id = v52, 
                    Price = v53, 
                    Display = v54
                };
                v8.baits[v52] = v55;
                v8.baits[v51] = v55;
                table.insert(v8.baitDisplayNames, v54);
            end;
        end;
    end;
    _cleanName = function(v56) --[[ Line: 0 ]] --[[ Name:  ]]
        if type(v56) ~= "string" then
            return tostring(v56);
        else
            return v56:match("^(.-) %(") or v56;
        end;
    end;
    SavePosition = function(v57) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v3 (ref), v0 (ref)
        local v58 = {
            v57:GetComponents()
        };
        writefile(v3, v0.HttpService:JSONEncode(v58));
    end;
    LoadPosition = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v3 (ref), v0 (ref)
        if isfile(v3) then
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v0 (ref), v3 (ref)
                return v0.HttpService:JSONDecode(readfile(v3));
            end);
            if l_status_3 and typeof(l_result_3) == "table" then
                return CFrame.new(unpack(l_result_3));
            end;
        end;
        return nil;
    end;
    TeleportLastPos = function(v61) --[[ Line: 0 ]] --[[ Name:  ]]
        task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v61 (ref)
            local l_HumanoidRootPart_0 = v61:WaitForChild("HumanoidRootPart");
            local v63 = LoadPosition();
            if v63 then
                task.wait(2);
                l_HumanoidRootPart_0.CFrame = v63;
                chloex("Teleported to your last position...");
            end;
        end);
    end;
    l_LocalPlayer_0.CharacterAdded:Connect(TeleportLastPos);
    if l_LocalPlayer_0.Character then
        TeleportLastPos(l_LocalPlayer_0.Character);
    end;
    ignore = {
        Cloudy = true, 
        Day = true, 
        ["Increased Luck"] = true, 
        Mutated = true, 
        Night = true, 
        Snow = true, 
        ["Sparkling Cove"] = true, 
        Storm = true, 
        Wind = true, 
        UIListLayout = true, 
        ["Admin - Shocked"] = true, 
        ["Admin - Super Mutated"] = true, 
        Radiant = true
    };
    local function v65(v64) --[[ Line: 0 ]] --[[ Name:  ]]
        return v64 and (v64:FindFirstChild("HumanoidRootPart") or v64:FindFirstChildWhichIsA("BasePart"));
    end;
    local function v76(v66, v67, v68) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v0 (ref)
        if v8.flt and v8.con then
            v8.con:Disconnect();
        end;
        v8.flt = v68 or false;
        if v68 then
            local v69 = v66:FindFirstChild("FloatPart") or Instance.new("Part");
            local v70 = "FloatPart";
            local v71 = Vector3.new(3, 0.2, 3);
            local v72 = 1;
            local v73 = true;
            v69.CanCollide = true;
            v69.Anchored = v73;
            v69.Transparency = v72;
            v69.Size = v71;
            v69.Name = v70;
            v69.Parent = v66;
            do
                local l_v69_0 = v69;
                v8.con = v0.RunService.Heartbeat:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v66 (ref), v67 (ref), l_v69_0 (ref)
                    if v66 and v67 and l_v69_0 then
                        l_v69_0.CFrame = v67.CFrame * CFrame.new(0, -3.1, 0);
                    end;
                end);
            end;
        else
            local v75 = v66 and v66:FindFirstChild("FloatPart");
            if v75 then
                v75:Destroy();
            end;
        end;
    end;
    local function v82() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref)
        local v77 = {};
        local l_Events_0 = v8.player:WaitForChild("PlayerGui"):FindFirstChild("Events");
        if l_Events_0 then
            l_Events_0 = l_Events_0:FindFirstChild("Frame") and l_Events_0.Frame:FindFirstChild("Events");
        end;
        if l_Events_0 then
            for _, v80 in ipairs(l_Events_0.GetChildren(l_Events_0)) do
                local v81 = v80:IsA("Frame") and v80:FindFirstChild("DisplayName") and v80.DisplayName.Text or v80.Name;
                if typeof(v81) == "string" and v81 ~= "" and not v8.ignore[v81] then
                    table.insert(v77, (v81:gsub("^Admin %- ", "")));
                end;
            end;
        end;
        return v77;
    end;
    local function v101(v83) --[[ Line: 0 ]] --[[ Name:  ]]
        if not v83 then
            return;
        elseif v83 == "Megalodon Hunt" then
            local l_workspace_FirstChild_0 = workspace:FindFirstChild("!!! MENU RINGS");
            if l_workspace_FirstChild_0 then
                for _, v86 in ipairs(l_workspace_FirstChild_0:GetChildren()) do
                    local l_v86_FirstChild_0 = v86:FindFirstChild("Megalodon Hunt");
                    local v88 = l_v86_FirstChild_0 and l_v86_FirstChild_0:FindFirstChild("Megalodon Hunt");
                    if v88 and v88:IsA("BasePart") then
                        return v88;
                    end;
                end;
            end;
            return;
        else
            local v89 = {
                workspace:FindFirstChild("Props")
            };
            local l_workspace_FirstChild_1 = workspace:FindFirstChild("!!! MENU RINGS");
            if l_workspace_FirstChild_1 then
                for _, v92 in ipairs(l_workspace_FirstChild_1:GetChildren()) do
                    if v92.Name:match("^Props") then
                        table.insert(v89, v92);
                    end;
                end;
            end;
            for _, v94 in ipairs(v89) do
                for _, v96 in ipairs(v94:GetChildren()) do
                    for _, v98 in ipairs(v96:GetDescendants()) do
                        if v98:IsA("TextLabel") and v98.Name == "DisplayName" and (v98.ContentText ~= "" and v98.ContentText or v98.Text):lower() == v83:lower() then
                            local l_v98_FirstAncestorOfClass_0 = v98:FindFirstAncestorOfClass("Model");
                            local v100 = l_v98_FirstAncestorOfClass_0 and l_v98_FirstAncestorOfClass_0:FindFirstChild("Part") or v96:FindFirstChild("Part");
                            if v100 and v100:IsA("BasePart") then
                                return v100;
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    local function v103(v102) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref)
        if v8.lastState ~= v102 then
            chloex(v102);
            v8.lastState = v102;
        end;
    end;
    v8.loop = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v101 (ref), v65 (ref), v76 (ref), v103 (ref)
        while v8.autoEventActive do
            local v104 = nil;
            local v105 = nil;
            if v8.priorityEvent then
                local v106 = v101(v8.priorityEvent);
                if v106 then
                    local l_v106_0 = v106;
                    v105 = v8.priorityEvent;
                    v104 = l_v106_0;
                end;
            end;
            if not v104 and #v8.selectedEvents > 0 then
                for _, v109 in ipairs(v8.selectedEvents) do
                    local v110 = v101(v109);
                    if v110 then
                        local l_v110_0 = v110;
                        v105 = v109;
                        v104 = l_v110_0;
                        break;
                    end;
                end;
            end;
            local v112 = v65(v8.player.Character);
            if v104 and v112 then
                if not v8.origCF then
                    v8.origCF = v112.CFrame;
                end;
                if (v112.Position - v104.Position).Magnitude > 40 then
                    v8.curCF = v104.CFrame + Vector3.new(0, v8.offs[v105] or 7, 0);
                    v8.player.Character:PivotTo(v8.curCF);
                    v76(v8.player.Character, v112, true);
                    v103("Event! " .. v105);
                end;
            elseif v104 == nil and v8.curCF and v112 then
                if v8.origCF then
                    v8.player.Character:PivotTo(v8.origCF);
                    v103("Event end \226\134\146 Back");
                    v8.origCF = nil;
                end;
                v8.curCF = nil;
            elseif not v8.curCF then
                v103("Idle");
            end;
            task.wait(0.2);
        end;
        v76(v8.player.Character, nil, false);
        if v8.origCF and v8.player.Character then
            v8.player.Character:PivotTo(v8.origCF);
            v103("Auto Event off");
        end;
        local l_v8_0 = v8;
        local l_v8_1 = v8;
        local v115 = nil;
        l_v8_1.curCF = nil;
        l_v8_0.origCF = v115;
    end;
    v8.player.CharacterAdded:Connect(function(v116) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v76 (ref)
        if v8.autoEventActive then
            task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v116 (ref), v8 (ref), v76 (ref)
                local v117 = v116:WaitForChild("HumanoidRootPart", 5);
                task.wait(0.3);
                if v117 then
                    if v8.curCF then
                        v116:PivotTo(v8.curCF);
                        v76(v116, v117, true);
                        chloex("Respawn \226\134\146 Back");
                    elseif v8.origCF then
                        v116:PivotTo(v8.origCF);
                        v76(v116, v117, true);
                        chloex("Back to farm");
                    end;
                end;
            end);
        end;
    end);
    local function v121() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v0 (ref), l_LocalPlayer_0 (ref)
        local v118 = {};
        for _, v120 in ipairs(v0.Players:GetPlayers()) do
            if v120 ~= l_LocalPlayer_0 then
                table.insert(v118, v120.Name);
            end;
        end;
        return v118;
    end;
    local v122 = {
        ["Treasure Room"] = Vector3.new(-3602.01, -266.57, -1577.18), 
        ["Sisyphus Statue"] = Vector3.new(-3703.69, -135.57, -1017.17), 
        ["Crater Island Top"] = Vector3.new(1011.29, 22.68, 5076.27), 
        ["Crater Island Ground"] = Vector3.new(1079.57, 3.64, 5080.35), 
        ["Coral Reefs SPOT 1"] = Vector3.new(-3031.88, 2.52, 2276.36), 
        ["Coral Reefs SPOT 2"] = Vector3.new(-3270.86, 2.5, 2228.1), 
        ["Coral Reefs SPOT 3"] = Vector3.new(-3136.1, 2.61, 2126.11), 
        ["Lost Shore"] = Vector3.new(-3737.97, 5.43, -854.68), 
        ["Weather Machine"] = Vector3.new(-1524.88, 2.87, 1915.56), 
        ["Kohana Volcano"] = Vector3.new(-561.81, 21.24, 156.72), 
        ["Kohana SPOT 1"] = Vector3.new(-367.77, 6.75, 521.91), 
        ["Kohana SPOT 2"] = Vector3.new(-623.96, 19.25, 419.36), 
        ["Stingray Shores"] = Vector3.new(44.41, 28.83, 3048.93), 
        ["Tropical Grove"] = Vector3.new(-2018.91, 9.04, 3750.59), 
        ["Ice Sea"] = Vector3.new(2164, 7, 3269), 
        ["Tropical Grove Cave 1"] = Vector3.new(-2151, 3, 3671), 
        ["Tropical Grove Cave 2"] = Vector3.new(-2018, 5, 3756), 
        ["Tropical Grove Highground"] = Vector3.new(-2139, 53, 3624), 
        ["Fisherman Island Underground"] = Vector3.new(-62, 3, 2846), 
        ["Fisherman Island Mid"] = Vector3.new(33, 3, 2764), 
        ["Fisherman Island Rift Left"] = Vector3.new(-26, 10, 2686), 
        ["Fisherman Island Rift Right"] = Vector3.new(95, 10, 2684), 
        ["Secred Temple"] = Vector3.new(1475, -22, -632), 
        ["Ancient Jungle Outside"] = Vector3.new(1488, 8, -392), 
        ["Ancient Jungle"] = Vector3.new(1274, 8, -184), 
        ["Underground Cellar"] = Vector3.new(2136, -91, -699), 
        ["Mount Hallow"] = Vector3.new(2123, 80, 3265), 
        ["Hallow Bay"] = Vector3.new(1730, 8, 3046), 
        ["Underground Hallow"] = Vector3.new(2167, 8, 3008), 
        ["Crystal Cavern"] = Vector3.new(-1613, -448, 7244), 
        ["Admin Spot"] = Vector3.new(-1940, -447, 7422)
    };
    local function v127() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v5 (ref), v8 (ref)
        for _, v124 in ipairs({
            v5.Net["RE/ObtainedNewFishNotification"], 
            v5.Net["RE/TextNotification"], 
            v5.Net["RE/ClaimNotification"]
        }) do
            for _, v126 in ipairs(getconnections(v124.OnClientEvent)) do
                v126:Disconnect();
                table.insert(v8.notifConnections, v126);
            end;
        end;
    end;
    local function v128() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref)
        v8.notifConnections = {};
    end;
    local v129 = loadstring(game:HttpGet("https://raw.githubusercontent.com/TesterX14/XXXX/refs/heads/main/Library"))():Window({
        Title = "Chloe X |", 
        Footer = "Fish It | Beta Release", 
        Image = "132435516080103", 
        Color = Color3.fromRGB(0, 208, 255), 
        Theme = 9542022979, 
        Version = 2
    });
    if v129 then
        chloex("Window loaded!");
    end;
    local v130 = {
        Info = v129:AddTab({
            Name = "Info", 
            Icon = "player"
        }), 
        Main = v129:AddTab({
            Name = "Fishing", 
            Icon = "rbxassetid://97167558235554"
        }), 
        Auto = v129:AddTab({
            Name = "Automatically", 
            Icon = "next"
        }), 
        Trade = v129:AddTab({
            Name = "Trading", 
            Icon = "rbxassetid://114581487428395"
        }), 
        Quest = v129:AddTab({
            Name = "Quest", 
            Icon = "scroll"
        }), 
        Tele = v129:AddTab({
            Name = "Teleport", 
            Icon = "rbxassetid://18648122722"
        }), 
        Webhook = v129:AddTab({
            Name = "Webhook", 
            Icon = "rbxassetid://137601480983962"
        }), 
        Misc = v129:AddTab({
            Name = "Misc", 
            Icon = "rbxassetid://6034509993"
        })
    };
    local v131 = "https://raw.githubusercontent.com/ChloeRewite/test/refs/heads/main/2.lua";
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v131 (ref)
        local v132 = game:HttpGet(v131);
        local v133, v134 = loadstring(v132);
        if not v133 then
            error(v134);
        end;
        return v133();
    end);
    if l_status_4 and type(l_result_4) == "function" then
        pcall(l_result_4, v129, v130);
    end;
    local v137 = v130.Main:AddSection("Fishing Features");
    local v138 = v137:AddParagraph({
        Title = "Detector Stuck", 
        Content = "Status = Idle\nTime = 0.0s\nBag = 0"
    });
    v137:AddSlider({
        Title = "Wait (s)", 
        Default = 15, 
        Min = 10, 
        Max = 25, 
        Rounding = 0, 
        Callback = function(v139) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.stuckThreshold = v139;
        end
    });
    v137:AddToggle({
        Title = "Start Detector", 
        Content = "Detector if fishing got stuck! this feature helpful", 
        Default = false, 
        Callback = function(v140) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v6 (ref), v138 (ref)
            v8.supportEnabled = v140;
            if v140 then
                v8.char = v8.player.Character or v8.player.CharacterAdded:Wait();
                v8.savedCFrame = v8.char:WaitForChild("HumanoidRootPart").CFrame;
                _G.Celestial.DetectorCount = getFishCount();
                local l_v8_2 = v8;
                local l_v8_3 = v8;
                local v143 = 0;
                l_v8_3.equipTimer = 0;
                l_v8_2.fishingTimer = v143;
                l_v8_2 = "Idle";
                l_v8_3 = "255,255,255";
                v143 = 0;
                do
                    local l_l_v8_2_0, l_l_v8_3_0, l_v143_0 = l_v8_2, l_v8_3, v143;
                    task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v8 (ref), l_v143_0 (ref), l_l_v8_2_0 (ref), l_l_v8_3_0 (ref), v6 (ref), v138 (ref)
                        while v8.supportEnabled do
                            task.wait(0.1);
                            l_v143_0 = l_v143_0 + 1;
                            v8.equipTimer = v8.equipTimer + 0.1;
                            v8.fishingTimer = v8.fishingTimer + 0.1;
                            if l_v143_0 % 30000 == 0 then
                                task.wait(5);
                                collectgarbage("collect");
                                l_v143_0 = 0;
                            end;
                            if l_v143_0 % 216000 == 0 then
                                v8.char = v8.player.Character or v8.player.CharacterAdded:Wait();
                            end;
                            local v147 = getFishCount();
                            if _G.Celestial.DetectorCount < v147 then
                                _G.Celestial.DetectorCount = v147;
                                v8.fishingTimer = 0;
                                l_l_v8_2_0 = "Fishing Normaly";
                                l_l_v8_3_0 = "0,255,127";
                            elseif v147 < _G.Celestial.DetectorCount then
                                _G.Celestial.DetectorCount = v147;
                                l_l_v8_2_0 = "Bag Update";
                                l_l_v8_3_0 = "173,216,230";
                            elseif v8.fishingTimer >= (v8.stuckThreshold or 10) then
                                l_l_v8_2_0 = "STUCK! Resetting...";
                                l_l_v8_3_0 = "255,69,0";
                                chloex("Fishing Stuck! Resetting...", 3);
                                local v148 = v8.char and v8.char:FindFirstChild("HumanoidRootPart");
                                if v148 then
                                    v8.savedCFrame = v148.CFrame;
                                end;
                                v8.player.Character:BreakJoints();
                                v8.char = v8.player.CharacterAdded:Wait();
                                v8.char:WaitForChild("HumanoidRootPart").CFrame = v8.savedCFrame;
                                task.wait(0.2);
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v6 (ref)
                                    v6.Events.REEquip:FireServer(1);
                                end);
                                v8.fishingTimer = 0;
                                _G.Celestial.DetectorCount = getFishCount();
                                l_l_v8_2_0 = "Idle";
                                l_l_v8_3_0 = "255,255,255";
                            end;
                            v138:SetContent(string.format("<font color='rgb(%s)'>Status = %s</font>\n<font color='rgb(0,191,255)'>Time = %.1fs</font>\n<font color='rgb(173,216,230)'>Bag = %d</font>", l_l_v8_3_0, l_l_v8_2_0, v8.fishingTimer, v147));
                        end;
                        v138:SetContent("<font color='rgb(200,200,200)'>Status = Detector Offline</font>\nTime = 0.0s\nBag = 0");
                    end);
                end;
            else
                v138:SetContent("<font color='rgb(200,200,200)'>Status = Detector Offline</font>\nTime = 0.0s\nBag = 0");
            end;
        end
    });
    v137:AddDivider();
    v137:AddInput({
        Title = "Fishing Delay", 
        Content = "Delay complete fishing!", 
        Value = tostring(_G.Delay), 
        Callback = function(v149) --[[ Line: 0 ]] --[[ Name:  ]]
            local v150 = tonumber(v149);
            if v150 and v150 > 0 then
                _G.Delay = v150;
            end;
        end
    });
    v137:AddToggle({
        Title = "Legit Fishing", 
        Content = "Auto fishing with animation", 
        Default = false, 
        Callback = function(v151) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v5 (ref), v6 (ref)
            if not v5.FishingController._oldGetPower then
                v5.FishingController._oldGetPower = v5.FishingController._getPower;
            end;
            if v151 then
                v5.FishingController._autoLoop = true;
                v5.FishingController._getPower = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    return 0.999;
                end;
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v5 (ref), v6 (ref)
                    local v152 = false;
                    while v5.FishingController._autoLoop do
                        if v5.FishingController:GetCurrentGUID() then
                            local v153 = tick();
                            while v5.FishingController:GetCurrentGUID() and v5.FishingController._autoLoop do
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v5 (ref)
                                    v5.FishingController:RequestFishingMinigameClick();
                                end);
                                if tick() - v153 >= _G.Delay then
                                    repeat
                                        if v5.FishingController:GetCurrentGUID() and v5.FishingController._autoLoop then
                                            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                                -- upvalues: v6 (ref)
                                                v6.Events.REFishDone:FireServer();
                                            end);
                                            task.wait(0.1);
                                        else
                                            v152 = true;
                                        end;
                                    until v152;
                                else
                                    task.wait(0.1);
                                end;
                                if v152 then
                                    break;
                                end;
                            end;
                        else
                            local v154 = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2);
                            if true then
                                local l_v154_0 = v154;
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v5 (ref), l_v154_0 (ref)
                                    v5.FishingController:RequestChargeFishingRod(l_v154_0, true);
                                end);
                                task.wait(0.2);
                            end;
                        end;
                        v152 = false;
                        task.wait(0.05);
                    end;
                end);
            else
                if v5.FishingController._oldGetPower then
                    v5.FishingController._getPower = v5.FishingController._oldGetPower;
                end;
                v5.FishingController._autoLoop = false;
            end;
        end
    });
    v137:AddToggle({
        Title = "Auto Shake", 
        Content = "Spam click during fishing (only legit)", 
        Default = false, 
        Callback = function(v156) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v5 (ref), v0 (ref)
            v5._autoShake = v156;
            clickEffect = v0.PG:FindFirstChild("!!! Click Effect");
            if v156 then
                if clickEffect then
                    clickEffect.Enabled = false;
                end;
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v5 (ref)
                    while v5._autoShake do
                        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v5 (ref)
                            v5.FishingController:RequestFishingMinigameClick();
                        end);
                        task.wait(0.1);
                    end;
                end);
            elseif clickEffect then
                clickEffect.Enabled = true;
            end;
        end
    });
    v137:AddDivider();
    v137:AddInput({
        Title = "Delay Cast", 
        Value = tostring(_G.DelayCast), 
        Callback = function(v157) --[[ Line: 0 ]] --[[ Name:  ]]
            local v158 = tonumber(v157);
            if v158 and v158 >= 0 then
                _G.DelayCast = v158;
            end;
        end
    });
    v137:AddInput({
        Title = "Delay Complete", 
        Value = tostring(_G.DelayComplete), 
        Callback = function(v159) --[[ Line: 0 ]] --[[ Name:  ]]
            local v160 = tonumber(v159);
            if v160 and v160 >= 0 then
                _G.DelayComplete = v160;
            end;
        end
    });
    v137:AddToggle({
        Title = "Instant Fishing", 
        Content = "Auto instantly catch fish (Slowed)", 
        Default = false, 
        Callback = function(v161) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v6 (ref)
            v8.autoInstant = v161;
            if v161 then
                _G.Celestial.InstantCount = getFishCount();
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v8 (ref), v6 (ref)
                    while v8.autoInstant do
                        if v8.canFish then
                            v8.canFish = false;
                            local v162, _, v164 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: v6 (ref)
                                return v6.Functions.ChargeRod:InvokeServer(workspace:GetServerTimeNow());
                            end);
                            do
                                local l_v164_0 = v164;
                                if v162 and typeof(l_v164_0) == "number" then
                                    local v166 = -1.233184814453125;
                                    local v167 = 0.999;
                                    task.wait(_G.DelayCast);
                                    do
                                        local l_v166_0, l_v167_0 = v166, v167;
                                        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                            -- upvalues: v6 (ref), l_v166_0 (ref), l_v167_0 (ref), l_v164_0 (ref)
                                            v6.Functions.StartMini:InvokeServer(l_v166_0, l_v167_0, l_v164_0);
                                        end);
                                        local v170 = tick();
                                        repeat
                                            task.wait(0.05);
                                        until _G.FishMiniData and _G.FishMiniData.LastShift or tick() - v170 > 1;
                                        task.wait(_G.DelayComplete);
                                        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                            -- upvalues: v6 (ref)
                                            v6.Events.REFishDone:FireServer();
                                        end);
                                        local v171 = getFishCount();
                                        local v172 = tick();
                                        repeat
                                            task.wait(0.05);
                                        until v171 < getFishCount() or tick() - v172 > 1;
                                    end;
                                end;
                                v8.canFish = true;
                            end;
                        end;
                        task.wait(0.05);
                    end;
                end);
            end;
        end
    });
    local l_net_0 = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_net@0.2.0"].net;
    local v174 = l_net_0:FindFirstChild("RE/FishingMinigameChanged") or l_net_0:FindFirstChild("FishingMinigameChanged");
    if v174 and not _G.HookedMini then
        _G.HookedMini = true;
        v174.OnClientEvent:Connect(function(v175, v176) --[[ Line: 0 ]] --[[ Name:  ]]
            if v175 and v176 then
                _G.FishMiniData = v176;
            end;
        end);
    end;
    v137:AddSubSection("Utility Player");
    v137:AddToggle({
        Title = "Auto Equip Rod", 
        Content = "Automatically equip your fishing rod", 
        Default = false, 
        Callback = function(v177) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v7 (ref), v5 (ref), v6 (ref)
            v8.autoEquipRod = v177;
            local function v182() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v7 (ref), v5 (ref)
                local v178 = v7.Data:Get("EquippedId");
                if not v178 then
                    return false;
                else
                    local l_ItemFromInventory_0 = v5.PlayerStatsUtility:GetItemFromInventory(v7.Data, function(v179) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v178 (ref)
                        return v179.UUID == v178;
                    end);
                    if not l_ItemFromInventory_0 then
                        return false;
                    else
                        local l_ItemData_0 = v5.ItemUtility:GetItemData(l_ItemFromInventory_0.Id);
                        return l_ItemData_0 and l_ItemData_0.Data.Type == "Fishing Rods";
                    end;
                end;
            end;
            local function v183() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v182 (ref), v6 (ref)
                if not v182() then
                    v6.Events.REEquip:FireServer(1);
                end;
            end;
            task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v8 (ref), v183 (ref)
                while v8.autoEquipRod do
                    v183();
                    task.wait(1);
                end;
            end);
        end
    });
    v137:AddToggle({
        Title = "No Fishing Animations", 
        Default = false, 
        Callback = function(v184) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: l_LocalPlayer_0 (ref), v8 (ref)
            local l_Animator_0 = (l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait()):WaitForChild("Humanoid"):FindFirstChildOfClass("Animator");
            if not l_Animator_0 then
                return;
            else
                if v184 then
                    v8.stopAnimHookEnabled = true;
                    for _, v187 in ipairs(l_Animator_0:GetPlayingAnimationTracks()) do
                        v187:Stop(0);
                    end;
                    v8.stopAnimConn = l_Animator_0.AnimationPlayed:Connect(function(v188) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v8 (ref)
                        if v8.stopAnimHookEnabled then
                            task.defer(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: v188 (ref)
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v188 (ref)
                                    v188:Stop(0);
                                end);
                            end);
                        end;
                    end);
                else
                    v8.stopAnimHookEnabled = false;
                    if v8.stopAnimConn then
                        v8.stopAnimConn:Disconnect();
                        v8.stopAnimConn = nil;
                    end;
                end;
                return;
            end;
        end
    });
    v137:AddToggle({
        Title = "Freeze Player", 
        Content = "Freeze only if rod is equipped", 
        Default = false, 
        Callback = function(v189) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v7 (ref), v5 (ref), v6 (ref)
            v8.frozen = v189;
            local l_Character_0 = v8.player.Character;
            local function v195() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v7 (ref), v5 (ref)
                local v191 = v7.Data:Get("EquippedId");
                if not v191 then
                    return false;
                else
                    local l_ItemFromInventory_1 = v5.PlayerStatsUtility:GetItemFromInventory(v7.Data, function(v192) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v191 (ref)
                        return v192.UUID == v191;
                    end);
                    if not l_ItemFromInventory_1 then
                        return false;
                    else
                        local l_ItemData_1 = v5.ItemUtility:GetItemData(l_ItemFromInventory_1.Id);
                        return l_ItemData_1 and l_ItemData_1.Data.Type == "Fishing Rods";
                    end;
                end;
            end;
            local function v196() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v195 (ref), v6 (ref)
                if not v195() then
                    v6.Events.REEquip:FireServer(1);
                    task.wait(0.5);
                end;
            end;
            local function v201(v197, v198) --[[ Line: 0 ]] --[[ Name:  ]]
                if not v197 then
                    return;
                else
                    for _, v200 in ipairs(v197:GetDescendants()) do
                        if v200:IsA("BasePart") then
                            v200.Anchored = v198;
                        end;
                    end;
                    return;
                end;
            end;
            local function v203(v202) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v8 (ref), v196 (ref), v195 (ref), v201 (ref)
                if v8.frozen then
                    v196();
                    if v195() then
                        v201(v202, true);
                    end;
                else
                    v201(v202, false);
                end;
            end;
            v203(l_Character_0);
            v8.player.CharacterAdded:Connect(function(v204) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v203 (ref)
                task.wait(1);
                v203(v204);
            end);
        end
    });
    local v205 = v130.Main:AddSection("Selling Features");
    v205:AddDropdown({
        Options = {
            "Delay", 
            "Count"
        }, 
        Default = "Delay", 
        Title = "Select Sell Mode", 
        Callback = function(v206) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.sellMode = v206;
        end
    });
    v205:AddInput({
        Default = "60", 
        Title = "Set Value", 
        Content = "Delay = Time Count | Count = Backpack Count", 
        Placeholder = "Input Here", 
        Callback = function(v207) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local v208 = tonumber(v207) or 1;
            if v8.sellMode == "Delay" then
                v8.sellDelay = v208;
            else
                v8.inputSellCount = v208;
            end;
        end
    });
    v205:AddToggle({
        Title = "Start Selling", 
        Default = false, 
        Callback = function(v209) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v5 (ref), l_LocalPlayer_0 (ref)
            v8.autoSellEnabled = v209;
            if v209 then
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v5 (ref), v8 (ref), l_LocalPlayer_0 (ref)
                    local v210 = v5.Net["RF/SellAllItems"];
                    while v8.autoSellEnabled do
                        local l_BagSize_1 = l_LocalPlayer_0.PlayerGui:WaitForChild("Inventory").Main.Top.Options.Fish.Label.BagSize;
                        local v212 = tonumber((l_BagSize_1.Text or "0/5000"):match("(%d+)/")) or 0;
                        if v8.sellMode == "Delay" then
                            v210:InvokeServer();
                            task.wait(v8.sellDelay);
                        elseif v8.sellMode == "Count" then
                            if v8.inputSellCount <= v212 then
                                v210:InvokeServer();
                            end;
                            task.wait(0.1);
                        end;
                    end;
                end);
            end;
        end
    });
    local v213 = v130.Main:AddSection("Favorite Features");
    v213:AddDropdown({
        Options = #v11 > 0 and v11 or {
            "No Fish Found"
        }, 
        Content = "Favorite By Name Fish (Recommended)", 
        Multi = true, 
        Title = "Name", 
        Callback = function(v214) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.selectedName = toSet(v214);
        end
    });
    v213:AddDropdown({
        Options = {
            "Common", 
            "Uncommon", 
            "Rare", 
            "Epic", 
            "Legendary", 
            "Mythic", 
            "Secret"
        }, 
        Content = "Favorite By Rarity (Optional)", 
        Multi = true, 
        Title = "Rarity", 
        Callback = function(v215) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.selectedRarity = toSet(v215);
        end
    });
    v213:AddDropdown({
        Options = _G.Variant, 
        Content = "Favorite By Variant (Only works with Name)", 
        Multi = true, 
        Title = "Variant", 
        Callback = function(v216) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            if next(v8.selectedName) ~= nil then
                v8.selectedVariant = toSet(v216);
            else
                v8.selectedVariant = {};
                warn("Pilih Name dulu sebelum memilih Variant.");
            end;
        end
    });
    v213:AddToggle({
        Title = "Auto Favorite", 
        Default = false, 
        Callback = function(v217) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v7 (ref)
            v8.autoFavEnabled = v217;
            if v217 then
                scanInventory();
                v7.Data:OnChange({
                    "Inventory", 
                    "Items"
                }, scanInventory);
            end;
        end
    });
    v213:AddToggle({
        Title = "Auto Favorite Artifact", 
        Default = false, 
        Callback = function(v218) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v7 (ref), v6 (ref)
            v8.autoFavArtifact = v218;
            if v218 then
                local function v223() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v7 (ref), v6 (ref)
                    local v219 = v7.Data:Get({
                        "Inventory", 
                        "Items"
                    }) or {};
                    for _, v221 in pairs(v219) do
                        do
                            local l_v221_0 = v221;
                            if l_v221_0 and l_v221_0.Id and typeof(l_v221_0.Id) == "string" and string.find(l_v221_0.Id, "Artifact") then
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v6 (ref), l_v221_0 (ref)
                                    v6.Events.REFav:FireServer(l_v221_0.UUID, true);
                                end);
                                task.wait(0.05);
                            end;
                        end;
                    end;
                end;
                v223();
                v7.Data:OnChange({
                    "Inventory", 
                    "Items"
                }, v223);
            end;
        end
    });
    v213:AddButton({
        Title = "Unfavorite Fish", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v7 (ref), v22 (ref), v6 (ref)
            for _, v225 in ipairs(v7.Data:GetExpect({
                "Inventory", 
                "Items"
            })) do
                local v226 = rawget(v22, v225.UUID);
                if v226 == nil then
                    v226 = v225.Favorited;
                end;
                if v226 then
                    v6.Events.REFav:FireServer(v225.UUID);
                    rawset(v22, v225.UUID, false);
                end;
            end;
        end
    });
    local v227 = v130.Auto:AddSection("Shop Features");
    ShopParagraph = v227:AddParagraph({
        Title = "MERCHANT STOCK PANEL", 
        Content = "Loading..."
    });
    v227:AddButton({
        Title = "Open/Close Merchant", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v0 (ref)
            local l_Merchant_0 = v0.PG:FindFirstChild("Merchant");
            if l_Merchant_0 then
                l_Merchant_0.Enabled = not l_Merchant_0.Enabled;
            end;
        end
    });
    UPX = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v4 (ref)
        local v229 = {};
        for _, v231 in ipairs(v4.ItemsFrame:GetChildren()) do
            if v231:IsA("ImageLabel") and v231.Name ~= "Frame" then
                local l_Frame_0 = v231:FindFirstChild("Frame");
                if l_Frame_0 and l_Frame_0:FindFirstChild("ItemName") then
                    local l_Text_0 = l_Frame_0.ItemName.Text;
                    if not string.find(l_Text_0, "Mystery") then
                        table.insert(v229, "- " .. l_Text_0);
                    end;
                end;
            end;
        end;
        if #v229 == 0 then
            ShopParagraph:SetContent("No items found\n" .. v4.RefreshMerchant.Text);
        else
            ShopParagraph:SetContent(table.concat(v229, "\n") .. "\n\n" .. v4.RefreshMerchant.Text);
        end;
    end;
    task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
        while task.wait(1) do
            pcall(UPX);
        end;
    end);
    v227:AddSubSection("Buy Rod");
    v227:AddDropdown({
        Title = "Select Rod", 
        Options = v8.rodDisplayNames, 
        Callback = function(v234) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            if not v234 then
                return;
            else
                local v235 = _cleanName(v234);
                local v236 = v8.rods[v235];
                if v236 then
                    v8.selectedRodId = v236.Id;
                end;
                return;
            end;
        end
    });
    v227:AddButton({
        Title = "Buy Selected Rod", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v6 (ref)
            if not v8.selectedRodId then
                return;
            else
                local v237 = v8.rods[v8.selectedRodId] or v8.rods[_cleanName(v8.selectedRodId)];
                if not v237 then
                    return;
                else
                    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v6 (ref), v237 (ref)
                        v6.Functions.BuyRod:InvokeServer(v237.Id);
                    end);
                    return;
                end;
            end;
        end
    });
    v227:AddSubSection("Buy Baits");
    v227:AddDropdown({
        Title = "Select Bait", 
        Options = v8.baitDisplayNames, 
        Callback = function(v238) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            if not v238 then
                return;
            else
                local v239 = _cleanName(v238);
                local v240 = v8.baits[v239];
                if v240 then
                    v8.selectedBaitId = v240.Id;
                end;
                return;
            end;
        end
    });
    v227:AddButton({
        Title = "Buy Selected Bait", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v6 (ref)
            if not v8.selectedBaitId then
                return;
            else
                local v241 = v8.baits[v8.selectedBaitId] or v8.baits[_cleanName(v8.selectedBaitId)];
                if not v241 then
                    return;
                else
                    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v6 (ref), v241 (ref)
                        v6.Functions.BuyBait:InvokeServer(v241.Id);
                    end);
                    return;
                end;
            end;
        end
    });
    v227:AddSubSection("Buy Weather");
    local v246 = v227:AddDropdown({
        Title = "Select Weather", 
        Multi = true, 
        Options = {
            "Cloudy ($10000)", 
            "Wind ($10000)", 
            "Snow ($15000)", 
            "Storm ($35000)", 
            "Radiant ($50000)", 
            "Shark Hunt ($300000)"
        }, 
        Callback = function(v242) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.selectedEvents = {};
            if type(v242) == "table" then
                for _, v244 in ipairs(v242) do
                    local v245 = v244:match("^(.-) %(") or v244;
                    table.insert(v8.selectedEvents, v245);
                end;
            end;
            SaveConfig();
        end
    });
    v227:AddToggle({
        Title = "Auto Buy Weather", 
        Default = false, 
        Callback = function(v247) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v6 (ref), v246 (ref)
            v8.autoBuyWeather = v247;
            if not v6.Functions.BuyWeather then
                return;
            else
                if v247 then
                    task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v8 (ref), v246 (ref), v6 (ref)
                        while v8.autoBuyWeather do
                            local v248 = v246.Value or v246.Selected or {};
                            local v249 = {};
                            if type(v248) == "table" then
                                for _, v251 in ipairs(v248) do
                                    local v252 = v251:match("^(.-) %(") or v251;
                                    table.insert(v249, v252);
                                end;
                            elseif type(v248) == "string" then
                                local v253 = v248:match("^(.-) %(") or v248;
                                table.insert(v249, v253);
                            end;
                            if #v249 > 0 then
                                local v254 = {};
                                local l_Weather_0 = workspace:FindFirstChild("Weather");
                                if l_Weather_0 then
                                    for _, v257 in ipairs(l_Weather_0:GetChildren()) do
                                        table.insert(v254, string.lower(v257.Name));
                                    end;
                                end;
                                for _, v259 in ipairs(v249) do
                                    local v260 = string.lower(v259);
                                    do
                                        local l_v259_0 = v259;
                                        if not table.find(v254, v260) then
                                            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                                -- upvalues: v6 (ref), l_v259_0 (ref)
                                                v6.Functions.BuyWeather:InvokeServer(l_v259_0);
                                            end);
                                            task.wait(0.05);
                                        end;
                                    end;
                                end;
                            end;
                            task.wait(0.1);
                        end;
                    end);
                end;
                return;
            end;
        end
    });
    local v262 = v130.Auto:AddSection("Save position Features");
    v262:AddParagraph({
        Title = "Guide Teleport", 
        Content = "\r\n<b><font color=\"rgb(0,162,255)\">AUTO TELEPORT?</font></b>\r\nClick <b><font color=\"rgb(0,162,255)\">Save Position</font></b> to save your current position!\r\n\r\n<b><font color=\"rgb(0,162,255)\">HOW TO LOAD?</font></b>\r\nThis feature will auto-sync your last position when executed, so you will teleport automatically!\r\n\r\n<b><font color=\"rgb(0,162,255)\">HOW TO RESET?</font></b>\r\nClick <b><font color=\"rgb(0,162,255)\">Reset Position</font></b> to clear your saved position.\r\n    "
    });
    v262:AddButton({
        Title = "Save Position", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: l_LocalPlayer_0 (ref)
            local l_Character_1 = l_LocalPlayer_0.Character;
            local v264 = l_Character_1 and l_Character_1:FindFirstChild("HumanoidRootPart");
            if v264 then
                SavePosition(v264.CFrame);
                chloex("Position saved successfully!");
            end;
        end, 
        SubTitle = "Reset Position", 
        SubCallback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v3 (ref)
            if isfile(v3) then
                delfile(v3);
            end;
            chloex("Last position has been reset.");
        end
    });
    local v265 = v130.Auto:AddSection("Enchant Features");
    local function v284(v266) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v7 (ref), v5 (ref)
        local v267 = false;
        local v268 = "None";
        local v269 = "None";
        local v270 = 0;
        local v271 = {};
        local v272 = v7.Data:Get("EquippedItems") or {};
        local v273 = v7.Data:Get({
            "Inventory", 
            "Fishing Rods"
        }) or {};
        for _, v275 in pairs(v272) do
            for _, v277 in ipairs(v273) do
                if v277.UUID == v275 then
                    local l_ItemData_2 = v5.ItemUtility:GetItemData(v277.Id);
                    v268 = l_ItemData_2 and l_ItemData_2.Data.Name or v277.ItemName or "None";
                    if v277.Metadata and v277.Metadata.EnchantId then
                        local l_EnchantData_0 = v5.ItemUtility:GetEnchantData(v277.Metadata.EnchantId);
                        if l_EnchantData_0 then
                            local l_Name_1 = l_EnchantData_0.Data.Name;
                            if l_Name_1 then
                                v269 = l_Name_1;
                                v267 = true;
                            end;
                        end;
                        if not v267 then
                            v269 = "None";
                        end;
                    end;
                end;
                v267 = false;
            end;
        end;
        for _, v282 in pairs(v7.Data:GetExpect({
            "Inventory", 
            "Items"
        })) do
            local l_ItemData_3 = v5.ItemUtility:GetItemData(v282.Id);
            if l_ItemData_3 and l_ItemData_3.Data.Type == "EnchantStones" and v282.Id == v266 then
                v270 = v270 + 1;
                table.insert(v271, v282.UUID);
            end;
        end;
        return v268, v269, v270, v271;
    end;
    local v285 = v265:AddParagraph({
        Title = "Enchant Status", 
        Content = "Current Rod : None\nCurrent Enchant : None\nEnchant Stones Left : 0"
    });
    v265:AddButton({
        Title = "Click Enchant", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v284 (ref), v285 (ref), v7 (ref), v6 (ref)
            task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v284 (ref), v285 (ref), v7 (ref), v6 (ref)
                local v286, v287, v288, v289 = v284(10);
                if v286 == "None" or v288 <= 0 then
                    v285:SetContent(("Current Rod : <font color='rgb(0,170,255)'>%s</font>\nCurrent Enchant : <font color='rgb(0,170,255)'>%s</font>\nEnchant Stones Left : <font color='rgb(0,170,255)'>%d</font>"):format(v286, v287, v288));
                    return;
                else
                    local v290 = nil;
                    local v291 = tick();
                    while tick() - v291 < 5 do
                        local l_pairs_0 = pairs;
                        local v293 = v7.Data:Get("EquippedItems") or {};
                        for v294, v295 in l_pairs_0(v293) do
                            if v295 == v289[1] then
                                v290 = v294;
                            end;
                        end;
                        if not v290 then
                            v6.Events.REEquipItem:FireServer(v289[1], "EnchantStones");
                            task.wait(0.3);
                        else
                            break;
                        end;
                    end;
                    if not v290 then
                        return;
                    else
                        v6.Events.REEquip:FireServer(v290);
                        task.wait(0.2);
                        v6.Events.REAltar:FireServer();
                        task.wait(1.5);
                        local _, v297 = v284(10);
                        v285:SetContent(("Current Rod : <font color='rgb(0,170,255)'>%s</font>\nCurrent Enchant : <font color='rgb(0,170,255)'>%s</font>\nEnchant Stones Left : <font color='rgb(0,170,255)'>%d</font>"):format(v286, v297, v288 - 1));
                        return;
                    end;
                end;
            end);
        end
    });
    v265:AddButton({
        Title = "Teleport Enchant Altar", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local v298 = v8.player.Character or v8.player.CharacterAdded:Wait();
            local l_HumanoidRootPart_1 = v298:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_0 = v298:FindFirstChildOfClass("Humanoid");
            if l_HumanoidRootPart_1 and l_Humanoid_0 then
                l_HumanoidRootPart_1.CFrame = CFrame.new(Vector3.new(3258, -1301, 1391));
                l_Humanoid_0:ChangeState(Enum.HumanoidStateType.Physics);
                task.wait(0.1);
                l_Humanoid_0:ChangeState(Enum.HumanoidStateType.Running);
            end;
        end
    });
    v265:AddDivider();
    v265:AddButton({
        Title = "Click Double Enchant", 
        Content = "Starting Double Enchanting", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v284 (ref), v285 (ref), v7 (ref), v6 (ref)
            task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v284 (ref), v285 (ref), v7 (ref), v6 (ref)
                local v301, v302, v303, v304 = v284(246);
                if v301 == "None" or v303 <= 0 then
                    v285:SetContent(("Current Rod : <font color='rgb(0,170,255)'>%s</font>\nCurrent Enchant : <font color='rgb(0,170,255)'>%s</font>\nEnchant Stones Left : <font color='rgb(0,170,255)'>%d</font>"):format(v301, v302, v303));
                    return;
                else
                    local v305 = nil;
                    local v306 = tick();
                    while tick() - v306 < 5 do
                        local l_pairs_1 = pairs;
                        local v308 = v7.Data:Get("EquippedItems") or {};
                        for v309, v310 in l_pairs_1(v308) do
                            if v310 == v304[1] then
                                v305 = v309;
                            end;
                        end;
                        if not v305 then
                            v6.Events.REEquipItem:FireServer(v304[1], "EnchantStones");
                            task.wait(0.3);
                        else
                            break;
                        end;
                    end;
                    if not v305 then
                        return;
                    else
                        v6.Events.REEquip:FireServer(v305);
                        task.wait(0.2);
                        v6.Events.REAltar2:FireServer();
                        task.wait(1.5);
                        local _, v312 = v284(246);
                        v285:SetContent(("Current Rod : <font color='rgb(0,170,255)'>%s</font>\nCurrent Enchant : <font color='rgb(0,170,255)'>%s</font>\nEnchant Stones Left : <font color='rgb(0,170,255)'>%d</font>"):format(v301, v312, v303 - 1));
                        return;
                    end;
                end;
            end);
        end
    });
    v265:AddButton({
        Title = "Teleport Second Enchant Altar", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local v313 = v8.player.Character or v8.player.CharacterAdded:Wait();
            local l_HumanoidRootPart_2 = v313:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = v313:FindFirstChildOfClass("Humanoid");
            if l_HumanoidRootPart_2 and l_Humanoid_1 then
                l_HumanoidRootPart_2.CFrame = CFrame.new(Vector3.new(1480, 128, -593));
                l_Humanoid_1:ChangeState(Enum.HumanoidStateType.Physics);
                task.wait(0.1);
                l_Humanoid_1:ChangeState(Enum.HumanoidStateType.Running);
            end;
        end
    });
    local v316 = v130.Auto:AddSection("Totem Features");
    TotemPanel = v316:AddParagraph({
        Title = "Panel Activated Totem", 
        Content = "Scanning Totems..."
    });
    HeaderPanel = v316:AddParagraph({
        Title = "Auto Totem Status", 
        Content = "Idle."
    });
    GetTT = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref)
        local v317 = v8.char and v8.char:FindFirstChild("HumanoidRootPart") and v8.char.HumanoidRootPart.Position or Vector3.zero;
        local v318 = {};
        for _, v320 in pairs(workspace.Totems:GetChildren()) do
            if v320:IsA("Model") then
                local l_Handle_0 = v320:FindFirstChild("Handle");
                local v322 = l_Handle_0 and l_Handle_0:FindFirstChild("Overhead");
                local v323 = v322 and v322:FindFirstChild("Content");
                local v324 = v323 and v323:FindFirstChild("TimerLabel");
                local l_Magnitude_0 = (v317 - v320:GetPivot().Position).Magnitude;
                local v326 = v324 and v324.Text or "??";
                table.insert(v318, {
                    Name = v320.Name, 
                    Distance = l_Magnitude_0, 
                    TimeLeft = v326
                });
            end;
        end;
        return v318;
    end;
    UpdTT = function() --[[ Line: 0 ]] --[[ Name:  ]]
        local v327 = GetTT();
        if #v327 == 0 then
            TotemPanel:SetContent("No active totems detected.");
            return;
        else
            local v328 = {};
            for _, v330 in ipairs(v327) do
                table.insert(v328, string.format("%s \226\128\162 %.1f studs \226\128\162 %s", v330.Name, v330.Distance, v330.TimeLeft));
            end;
            TotemPanel:SetContent(table.concat(v328, "\n"));
            return;
        end;
    end;
    task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
        while task.wait(1) do
            pcall(UpdTT);
        end;
    end);
    GetTTUUID = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v5 (ref)
        if not Data then
            Data = v5.Replion.Client:WaitReplion("Data");
            if not Data then
                return nil;
            end;
        end;
        if not Totems then
            Totems = require(game:GetService("ReplicatedStorage"):WaitForChild("Totems"));
            if not Totems then
                return nil;
            end;
        end;
        local v331 = Data:GetExpect({
            "Inventory", 
            "Totems"
        }) or {};
        for _, v333 in ipairs(v331) do
            local v334 = "Unknown Totem";
            if typeof(Totems) == "table" then
                for _, v336 in pairs(Totems) do
                    if v336.Data and v336.Data.Id == v333.Id then
                        v334 = v336.Data.Name;
                        break;
                    end;
                end;
            end;
            return v333.UUID, v334;
        end;
        return nil;
    end;
    local function v337() --[[ Line: 0 ]] --[[ Name:  ]]
        if RealTotemPanel and RealTotemPanel.Show then
            RealTotemPanel:Show();
        end;
    end;
    local function v341(v338) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v6 (ref)
        if not v338 then
            return;
        else
            local l_status_5, l_result_5 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v6 (ref), v338 (ref)
                v6.Events.Totem:FireServer(v338);
            end);
            if not l_status_5 then
                warn("[Chloe X] Totem spawn failed:", tostring(l_result_5));
            end;
            return;
        end;
    end;
    v316:AddButton({
        Title = "Teleport To Nearest Totem", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local v342 = v8.char and v8.char:FindFirstChild("HumanoidRootPart");
            if not v342 then
                return;
            else
                local v343 = GetTT();
                if #v343 == 0 then
                    return;
                else
                    table.sort(v343, function(v344, v345) --[[ Line: 0 ]] --[[ Name:  ]]
                        return v344.Distance < v345.Distance;
                    end);
                    local v346 = v343[1];
                    for _, v348 in pairs(workspace.Totems:GetChildren()) do
                        if v348:IsA("Model") then
                            local l_Position_0 = v348:GetPivot().Position;
                            if math.abs((l_Position_0 - v342.Position).Magnitude - v346.Distance) < 1 then
                                v342.CFrame = CFrame.new(l_Position_0 + Vector3.new(0, 3, 0));
                                break;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end
    });
    v316:AddToggle({
        Title = "Auto Place Totem (Beta)", 
        Content = "Place Totem every 60 minutes automatically.", 
        Default = false, 
        Callback = function(v350) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v341 (ref), v337 (ref)
            TotemActive = v350;
            if v350 then
                local v351, v352 = GetTTUUID();
                if not v351 then
                    HeaderPanel:SetContent("You don't own any Totem.");
                    TotemActive = false;
                    return;
                else
                    HeaderPanel:SetContent(("Auto Totem Enabled [%s] \226\128\162 Waiting 60m loop..."):format(v352));
                    do
                        local l_v351_0, l_v352_0 = v351, v352;
                        task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                            -- upvalues: v341 (ref), l_v351_0 (ref), l_v352_0 (ref), v337 (ref)
                            local v355 = 0;
                            while TotemActive do
                                v341(l_v351_0);
                                if v355 < 3 then
                                    HeaderPanel:SetContent(("Totem Used [%s] \226\128\162 Next in 60m"):format(l_v352_0));
                                    v355 = v355 + 1;
                                elseif v355 == 3 then
                                    v355 = v355 + 1;
                                    task.wait(1);
                                    HeaderPanel:SetContent("Reverting to Real Totem Panel...");
                                    task.wait(0.5);
                                    v337();
                                end;
                                for _ = 3600, 1, -1 do
                                    if TotemActive then
                                        task.wait(1);
                                    else
                                        break;
                                    end;
                                end;
                                local v357, v358 = GetTTUUID();
                                l_v352_0 = v358;
                                l_v351_0 = v357;
                                if not l_v351_0 then
                                    HeaderPanel:SetContent("Totem not found in inventory anymore.");
                                    TotemActive = false;
                                    break;
                                end;
                            end;
                            HeaderPanel:SetContent("Auto Totem Disabled.");
                        end);
                    end;
                end;
            else
                HeaderPanel:SetContent("Auto Totem Disabled.");
                v337();
            end;
        end
    });
    local v359 = v130.Auto:AddSection("Event Features");
    v359:AddDropdown({
        Options = v82() or {}, 
        Multi = false, 
        Title = "Priority Event", 
        Callback = function(v360) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.priorityEvent = v360;
        end
    });
    v359:AddDropdown({
        Options = v82() or {}, 
        Multi = true, 
        Title = "Select Event", 
        Callback = function(v361) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.selectedEvents = {};
            for _, v363 in pairs(v361) do
                table.insert(v8.selectedEvents, v363);
            end;
            v8.curCF = nil;
            if v8.autoEventActive and (#v8.selectedEvents > 0 or v8.priorityEvent) then
                task.spawn(v8.loop);
            end;
        end
    });
    v359:AddToggle({
        Title = "Auto Event", 
        Default = false, 
        Callback = function(v364) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v65 (ref), l_LocalPlayer_0 (ref)
            v8.autoEventActive = v364;
            if v364 and (#v8.selectedEvents > 0 or v8.priorityEvent) then
                v8.origCF = v8.origCF or v65(l_LocalPlayer_0.Character).CFrame;
                task.spawn(v8.loop);
            else
                if v8.origCF then
                    l_LocalPlayer_0.Character:PivotTo(v8.origCF);
                    chloex("Auto Event Off");
                end;
                local l_v8_4 = v8;
                local l_v8_5 = v8;
                local v367 = nil;
                l_v8_5.curCF = nil;
                l_v8_4.origCF = v367;
            end;
        end
    });
    getGroupedByType = function(v368) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v7 (ref), v5 (ref)
        local l_Expect_0 = v7.Data:GetExpect({
            "Inventory", 
            "Items"
        });
        local v370 = {};
        local v371 = {};
        for _, v373 in ipairs(l_Expect_0) do
            local v374 = v5.ItemUtility.GetItemDataFromItemType("Items", v373.Id);
            if v374 and v374.Data.Type == v368 then
                local l_Name_2 = v374.Data.Name;
                v370[l_Name_2] = v370[l_Name_2] or {
                    count = 0, 
                    uuids = {}
                };
                v370[l_Name_2].count = v370[l_Name_2].count + (v373.Quantity or 1);
                table.insert(v370[l_Name_2].uuids, v373.UUID);
            end;
        end;
        for v376, v377 in pairs(v370) do
            table.insert(v371, ("%s x%d"):format(v376, v377.count));
        end;
        return v370, v371;
    end;
    local v378 = v130.Trade:AddSection("Trading Fish Features");
    local v379 = v130.Trade:AddSection("Trading Coin Features");
    local v380 = v378:AddParagraph({
        Title = "Panel Name Trading", 
        Content = "\r\nPlayer : ???\r\nItem   : ???\r\nAmount : 0\r\nStatus : Idle\r\nSuccess: 0 / 0\r\n"
    });
    local v381 = v379:AddParagraph({
        Title = "Panel Coin Trading", 
        Content = "\r\nPlayer   : ???\r\nTarget   : 0\r\nProgress : 0 / 0\r\nStatus   : Idle\r\nResult   : Success : 0 | Received : 0\r\n"
    });
    _G.safeSetContent = function(v382, v383) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v0 (ref)
        v0.RunService.Heartbeat:Once(function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v382 (ref), v383 (ref)
            if v382 then
                v382:SetContent(v383);
            end;
        end);
    end;
    local function v388(v384) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v380 (ref)
        local l_trade_0 = v8.trade;
        local v386 = "200,200,200";
        if v384 and v384:lower():find("send") then
            v386 = "51,153,255";
        elseif v384 and v384:lower():find("complete") then
            v386 = "0,204,102";
        elseif v384 and v384:lower():find("time") then
            v386 = "255,69,0";
        end;
        local v387 = string.format("\r\n<font color='rgb(173,216,230)'>Player : %s</font>\r\n<font color='rgb(173,216,230)'>Item   : %s</font>\r\n<font color='rgb(173,216,230)'>Amount : %d</font>\r\n<font color='rgb(%s)'>Status : %s</font>\r\n<font color='rgb(173,216,230)'>Success: %d / %d</font>\r\n", l_trade_0.selectedPlayer or "???", l_trade_0.selectedItem or "???", l_trade_0.tradeAmount or 0, v386, v384 or "Idle", l_trade_0.successCount or 0, l_trade_0.totalToTrade or 0);
        _G.safeSetContent(v380, v387);
    end;
    local function v393(v389) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v381 (ref)
        local l_trade_1 = v8.trade;
        local v391 = "200,200,200";
        if v389 and v389:lower():find("send") then
            v391 = "51,153,255";
        elseif v389 and v389:lower():find("progress") then
            v391 = "255,215,0";
        elseif v389 and v389:lower():find("complete") then
            v391 = "0,204,102";
        elseif v389 and v389:lower():find("time") then
            v391 = "255,69,0";
        end;
        local v392 = string.format("\r\n<font color='rgb(173,216,230)'>Player   : %s</font>\r\n<font color='rgb(173,216,230)'>Target   : %d</font>\r\n<font color='rgb(173,216,230)'>Progress : %d / %d</font>\r\n<font color='rgb(%s)'>Status   : %s</font>\r\n<font color='rgb(173,216,230)'>Result   : Success : %d | Received : %d</font>\r\n", l_trade_1.selectedPlayer or "???", l_trade_1.targetCoins or 0, l_trade_1.successCoins or 0, l_trade_1.targetCoins or 0, v391, v389 or "Idle", l_trade_1.successCoins or 0, l_trade_1.totalReceived or 0);
        _G.safeSetContent(v381, v392);
    end;
    local function v397(v394) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v7 (ref)
        for _, v396 in ipairs(v7.Data:GetExpect({
            "Inventory", 
            "Items"
        })) do
            if v396.UUID == v394 then
                return true;
            end;
        end;
        return false;
    end;
    local function v405(v398, v399, v400, v401) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v0 (ref), v388 (ref), v393 (ref), v6 (ref), v397 (ref)
        local l_trade_2 = v8.trade;
        local v403 = true;
        l_trade_2.lastResult = nil;
        l_trade_2.awaiting = v403;
        v403 = v0.Players:FindFirstChild(v398);
        if not v403 then
            l_trade_2.trading = false;
            v388("<font color='#ff3333'>Player not found</font>");
            v393("<font color='#ff3333'>Player not found</font>");
            return false;
        else
            if v400 then
                v388("Sending");
                chloex("Sending " .. v400);
            else
                v393("Sending");
                chloex("Sending fish for coins");
            end;
            if not pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v6 (ref), v403 (ref), v399 (ref)
                v6.Functions.Trade:InvokeServer(v403.UserId, v399);
            end) then
                return false;
            else
                local v404 = tick();
                while true do
                    if l_trade_2.trading then
                        if not v397(v399) then
                            if v400 then
                                l_trade_2.successCount = l_trade_2.successCount + 1;
                                v388("Completed");
                            else
                                l_trade_2.successCoins = l_trade_2.successCoins + (v401 or 0);
                                l_trade_2.totalReceived = l_trade_2.successCoins;
                                v393("Progress");
                            end;
                            task.wait(1);
                            return true;
                        elseif tick() - v404 > 10 then
                            return false;
                        else
                            task.wait(0.2);
                        end;
                    else
                        return false;
                    end;
                end;
            end;
        end;
    end;
    local function v412(v406, v407, v408, v409) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v405 (ref)
        local l_trade_3 = v8.trade;
        local v411 = tick();
        while true do
            if v405(v406, v407, v408, v409) then
                task.wait(2.5);
                return true;
            else
                task.wait(1);
                if tick() - v411 >= 3 or not l_trade_3.trading then
                    return false;
                end;
            end;
        end;
    end;
    startTradeByName = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v388 (ref), v412 (ref)
        local l_trade_4 = v8.trade;
        if l_trade_4.trading then
            return;
        elseif not l_trade_4.selectedPlayer or not l_trade_4.selectedItem then
            return chloex("Select player & item first!");
        else
            l_trade_4.trading = true;
            l_trade_4.successCount = 0;
            chloex("Starting trade with " .. l_trade_4.selectedPlayer);
            local v414 = l_trade_4.currentGrouped[l_trade_4.selectedItem];
            if not v414 then
                l_trade_4.trading = false;
                v388("<font color='#ff3333'>Item not found</font>");
                return chloex("Item not found");
            else
                l_trade_4.totalToTrade = math.min(l_trade_4.tradeAmount, #v414.uuids);
                local v415 = 1;
                while l_trade_4.trading and l_trade_4.successCount < l_trade_4.totalToTrade do
                    v412(l_trade_4.selectedPlayer, v414.uuids[v415], l_trade_4.selectedItem);
                    v415 = v415 + 1;
                    if #v414.uuids < v415 then
                        v415 = 1;
                    end;
                    task.wait(2);
                end;
                l_trade_4.trading = false;
                v388("<font color='#66ccff'>All trades finished</font>");
                chloex("All trades finished");
                return;
            end;
        end;
    end;
    chooseFishesByRange = function(v416, v417) --[[ Line: 0 ]] --[[ Name:  ]]
        table.sort(v416, function(v418, v419) --[[ Line: 0 ]] --[[ Name:  ]]
            return v418.Price > v419.Price;
        end);
        local v420 = {};
        local v421 = 0;
        for _, v423 in ipairs(v416) do
            if v421 + v423.Price <= v417 then
                table.insert(v420, v423);
                v421 = v421 + v423.Price;
            end;
            if v417 <= v421 then
                break;
            end;
        end;
        if v421 < v417 and #v416 > 0 then
            table.insert(v420, v416[#v416]);
        end;
        return v420, v421;
    end;
    startTradeByCoin = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v393 (ref), v0 (ref), v5 (ref), v7 (ref), v412 (ref)
        local l_trade_5 = v8.trade;
        if l_trade_5.trading then
            return;
        elseif not l_trade_5.selectedPlayer or l_trade_5.targetCoins <= 0 then
            return chloex("\226\154\160 Select player & coin target first!");
        else
            l_trade_5.trading = true;
            local v425 = 0;
            local v426 = 0;
            l_trade_5.totalReceived = 0;
            l_trade_5.successCoins = v426;
            l_trade_5.sentCoins = v425;
            v393("<font color='#ffaa00'>Starting...</font>");
            chloex("Starting coin trade with " .. l_trade_5.selectedPlayer);
            v425 = v0.Players.LocalPlayer;
            v426 = v5.PlayerStatsUtility:GetPlayerModifiers(v425);
            local v427 = {};
            local l_Expect_1 = v7.Data:GetExpect({
                "Inventory", 
                "Items"
            });
            for _, v430 in ipairs(l_Expect_1) do
                local l_ItemData_4 = v5.ItemUtility:GetItemData(v430.Id);
                if l_ItemData_4 and l_ItemData_4.Data and l_ItemData_4.Data.Type == "Fishes" and not v430.Favorited then
                    local v432 = v5.VendorUtility:GetSellPrice(v430) or l_ItemData_4.SellPrice or 0;
                    local v433 = math.ceil(v432 * (v426 and v426.CoinMultiplier or 1));
                    if v433 > 0 then
                        table.insert(v427, {
                            UUID = v430.UUID, 
                            Name = l_ItemData_4.Data.Name or "Unknown", 
                            Price = v433
                        });
                    end;
                end;
            end;
            if #v427 == 0 then
                l_trade_5.trading = false;
                v393("<font color='#ff3333'>No fishes found</font>");
                chloex("\226\154\160 No fishes found in inventory");
                return;
            else
                local v434, v435 = chooseFishesByRange(v427, l_trade_5.targetCoins);
                if #v434 == 0 then
                    l_trade_5.trading = false;
                    v393("<font color='#ff3333'>No valid fishes for target</font>");
                    return;
                else
                    l_trade_5.totalToTrade = #v434;
                    l_trade_5.targetCoins = v435;
                    if not v0.Players:FindFirstChild(l_trade_5.selectedPlayer) then
                        l_trade_5.trading = false;
                        v393("<font color='#ff3333'>Player not found</font>");
                        return;
                    else
                        for _, v437 in ipairs(v434) do
                            if l_trade_5.trading then
                                l_trade_5.sentCoins = l_trade_5.sentCoins + v437.Price;
                                v393(string.format("<font color='#ffaa00'>Progress : %d / %d</font>", l_trade_5.sentCoins, l_trade_5.targetCoins));
                                v412(l_trade_5.selectedPlayer, v437.UUID, nil, v437.Price);
                                l_trade_5.successCoins = l_trade_5.sentCoins;
                                task.wait(2);
                            else
                                break;
                            end;
                        end;
                        l_trade_5.trading = false;
                        v393(string.format("<font color='#66ccff'>Coin trade finished (Target: %d, Received: %d)</font>", l_trade_5.targetCoins, l_trade_5.successCoins));
                        chloex(string.format("Coin trade finished (Target: %d, Received: %d)", l_trade_5.targetCoins, l_trade_5.successCoins));
                        return;
                    end;
                end;
            end;
        end;
    end;
    local v439 = v378:AddDropdown({
        Options = {}, 
        Multi = false, 
        Title = "Select Item", 
        Callback = function(v438) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v388 (ref)
            v8.trade.selectedItem = v438 and (v438:match("^(.-) x") or v438);
            v388();
        end
    });
    v378:AddButton({
        Title = "Refresh Fish", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v439 (ref)
            local v440, v441 = getGroupedByType("Fishes");
            v8.trade.currentGrouped = v440;
            v439:SetValues(v441 or {});
        end, 
        SubTitle = "Refresh Stone", 
        SubCallback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v439 (ref)
            local v442, v443 = getGroupedByType("EnchantStones");
            v8.trade.currentGrouped = v442;
            v439:SetValues(v443 or {});
        end
    });
    v378:AddInput({
        Title = "Amount to Trade", 
        Default = "1", 
        Callback = function(v444) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v388 (ref)
            v8.trade.tradeAmount = tonumber(v444) or 1;
            v388();
        end
    });
    local v446 = v378:AddDropdown({
        Options = {}, 
        Multi = false, 
        Title = "Select Player", 
        Callback = function(v445) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v388 (ref)
            v8.trade.selectedPlayer = v445;
            v388();
        end
    });
    v378:AddButton({
        Title = "Refresh Player", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v0 (ref), v8 (ref), v446 (ref)
            local v447 = {};
            for _, v449 in ipairs(v0.Players:GetPlayers()) do
                if v449 ~= v8.player then
                    table.insert(v447, v449.Name);
                end;
            end;
            v446:SetValues(v447 or {});
        end
    });
    v378:AddToggle({
        Title = "Start By Name", 
        Default = false, 
        Callback = function(v450) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v388 (ref)
            if v450 then
                task.spawn(startTradeByName);
            else
                v8.trade.trading = false;
                v388();
            end;
        end
    });
    local v452 = v379:AddDropdown({
        Options = {}, 
        Multi = false, 
        Title = "Select Player", 
        Callback = function(v451) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v393 (ref)
            v8.trade.selectedPlayer = v451;
            v393();
        end
    });
    v379:AddButton({
        Title = "Refresh Player", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v0 (ref), v8 (ref), v452 (ref)
            local v453 = {};
            for _, v455 in ipairs(v0.Players:GetPlayers()) do
                if v455 ~= v8.player then
                    table.insert(v453, v455.Name);
                end;
            end;
            v452:SetValues(v453 or {});
        end
    });
    v379:AddInput({
        Title = "Target Coin", 
        Default = "0", 
        Callback = function(v456) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v393 (ref)
            v8.trade.targetCoins = tonumber(v456) or 0;
            v393();
        end
    });
    v379:AddToggle({
        Title = "Start By Coin", 
        Default = false, 
        Callback = function(v457) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            if v457 then
                task.spawn(startTradeByCoin);
            else
                v8.trade.trading = false;
            end;
        end
    });
    TradeByRarity = v130.Trade:AddSection("Trading Rarity Features");
    Rarity_Monitor = TradeByRarity:AddParagraph({
        Title = "Panel Rarity Trading", 
        Content = "\r\nPlayer  : ???\r\nRarity  : ???\r\nCount   : 0\r\nStatus  : Idle\r\nSuccess : 0 / 0\r\n"
    });
    local function v462(v458) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref)
        local l_trade_6 = v8.trade;
        local v460 = "200,200,200";
        if v458 and v458:lower():find("send") then
            v460 = "51,153,255";
        elseif v458 and v458:lower():find("complete") then
            v460 = "0,204,102";
        elseif v458 and v458:lower():find("time") then
            v460 = "255,69,0";
        end;
        local v461 = string.format("\r\n<font color='rgb(173,216,230)'>Player  : %s</font>\r\n<font color='rgb(173,216,230)'>Rarity  : %s</font>\r\n<font color='rgb(173,216,230)'>Count   : %d</font>\r\n<font color='rgb(%s)'>Status  : %s</font>\r\n<font color='rgb(173,216,230)'>Success : %d / %d</font>\r\n", l_trade_6.selectedPlayer or "???", l_trade_6.selectedRarity or "???", l_trade_6.totalToTrade or 0, v460, v458 or "Idle", l_trade_6.successCount or 0, l_trade_6.totalToTrade or 0);
        _G.safeSetContent(Rarity_Monitor, v461);
    end;
    TradeByRarity:AddDropdown({
        Options = {
            "Common", 
            "Uncommon", 
            "Rare", 
            "Epic", 
            "Legendary", 
            "Mythic", 
            "Secret"
        }, 
        Multi = false, 
        Title = "Select Rarity", 
        Callback = function(v463) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v462 (ref)
            v8.trade.selectedRarity = v463;
            v462("Selected rarity: " .. (v463 or "???"));
        end
    });
    rarityPlayerDropdown = TradeByRarity:AddDropdown({
        Options = {}, 
        Multi = false, 
        Title = "Select Player", 
        Callback = function(v464) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v462 (ref)
            v8.trade.selectedPlayer = v464;
            v462();
        end
    });
    TradeByRarity:AddButton({
        Title = "Refresh Player", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v0 (ref), v8 (ref)
            local v465 = {};
            for _, v467 in ipairs(v0.Players:GetPlayers()) do
                if v467 ~= v8.player then
                    table.insert(v465, v467.Name);
                end;
            end;
            rarityPlayerDropdown:SetValues(v465 or {});
        end
    });
    TradeByRarity:AddInput({
        Title = "Amount to Trade", 
        Default = "1", 
        Callback = function(v468) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v462 (ref)
            v8.trade.rarityAmount = tonumber(v468) or 1;
            v462("Set amount: " .. tostring(v8.trade.rarityAmount));
        end
    });
    startTradeByRarity = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v8 (ref), v462 (ref), v7 (ref), v5 (ref), v412 (ref)
        local l_trade_7 = v8.trade;
        if l_trade_7.trading then
            return;
        elseif not l_trade_7.selectedPlayer or not l_trade_7.selectedRarity then
            return chloex("\226\154\160 Select player & rarity first!");
        else
            l_trade_7.trading = true;
            l_trade_7.successCount = 0;
            chloex("Starting rarity trade (" .. l_trade_7.selectedRarity .. ") with " .. l_trade_7.selectedPlayer);
            v462("<font color='#ffaa00'>Scanning " .. l_trade_7.selectedRarity .. " fishes...</font>");
            local v470 = {};
            for _, v472 in ipairs(v7.Data:GetExpect({
                "Inventory", 
                "Items"
            })) do
                local v473 = v5.ItemUtility.GetItemDataFromItemType("Items", v472.Id);
                if v473 and v473.Data.Type == "Fishes" and _G.TierFish[v473.Data.Tier] == l_trade_7.selectedRarity then
                    table.insert(v470, {
                        UUID = v472.UUID, 
                        Name = v473.Data.Name
                    });
                end;
            end;
            if #v470 == 0 then
                l_trade_7.trading = false;
                v462("<font color='#ff3333'>No " .. l_trade_7.selectedRarity .. " fishes found</font>");
                return chloex("No " .. l_trade_7.selectedRarity .. " fishes found");
            else
                l_trade_7.totalToTrade = math.min(#v470, l_trade_7.rarityAmount or #v470);
                v462(string.format("Sending %d %s fishes...", l_trade_7.totalToTrade, l_trade_7.selectedRarity));
                local v474 = 1;
                while l_trade_7.trading and v474 <= l_trade_7.totalToTrade do
                    local v475 = v470[v474];
                    if v412(l_trade_7.selectedPlayer, v475.UUID, v475.Name) then
                        l_trade_7.successCount = l_trade_7.successCount + 1;
                        v462(string.format("Progress: %d / %d (%s)", l_trade_7.successCount, l_trade_7.totalToTrade, l_trade_7.selectedRarity));
                    end;
                    v474 = v474 + 1;
                    task.wait(2.5);
                end;
                l_trade_7.trading = false;
                v462("<font color='#66ccff'>Rarity trade finished</font>");
                chloex("Rarity trade finished (" .. l_trade_7.selectedRarity .. ")");
                return;
            end;
        end;
    end;
    TradeByRarity:AddToggle({
        Title = "Start By Rarity", 
        Default = false, 
        Callback = function(v476) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v462 (ref)
            if v476 then
                task.spawn(startTradeByRarity);
            else
                v8.trade.trading = false;
                v462("Idle");
            end;
        end
    });
    AcceptTrade = v130.Trade:AddSection("Auto Accept Features");
    AcceptTrade:AddToggle({
        Title = "Auto Accept Trade", 
        Default = _G.AutoAccept, 
        Callback = function(v477) --[[ Line: 0 ]] --[[ Name:  ]]
            _G.AutoAccept = v477;
        end
    });
    spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
        while true do
            task.wait(1);
            if _G.AutoAccept then
                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    local l_Prompt_0 = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Prompt");
                    if l_Prompt_0 and l_Prompt_0:FindFirstChild("Blackout") then
                        local l_Blackout_0 = l_Prompt_0.Blackout;
                        if l_Blackout_0:FindFirstChild("Options") then
                            local l_Yes_0 = l_Blackout_0.Options:FindFirstChild("Yes");
                            if l_Yes_0 then
                                local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
                                local l_AbsolutePosition_0 = l_Yes_0.AbsolutePosition;
                                local l_AbsoluteSize_0 = l_Yes_0.AbsoluteSize;
                                local v484 = l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2;
                                local v485 = l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y / 2 + 50;
                                l_VirtualInputManager_0:SendMouseButtonEvent(v484, v485, 0, true, game, 1);
                                task.wait(0.03);
                                l_VirtualInputManager_0:SendMouseButtonEvent(v484, v485, 0, false, game, 1);
                            end;
                        end;
                    end;
                end);
            end;
        end;
    end);
    local v486 = v130.Quest:AddSection("Artifact Lever Location");
    local v487 = workspace:WaitForChild("JUNGLE INTERACTIONS");
    local v488 = 1;
    local v489 = false;
    local v490 = nil;
    local v491 = "0,255,0";
    local v492 = "255,0,0";
    _G.artifactPositions = {
        ["Arrow Artifact"] = CFrame.new(875, 3, -368) * CFrame.Angles(0, math.rad(90), 0), 
        ["Crescent Artifact"] = CFrame.new(1403, 3, 123) * CFrame.Angles(0, math.rad(180), 0), 
        ["Hourglass Diamond Artifact"] = CFrame.new(1487, 3, -842) * CFrame.Angles(0, math.rad(180), 0), 
        ["Diamond Artifact"] = CFrame.new(1844, 3, -287) * CFrame.Angles(0, math.rad(-90), 0)
    };
    local v493 = {
        "Arrow Artifact", 
        "Crescent Artifact", 
        "Hourglass Diamond Artifact", 
        "Diamond Artifact"
    };
    local function v497() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v487 (ref)
        local v494 = {};
        for _, v496 in ipairs(v487:GetDescendants()) do
            if v496:IsA("Model") and v496.Name == "TempleLever" then
                v494[v496:GetAttribute("Type")] = not v496:FindFirstChild("RootPart") or not v496.RootPart:FindFirstChildWhichIsA("ProximityPrompt");
            end;
        end;
        return v494;
    end;
    local function v502(v498) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v491 (ref), v492 (ref)
        local function v501(v499, v500) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v491 (ref), v492 (ref)
            return ("%s : <b><font color=\"rgb(%s)\">%s</font></b>"):format(v499 == "Hourglass Diamond Artifact" and "Hourglass Diamond" or v499 == "Arrow Artifact" and "Arrow" or v499 == "Crescent Artifact" and "Crescent" or "Diamond", v500 and v491 or v492, v500 and "ACTIVE" or "DISABLE");
        end;
        ArtifactParagraph:SetContent(table.concat({
            v501("Arrow Artifact", v498["Arrow Artifact"]), 
            v501("Crescent Artifact", v498["Crescent Artifact"]), 
            v501("Hourglass Diamond Artifact", v498["Hourglass Diamond Artifact"]), 
            v501("Diamond Artifact", v498["Diamond Artifact"])
        }, "\n"));
    end;
    local function v507(v503) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v487 (ref)
        for _, v505 in ipairs(v487:GetDescendants()) do
            if v505:IsA("Model") and v505.Name == "TempleLever" and v505:GetAttribute("Type") == v503 then
                local v506 = v505:FindFirstChild("RootPart") and v505.RootPart:FindFirstChildWhichIsA("ProximityPrompt");
                if v506 then
                    fireproximityprompt(v506);
                    break;
                else
                    break;
                end;
            end;
        end;
    end;
    ArtifactParagraph = v486:AddParagraph({
        Title = "Panel Progress Artifact", 
        Content = "\r\nArrow : <b><font color=\"rgb(255,0,0)\">DISABLE</font></b>\r\nCrescent : <b><font color=\"rgb(255,0,0)\">DISABLE</font></b>\r\nHourglass Diamond : <b><font color=\"rgb(255,0,0)\">DISABLE</font></b>\r\nDiamond : <b><font color=\"rgb(255,0,0)\">DISABLE</font></b>\r\n"
    });
    v6.Events.REFishGot.OnClientEvent:Connect(function(v508) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v489 (ref), v490 (ref), v507 (ref)
        if not v489 or not v490 then
            return;
        else
            local v509 = string.split(v490, " ")[1];
            if v509 and string.find(v508, v509, 1, true) then
                task.wait(0.5);
                v507(v490);
                v490 = nil;
            end;
            return;
        end;
    end);
    v486:AddToggle({
        Title = "Artifact Progress", 
        Default = false, 
        Callback = function(v510) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v489 (ref), v497 (ref), v502 (ref), v493 (ref), v490 (ref), l_LocalPlayer_0 (ref), v488 (ref)
            v489 = v510;
            if v510 then
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v489 (ref), v497 (ref), v502 (ref), v493 (ref), v490 (ref), l_LocalPlayer_0 (ref), v488 (ref)
                    while v489 do
                        local v511 = v497();
                        local v512 = true;
                        for _, v514 in pairs(v511) do
                            if not v514 then
                                v512 = false;
                                break;
                            end;
                        end;
                        v502(v511);
                        if v512 then
                            v489 = false;
                            break;
                        else
                            for _, v516 in ipairs(v493) do
                                if not v511[v516] then
                                    v490 = v516;
                                    local l_HumanoidRootPart_3 = (l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart");
                                    if l_HumanoidRootPart_3 and _G.artifactPositions[v516] then
                                        l_HumanoidRootPart_3.CFrame = _G.artifactPositions[v516];
                                    end;
                                    task.wait(v488);
                                    if not v490 or not v489 then
                                        break;
                                    end;
                                end;
                            end;
                            task.wait(v488);
                        end;
                    end;
                end);
            end;
        end
    });
    task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v488 (ref), v502 (ref), v497 (ref)
        while task.wait(v488) do
            v502(v497());
        end;
    end);
    v486:AddButton({
        Title = "Arrow", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local l_HumanoidRootPart_4 = (v8.player.Character or v8.player.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_4 then
                l_HumanoidRootPart_4.CFrame = _G.artifactPositions["Arrow Artifact"];
            end;
        end, 
        SubTitle = "Hourglass Diamond", 
        SubCallback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local l_HumanoidRootPart_5 = (v8.player.Character or v8.player.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_5 then
                l_HumanoidRootPart_5.CFrame = _G.artifactPositions["Hourglass Diamond Artifact"];
            end;
        end
    });
    v486:AddButton({
        Title = "Crescent", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local l_HumanoidRootPart_6 = (v8.player.Character or v8.player.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_6 then
                l_HumanoidRootPart_6.CFrame = _G.artifactPositions["Crescent Artifact"];
            end;
        end, 
        SubTitle = "Diamond", 
        SubCallback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local l_HumanoidRootPart_7 = (v8.player.Character or v8.player.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_7 then
                l_HumanoidRootPart_7.CFrame = _G.artifactPositions["Diamond Artifact"];
            end;
        end
    });
    local v522 = v130.Quest:AddSection("Sisyphus Statue Quest");
    local v523 = v522:AddParagraph({
        Title = "Deep Sea Panel", 
        Content = ""
    });
    v522:AddDivider();
    v522:AddToggle({
        Title = "Auto Deep Sea Quest", 
        Content = "Automatically complete Deep Sea Quest!", 
        Default = false, 
        Callback = function(v524) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.autoDeepSea = v524;
            task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v8 (ref)
                while v8.autoDeepSea do
                    local l_workspace_FirstChild_2 = workspace:FindFirstChild("!!! MENU RINGS");
                    local v526 = l_workspace_FirstChild_2 and l_workspace_FirstChild_2:FindFirstChild("Deep Sea Tracker");
                    if v526 then
                        local v527 = v526:FindFirstChild("Board") and v526.Board:FindFirstChild("Gui") and v526.Board.Gui:FindFirstChild("Content");
                        if v527 then
                            local v528 = nil;
                            for _, v530 in ipairs(v527:GetChildren()) do
                                if v530:IsA("TextLabel") and v530.Name ~= "Header" then
                                    v528 = v530;
                                    break;
                                end;
                            end;
                            if v528 then
                                local v531 = string.lower(v528.Text);
                                local v532 = v8.player.Character and v8.player.Character:FindFirstChild("HumanoidRootPart");
                                if v532 then
                                    if string.find(v531, "100%%") then
                                        v532.CFrame = CFrame.new(-3763, -135, -995) * CFrame.Angles(0, math.rad(180), 0);
                                    else
                                        v532.CFrame = CFrame.new(-3599, -276, -1641);
                                    end;
                                end;
                            end;
                        end;
                    end;
                    task.wait(1);
                end;
            end);
        end
    });
    v522:AddButton({
        Title = "Treasure Room", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local l_HumanoidRootPart_8 = (v8.player.Character or v8.player.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_8 then
                l_HumanoidRootPart_8.CFrame = CFrame.new(-3601, -283, -1611);
            end;
        end, 
        SubTitle = "Sisyphus Statue", 
        SubCallback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local l_HumanoidRootPart_9 = (v8.player.Character or v8.player.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_9 then
                l_HumanoidRootPart_9.CFrame = CFrame.new(-3698, -135, -1008);
            end;
        end
    });
    local v535 = v130.Quest:AddSection("Element Quest");
    local v536 = v535:AddParagraph({
        Title = "Element Panel", 
        Content = ""
    });
    v535:AddDivider();
    v535:AddToggle({
        Title = "Auto Element Quest", 
        Content = "Automatically teleport through Element quest stages.", 
        Default = false, 
        Callback = function(v537) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v536 (ref)
            v8.autoElement = v537;
            task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v8 (ref), v536 (ref)
                local v538 = false;
                while v8.autoElement and not v538 do
                    local l_workspace_FirstChild_3 = workspace:FindFirstChild("!!! MENU RINGS");
                    local v540 = l_workspace_FirstChild_3 and l_workspace_FirstChild_3:FindFirstChild("Element Tracker");
                    if v540 then
                        local v541 = v540:FindFirstChild("Board") and v540.Board:FindFirstChild("Gui") and v540.Board.Gui:FindFirstChild("Content");
                        if v541 then
                            local v542 = {};
                            for _, v544 in ipairs(v541:GetChildren()) do
                                if v544:IsA("TextLabel") and v544.Name ~= "Header" then
                                    table.insert(v542, string.lower(v544.Text));
                                end;
                            end;
                            local v545 = v8.player.Character and v8.player.Character:FindFirstChild("HumanoidRootPart");
                            if v545 and #v542 >= 4 then
                                local v546 = v542[2];
                                local v547 = v542[4];
                                if not string.find(v547, "100%%") then
                                    v545.CFrame = CFrame.new(1484, 3, -336) * CFrame.Angles(0, math.rad(180), 0);
                                elseif string.find(v547, "100%%") and not string.find(v546, "100%%") then
                                    v545.CFrame = CFrame.new(1453, -22, -636);
                                elseif string.find(v546, "100%%") then
                                    v545.CFrame = CFrame.new(1480, 128, -593);
                                    v538 = true;
                                    v8.autoElement = false;
                                    if v536 and v536.SetContent then
                                        v536:SetContent("Element Quest Completed!");
                                    end;
                                end;
                            end;
                        end;
                    end;
                    task.wait(2);
                end;
            end);
        end
    });
    v535:AddButton({
        Title = "Secred Temple", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local l_HumanoidRootPart_10 = (v8.player.Character or v8.player.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_10 then
                l_HumanoidRootPart_10.CFrame = CFrame.new(1453, -22, -636);
            end;
        end, 
        SubTitle = "Underground Cellar", 
        SubCallback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local l_HumanoidRootPart_11 = (v8.player.Character or v8.player.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_11 then
                l_HumanoidRootPart_11.CFrame = CFrame.new(2136, -91, -701);
            end;
        end
    });
    v535:AddButton({
        Title = "Transcended Stones", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            local l_HumanoidRootPart_12 = (v8.player.Character or v8.player.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_12 then
                l_HumanoidRootPart_12.CFrame = CFrame.new(1480, 128, -593);
            end;
        end
    });
    local function v558(v551) --[[ Line: 0 ]] --[[ Name:  ]]
        local l_FirstChild_0 = workspace["!!! MENU RINGS"]:FindFirstChild(v551);
        if not l_FirstChild_0 then
            return "";
        else
            local v553 = l_FirstChild_0:FindFirstChild("Board") and l_FirstChild_0.Board:FindFirstChild("Gui") and l_FirstChild_0.Board.Gui:FindFirstChild("Content");
            if not v553 then
                return "";
            else
                local v554 = {};
                local v555 = 1;
                for _, v557 in ipairs(v553:GetChildren()) do
                    if v557:IsA("TextLabel") and v557.Name ~= "Header" then
                        table.insert(v554, v555 .. ". " .. v557.Text);
                        v555 = v555 + 1;
                    end;
                end;
                return table.concat(v554, "\n");
            end;
        end;
    end;
    task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v536 (ref), v558 (ref), v523 (ref)
        while task.wait(2) do
            v536:SetContent(v558("Element Tracker"));
            v523:SetContent(v558("Deep Sea Tracker"));
        end;
    end);
    QuestSec = v130.Quest:AddSection("Auto Progress Quest Features");
    QuestProgress = QuestSec:AddParagraph({
        Title = "Progress Quest Panel", 
        Content = "Waiting for start..."
    });
    QuestSec:AddToggle({
        Title = "Auto Teleport Quest", 
        Default = false, 
        Callback = function(v559) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), l_LocalPlayer_0 (ref), v497 (ref)
            v8.autoQuestFlow = v559;
            task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v8 (ref), l_LocalPlayer_0 (ref), v497 (ref)
                local v560 = false;
                local v561 = false;
                local v562 = false;
                local v563 = {
                    Deep = false, 
                    Lever = false, 
                    Element = false
                };
                updateParagraph = function(v564) --[[ Line: 0 ]] --[[ Name:  ]]
                    if QuestProgress and QuestProgress.SetContent then
                        QuestProgress:SetContent(v564);
                    end;
                end;
                while v8.autoQuestFlow and (not v560 or not v561 or not v562) do
                    if not v560 then
                        local l_workspace_FirstChild_4 = workspace:FindFirstChild("!!! MENU RINGS");
                        local v566 = l_workspace_FirstChild_4 and l_workspace_FirstChild_4:FindFirstChild("Deep Sea Tracker");
                        local v567 = v566 and v566:FindFirstChild("Board") and v566.Board:FindFirstChild("Gui") and v566.Board.Gui:FindFirstChild("Content");
                        local v568 = true;
                        local v569 = 0;
                        local v570 = 0;
                        if v567 then
                            for _, v572 in ipairs(v567:GetChildren()) do
                                if v572:IsA("TextLabel") and v572.Name ~= "Header" then
                                    v570 = v570 + 1;
                                    if string.find(v572.Text, "100%%") then
                                        v569 = v569 + 1;
                                    else
                                        v568 = false;
                                    end;
                                end;
                            end;
                        end;
                        local v573 = v570 > 0 and math.floor(v569 / v570 * 100) or 0;
                        updateParagraph(string.format("Doing objective on Deep Sea Quest...\nProgress now %d%%.", v573));
                        if not v568 and not v563.Deep then
                            local v574 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
                            if v574 then
                                v574.CFrame = CFrame.new(-3599, -276, -1641);
                                v563.Deep = true;
                            end;
                        elseif v568 then
                            v560 = true;
                            updateParagraph("Deep Sea Quest Completed!\nProceeding to Artifact Lever...");
                        end;
                        task.wait(1);
                    end;
                    if v560 and not v561 and v8.autoQuestFlow then
                        local _ = workspace:FindFirstChild("JUNGLE INTERACTIONS");
                        local v576 = v497();
                        local v577 = true;
                        for _, v579 in pairs(v576) do
                            if not v579 then
                                v577 = false;
                                break;
                            end;
                        end;
                        if not v577 and not v563.Lever then
                            local v580 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
                            if v580 and _G.artifactPositions["Arrow Artifact"] then
                                v580.CFrame = _G.artifactPositions["Arrow Artifact"];
                                v563.Lever = true;
                            end;
                            updateParagraph("Doing objective on Artifact Lever...\nProgress now 75%.");
                        elseif v577 then
                            v561 = true;
                            updateParagraph("Artifact Lever Completed!\nProceeding to Element Quest...");
                        end;
                        task.wait(1);
                    end;
                    if v560 and v561 and not v562 and v8.autoQuestFlow then
                        local l_workspace_FirstChild_6 = workspace:FindFirstChild("!!! MENU RINGS");
                        local v582 = l_workspace_FirstChild_6 and l_workspace_FirstChild_6:FindFirstChild("Element Tracker");
                        local v583 = v582 and v582:FindFirstChild("Board") and v582.Board:FindFirstChild("Gui") and v582.Board.Gui:FindFirstChild("Content");
                        if v583 then
                            local v584 = {};
                            for _, v586 in ipairs(v583:GetChildren()) do
                                if v586:IsA("TextLabel") and v586.Name ~= "Header" then
                                    table.insert(v584, v586.Text);
                                end;
                            end;
                            local v587 = v584[2] and string.lower(v584[2]) or "";
                            local v588 = v584[4] and string.lower(v584[4]) or "";
                            local v589 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
                            if not string.find(v587, "100%%") or not string.find(v588, "100%%") then
                                if not v563.Element and v589 then
                                    v589.CFrame = CFrame.new(1484, 3, -336) * CFrame.Angles(0, math.rad(180), 0);
                                    v563.Element = true;
                                end;
                                if not string.find(v588, "100%%") then
                                    updateParagraph("Doing objective on Element Quest...\nProgress now 50%.");
                                elseif string.find(v588, "100%%") and not string.find(v587, "100%%") then
                                    v589.CFrame = CFrame.new(1453, -22, -636);
                                    updateParagraph("Doing objective on Element Quest...\nProgress now 75%.");
                                end;
                            else
                                v562 = true;
                                updateParagraph("All Quest Completed Successfully! :3");
                                v8.autoQuestFlow = false;
                            end;
                        end;
                        task.wait(1);
                    end;
                end;
            end);
        end
    });
    local v590 = v130.Tele:AddSection("Teleport To Player");
    local v592 = v590:AddDropdown({
        Title = "Select Player to Teleport", 
        Content = "Choose target player", 
        Options = v121(), 
        Default = {}, 
        Callback = function(v591) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.trade.teleportTarget = v591;
        end
    });
    v590:AddButton({
        Title = "Refresh Player List", 
        Content = "Refresh list!", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v592 (ref), v121 (ref)
            v592:SetValues(v121());
            chloex("Player list refreshed!");
        end
    });
    v590:AddButton({
        Title = "Teleport to Player", 
        Content = "Teleport to selected player from dropdown", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v0 (ref), l_LocalPlayer_0 (ref)
            local l_teleportTarget_0 = v8.trade.teleportTarget;
            if not l_teleportTarget_0 then
                chloex("Please select a player first!");
                return;
            else
                local l_FirstChild_1 = v0.Players:FindFirstChild(l_teleportTarget_0);
                if l_FirstChild_1 and l_FirstChild_1.Character and l_FirstChild_1.Character:FindFirstChild("HumanoidRootPart") then
                    local v595 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
                    if v595 then
                        v595.CFrame = l_FirstChild_1.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0);
                        chloex("Teleported to " .. l_FirstChild_1.Name);
                    else
                        chloex("Your HumanoidRootPart not found.");
                    end;
                else
                    chloex("Target not found or not loaded.");
                end;
                return;
            end;
        end
    });
    local v596 = v130.Tele:AddSection("Location");
    local v597 = {};
    for v598, _ in pairs(v122) do
        table.insert(v597, v598);
    end;
    v596:AddDropdown({
        Title = "Select Location", 
        Content = "Choose teleport destination", 
        Options = v597, 
        Default = {}, 
        Callback = function(v600) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.teleportTarget = v600;
        end
    });
    v596:AddButton({
        Title = "Teleport to Location", 
        Content = "Teleport to selected location", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v122 (ref), l_LocalPlayer_0 (ref)
            local l_teleportTarget_1 = v8.teleportTarget;
            if not l_teleportTarget_1 then
                chloex("Please select a location first!");
                return;
            else
                local v602 = v122[l_teleportTarget_1];
                if v602 then
                    local v603 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
                    if v603 then
                        v603.CFrame = CFrame.new(v602 + Vector3.new(0, 3, 0));
                        chloex("Teleported to " .. l_teleportTarget_1);
                    end;
                end;
                return;
            end;
        end
    });
    local v604 = v130.Misc:AddSection("Miscellaneous");
    v604:AddToggle({
        Title = "Infinite Oxygen", 
        Default = false, 
        Callback = function(v605) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v6 (ref)
            v8.infOxygen = v605;
            if v605 then
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v8 (ref), v6 (ref)
                    while v8.infOxygen do
                        v6.Events.UpdateOxygen:FireServer(-999999);
                        task.wait(1);
                    end;
                end);
            end;
        end
    });
    v604:AddToggle({
        Title = "Bypass Radar", 
        Default = false, 
        Callback = function(v606) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v6 (ref)
            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v6 (ref), v606 (ref)
                v6.Functions.UpdateRadar:InvokeServer(v606);
            end);
        end
    });
    local v607 = nil;
    local v608 = nil;
    local v609 = nil;
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v0 (ref)
        return require(v0.RS.Controllers.CutsceneController);
    end);
    if l_status_6 and l_result_6 then
        v607 = l_result_6;
        v608 = v607.Play;
        v609 = v607.Stop;
    end;
    l_status_6 = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v6 (ref), v607 (ref)
        if v6.Events.RECutscene then
            v6.Events.RECutscene.OnClientEvent:Connect(function(...) --[[ Line: 0 ]] --[[ Name:  ]]
                warn("[CELESTIAL] Cutscene blocked (ReplicateCutscene)", ...);
            end);
        end;
        if v6.Events.REStop then
            v6.Events.REStop.OnClientEvent:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]
                warn("[CELESTIAL] Cutscene blocked (StopCutscene)");
            end);
        end;
        if v607 then
            v607.Play = function() --[[ Line: 0 ]] --[[ Name:  ]]
                warn("[CELESTIAL] Cutscene skipped!");
            end;
            v607.Stop = function() --[[ Line: 0 ]] --[[ Name:  ]]
                warn("[CELESTIAL] Cutscene stop skipped");
            end;
        end;
        warn("[CELESTIAL] All cutscenes disabled successfully!");
    end;
    l_result_6 = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v607 (ref), v608 (ref), v609 (ref)
        if v607 and v608 and v609 then
            v607.Play = v608;
            v607.Stop = v609;
            warn("[CELESTIAL] Cutscenes restored to default");
        end;
    end;
    v604:AddToggle({
        Title = "Auto Skip Cutscene", 
        Default = true, 
        Callback = function(v612) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), l_status_6 (ref), l_result_6 (ref)
            v8.skipCutscene = v612;
            if v612 then
                l_status_6();
            else
                l_result_6();
            end;
        end
    });
    v604:AddSubSection("Hide Identifier");
    _G.hideident = {
        overhead = v2:WaitForChild("Overhead"), 
        titleLabel = v2.Overhead.TitleContainer.Label, 
        gradient = v2.Overhead.TitleContainer.Label:WaitForChild("UIGradient"), 
        header = v2.Overhead.Content.Header, 
        levelLabel = v2.Overhead.LevelContainer.Label
    };
    local l_Text_1 = _G.hideident.titleLabel.Text;
    local l_Text_2 = _G.hideident.header.Text;
    defaultLevel = _G.hideident.levelLabel.Text;
    defaultHeader = l_Text_2;
    defaultTitle = l_Text_1;
    defaultGradient = _G.hideident.gradient.Color;
    defaultRotation = _G.hideident.gradient.Rotation;
    l_Text_1 = defaultHeader;
    customLevelText = defaultLevel;
    customHeaderText = l_Text_1;
    v604:AddInput({
        Title = "Name Changer", 
        Placeholder = "Enter header text...", 
        Default = defaultHeader, 
        Callback = function(v615) --[[ Line: 0 ]] --[[ Name:  ]]
            customHeaderText = v615;
        end
    });
    v604:AddInput({
        Title = "Lvl Changer", 
        Placeholder = "Enter level text...", 
        Default = defaultLevel, 
        Callback = function(v616) --[[ Line: 0 ]] --[[ Name:  ]]
            customLevelText = v616;
        end
    });
    l_Text_1 = nil;
    v604:AddToggle({
        Title = "Start Hide Identifier", 
        Default = false, 
        Callback = function(v617) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: l_Text_1 (ref)
            if v617 then
                local l_Overhead_0 = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"):WaitForChild("Overhead");
                _G.hideident = {
                    overhead = l_Overhead_0, 
                    titleLabel = l_Overhead_0.TitleContainer.Label, 
                    gradient = l_Overhead_0.TitleContainer.Label:WaitForChild("UIGradient"), 
                    header = l_Overhead_0.Content.Header, 
                    levelLabel = l_Overhead_0.LevelContainer.Label
                };
                applyCustom = function() --[[ Line: 0 ]] --[[ Name:  ]]
                    if not _G.hideident or not _G.hideident.overhead then
                        return;
                    else
                        _G.hideident.overhead.TitleContainer.Visible = true;
                        _G.hideident.titleLabel.Text = "Chloe X";
                        _G.hideident.gradient.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 85, 255)), 
                            ColorSequenceKeypoint.new(0.333333, Color3.fromRGB(145, 186, 255)), 
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(136, 243, 255))
                        });
                        _G.hideident.gradient.Rotation = 0;
                        _G.hideident.header.Text = customHeaderText and customHeaderText ~= "" and customHeaderText or "Chloe Rawr";
                        _G.hideident.levelLabel.Text = customLevelText and customLevelText ~= "" and customLevelText or "???";
                        return;
                    end;
                end;
                applyCustom();
                if l_Text_1 then
                    task.cancel(l_Text_1);
                end;
                l_Text_1 = task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v617 (ref)
                    while v617 do
                        applyCustom();
                        task.wait(1);
                    end;
                end);
            else
                if l_Text_1 then
                    task.cancel(l_Text_1);
                    l_Text_1 = nil;
                end;
                _G.hideident.overhead.TitleContainer.Visible = false;
                _G.hideident.titleLabel.Text = defaultTitle;
                _G.hideident.header.Text = defaultHeader;
                _G.hideident.levelLabel.Text = defaultLevel;
                _G.hideident.gradient.Color = defaultGradient;
                _G.hideident.gradient.Rotation = defaultRotation;
            end;
        end
    });
    v604:AddSubSection("Halloween Event");
    v604:AddToggle({
        Title = "Auto Claim Halloween Event", 
        Default = v8.CEvent, 
        Callback = function(v619) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v0 (ref), v6 (ref)
            v8.CEvent = v619;
            if v619 then
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v0 (ref), v8 (ref), v6 (ref)
                    local l_JungleEvent_0 = v0.PG:FindFirstChild("JungleEvent");
                    if not l_JungleEvent_0 or not l_JungleEvent_0:FindFirstChild("Frame") then
                        return;
                    else
                        local l_Body_0 = l_JungleEvent_0.Frame:FindFirstChild("Body");
                        if not l_Body_0 then
                            return;
                        else
                            local l_Main_0 = l_Body_0:FindFirstChild("Main");
                            if not l_Main_0 then
                                return;
                            else
                                local l_Track_0 = l_Main_0:FindFirstChild("Track");
                                if not l_Track_0 or not l_Track_0:FindFirstChild("Frame") then
                                    return;
                                else
                                    local l_Frame_1 = l_Track_0.Frame;
                                    while v8.CEvent do
                                        for v625 = 1, 13 do
                                            local l_l_Frame_1_FirstChild_0 = l_Frame_1:FindFirstChild(tostring(v625));
                                            do
                                                local l_v625_0 = v625;
                                                if l_l_Frame_1_FirstChild_0 then
                                                    local l_Inside_0 = l_l_Frame_1_FirstChild_0:FindFirstChild("Inside");
                                                    local v629 = l_Inside_0 and l_Inside_0:FindFirstChild("Claim");
                                                    if v629 and v629:IsA("ImageButton") and v629.Visible and l_Inside_0.Visible and l_l_Frame_1_FirstChild_0.Visible and v629.Active then
                                                        pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                                            -- upvalues: v6 (ref), l_v625_0 (ref)
                                                            v6.Events.REEvReward:FireServer(l_v625_0);
                                                            chloex(string.format("Claimed Reward #%d", l_v625_0));
                                                        end);
                                                        task.wait(0.7);
                                                    end;
                                                end;
                                            end;
                                        end;
                                        task.wait(5);
                                    end;
                                    return;
                                end;
                            end;
                        end;
                    end;
                end);
            end;
        end
    });
    v604:AddToggle({
        Title = "Auto Claim Halloween NPC", 
        Default = false, 
        Callback = function(v630) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v6 (ref)
            v8.autoClaimNPC = v630;
            if v630 then
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v8 (ref), v6 (ref)
                    local v631 = {
                        "Headless Horseman", 
                        "Hallow Guardian", 
                        "Zombified Doge", 
                        "Pumpkin Bandit", 
                        "Scientist", 
                        "Ghost", 
                        "Witch"
                    };
                    while v8.autoClaimNPC do
                        for _, v633 in ipairs(v631) do
                            do
                                local l_v633_0 = v633;
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v6 (ref), l_v633_0 (ref)
                                    v6.Functions.Dialogue:InvokeServer(l_v633_0, "TrickOrTreat");
                                end);
                                task.wait(1.5);
                            end;
                        end;
                        task.wait(5);
                    end;
                end);
            end;
        end
    });
    v604:AddToggle({
        Title = "Auto Claim Halloween House", 
        Default = false, 
        Callback = function(v635) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v6 (ref)
            v8.autoClaimHouse = v635;
            if v635 then
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v8 (ref), v6 (ref)
                    local v636 = {
                        "Talon", 
                        "Kenny", 
                        "OutOfOrderFoxy", 
                        "Terror", 
                        "RequestingBlox", 
                        "Mac", 
                        "Wildes", 
                        "Tapiobag", 
                        "nthnth", 
                        "Jixxio", 
                        "Relukt"
                    };
                    while v8.autoClaimHouse do
                        for _, v638 in ipairs(v636) do
                            do
                                local l_v638_0 = v638;
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v6 (ref), l_v638_0 (ref)
                                    v6.Functions.Dialogue:InvokeServer(l_v638_0, "TrickOrTreatHouse");
                                end);
                                task.wait(1.5);
                            end;
                        end;
                        task.wait(5);
                    end;
                end);
            end;
        end
    });
    v604:AddSubSection("Boost Player");
    v604:AddToggle({
        Title = "Disable Notification", 
        Content = "Disable All Notification! Fish/Admin Annoucement/Event Spawned!", 
        Default = false, 
        Callback = function(v640) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v127 (ref), v128 (ref)
            v8.disableNotifs = v640;
            if v640 then
                v127();
            else
                v128();
            end;
        end
    });
    v604:AddToggle({
        Title = "Disable Char Effect", 
        Default = false, 
        Callback = function(v641) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v6 (ref)
            if v641 then
                v8.dummyCons = {};
                for _, v643 in ipairs({
                    v6.Events.REPlayFishEffect, 
                    v6.Events.RETextEffect
                }) do
                    for _, v645 in ipairs(getconnections(v643.OnClientEvent)) do
                        v645:Disconnect();
                    end;
                    local v646 = v643.OnClientEvent:Connect(function() --[[ Line: 0 ]] --[[ Name:  ]]

                    end);
                    table.insert(v8.dummyCons, v646);
                end;
            else
                if v8.dummyCons then
                    for _, v648 in ipairs(v8.dummyCons) do
                        v648:Disconnect();
                    end;
                end;
                v8.dummyCons = {};
            end;
        end
    });
    v604:AddToggle({
        Title = "Delete Fishing Effects", 
        Content = "This Feature irivisible! delete any effect on rod", 
        Default = false, 
        Callback = function(v649) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.DelEffects = v649;
            if v649 then
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v8 (ref)
                    while v8.DelEffects do
                        local l_CosmeticFolder_0 = workspace:FindFirstChild("CosmeticFolder");
                        if l_CosmeticFolder_0 then
                            l_CosmeticFolder_0:Destroy();
                        end;
                        task.wait(60);
                    end;
                end);
            end;
        end
    });
    v604:AddToggle({
        Title = "Hide Rod On Hand", 
        Content = "This feature irivisible! and hide other player too.", 
        Default = false, 
        Callback = function(v651) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            v8.IrRod = v651;
            if v651 then
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v8 (ref)
                    while v8.IrRod do
                        for _, v653 in ipairs(workspace.Characters:GetChildren()) do
                            local l_v653_FirstChild_0 = v653:FindFirstChild("!!!EQUIPPED_TOOL!!!");
                            if l_v653_FirstChild_0 then
                                l_v653_FirstChild_0:Destroy();
                            end;
                        end;
                        task.wait(1);
                    end;
                end);
            end;
        end
    });
    _G.WebhookFlags = {
        FishCaught = {
            Enabled = false, 
            URL = "https://discord.com/api/webhooks/1421903910221643821/VofsLWEU5H1CnUVjAe38mH9EetIQHKCpU717ClGZXCOJPpO5VFktXraoqy1MqNYZFEW1"
        }, 
        Stats = {
            Enabled = false, 
            URL = "", 
            Delay = 5
        }, 
        Disconnect = {
            Enabled = false, 
            URL = "https://discord.com/api/webhooks/1428340333510398013/1L4UNrQmJXLgiNjO8PvZVc2TSxX60Xvg8BFpGyz8VANNL95DRfwKBPzyx9-mgZYLKw6_"
        }
    };
    _G.WebhookURLs = _G.WebhookURLs or {};
    _G.TierFish = _G.TierFish or {
        [0] = "Common", 
        [1] = "Uncommon", 
        [2] = "Rare", 
        [3] = "Epic", 
        [4] = "Legendary", 
        [5] = "Mythic", 
        [6] = "Secret"
    };
    _G.WebhookRarities = _G.WebhookRarities or {};
    _G.WebhookNames = _G.WebhookNames or {};
    l_Text_2 = {};
    buildFishDatabase = function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v7 (ref), l_Text_2 (ref)
        local l_Items_0 = v7.Items;
        if not l_Items_0 then
            return;
        else
            for _, v657 in ipairs(l_Items_0:GetChildren()) do
                local l_status_7, l_result_7 = pcall(require, v657);
                if l_status_7 and type(l_result_7) == "table" and l_result_7.Data and l_result_7.Data.Type == "Fishes" then
                    local l_Data_0 = l_result_7.Data;
                    if l_Data_0.Id and l_Data_0.Name then
                        l_Text_2[l_Data_0.Id] = {
                            Name = l_Data_0.Name, 
                            Tier = l_Data_0.Tier, 
                            Icon = l_Data_0.Icon, 
                            SellPrice = l_result_7.SellPrice
                        };
                    end;
                end;
            end;
            return;
        end;
    end;
    getThumbnailURL = function(v661) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v0 (ref)
        local v662 = v661:match("rbxassetid://(%d+)");
        if not v662 then
            return nil;
        else
            local v663 = string.format("https://thumbnails.roblox.com/v1/assets?assetIds=%s&type=Asset&size=420x420&format=Png", v662);
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v0 (ref), v663 (ref)
                return v0.HttpService:JSONDecode(game:HttpGet(v663));
            end);
            return l_status_8 and l_result_8 and l_result_8.data and l_result_8.data[1] and l_result_8.data[1].imageUrl;
        end;
    end;
    sendWebhook = function(v666, v667) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v0 (ref)
        if not _G.httpRequest or not v666 or v666 == "" then
            return;
        elseif _G._WebhookLock and _G._WebhookLock[v666] then
            return;
        else
            _G._WebhookLock = _G._WebhookLock or {};
            _G._WebhookLock[v666] = true;
            task.delay(0.25, function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v666 (ref)
                _G._WebhookLock[v666] = nil;
            end);
            pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v666 (ref), v0 (ref), v667 (ref)
                _G.httpRequest({
                    Url = v666, 
                    Method = "POST", 
                    Headers = {
                        ["Content-Type"] = "application/json"
                    }, 
                    Body = v0.HttpService:JSONEncode(v667)
                });
            end);
            return;
        end;
    end;
    sendNewFishWebhook = function(v668) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: l_Text_2 (ref)
        if not _G.WebhookFlags.FishCaught.Enabled then
            return;
        else
            local l_URL_0 = _G.WebhookFlags.FishCaught.URL;
            if not l_URL_0 or not l_URL_0:match("discord.com/api/webhooks") then
                return;
            else
                local v670 = l_Text_2[v668.Id];
                if not v670 then
                    return;
                else
                    local v671 = _G.TierFish and _G.TierFish[v670.Tier] or "Unknown";
                    if _G.WebhookRarities and #_G.WebhookRarities > 0 and not table.find(_G.WebhookRarities, v671) then
                        return;
                    elseif _G.WebhookNames and #_G.WebhookNames > 0 and not table.find(_G.WebhookNames, v670.Name) then
                        return;
                    else
                        local v672 = v668.Metadata and v668.Metadata.Weight and string.format("%.2f Kg", v668.Metadata.Weight) or "N/A";
                        local v673 = v668.Metadata and v668.Metadata.VariantId and tostring(v668.Metadata.VariantId) or "None";
                        local v674 = v670.SellPrice and "$" .. string.format("%d", v670.SellPrice):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") or "N/A";
                        local v675 = {
                            embeds = {
                                {
                                    title = "Chloe X Webhook | Fish Caught", 
                                    url = "https://discord.gg/PaPvGUE8UC", 
                                    description = string.format("\226\156\166\239\184\142 Congratulations!! **%s** You have obtained a new **%s** fish!", _G.WebhookCustomName ~= "" and _G.WebhookCustomName or game.Players.LocalPlayer.Name, v671), 
                                    color = 52221, 
                                    fields = {
                                        {
                                            name = "\227\128\162Fish Name :", 
                                            value = "```\226\157\175 " .. v670.Name .. "```"
                                        }, 
                                        {
                                            name = "\227\128\162Fish Tier :", 
                                            value = "```\226\157\175 " .. v671 .. "```"
                                        }, 
                                        {
                                            name = "\227\128\162Weight :", 
                                            value = "```\226\157\175 " .. v672 .. "```"
                                        }, 
                                        {
                                            name = "\227\128\162Mutation :", 
                                            value = "```\226\157\175 " .. v673 .. "```"
                                        }, 
                                        {
                                            name = "\227\128\162Sell Price :", 
                                            value = "```\226\157\175 " .. v674 .. "```"
                                        }
                                    }, 
                                    image = {
                                        url = getThumbnailURL(v670.Icon) or "https://i.imgur.com/WltO8IG.png"
                                    }, 
                                    footer = {
                                        text = "Chloe X Webhook", 
                                        icon_url = "https://i.imgur.com/WltO8IG.png"
                                    }, 
                                    timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
                                }
                            }, 
                            username = "Chloe X Notification!", 
                            avatar_url = "https://i.imgur.com/9afHGRy.jpeg"
                        };
                        sendWebhook(l_URL_0, v675);
                        return;
                    end;
                end;
            end;
        end;
    end;
    buildFishDatabase();
    local v676 = {};
    for _, v678 in pairs(l_Text_2) do
        table.insert(v676, v678.Name);
    end;
    table.sort(v676);
    task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v5 (ref), v8 (ref)
        repeat
            REObtainedNewFishNotification = v5.Net["RE/ObtainedNewFishNotification"];
            task.wait();
        until REObtainedNewFishNotification;
        if not _G.FishWebhookConnected then
            _G.FishWebhookConnected = true;
            print("[Chloe X] Webhook Connected to Fish Notification");
            REObtainedNewFishNotification.OnClientEvent:Connect(function(v679, v680) --[[ Line: 0 ]] --[[ Name:  ]]
                -- upvalues: v8 (ref)
                if v8.autoWebhook then
                    local v681 = {
                        Id = v679, 
                        Metadata = {
                            Weight = v680 and v680.Weight, 
                            VariantId = v680 and v680.VariantId
                        }
                    };
                    sendNewFishWebhook(v681);
                end;
            end);
        end;
    end);
    webhook = v130.Webhook:AddSection("Webhook Fish Caught");
    webhook:AddInput({
        Title = "Webhook URL", 
        Default = _G.WebhookFlags.FishCaught.URL, 
        Placeholder = "Paste your custom webhook here...", 
        Callback = function(v682) --[[ Line: 0 ]] --[[ Name:  ]]
            if v682 and v682:match("discord") and v682:match("/api/webhooks/") then
                local v683 = v682:gsub("discordapp%.com", "discord.com"):gsub("canary%.discord%.com", "discord.com"):gsub("ptb%.discord%.com", "discord.com");
                if v683:match("^https://discord%.com/api/webhooks/[%w-_]+/[%w-_]+") then
                    _G.WebhookFlags.FishCaught.URL = v683;
                    SaveConfig();
                end;
            end;
        end
    });
    webhook:AddDropdown({
        Title = "Tier Filter", 
        Multi = true, 
        Options = {
            "Common", 
            "Uncommon", 
            "Rare", 
            "Epic", 
            "Legendary", 
            "Mythic", 
            "Secret"
        }, 
        Default = {
            "Mythic", 
            "Secret"
        }, 
        Callback = function(v684) --[[ Line: 0 ]] --[[ Name:  ]]
            _G.WebhookRarities = v684;
            SaveConfig();
        end
    });
    webhook:AddDropdown({
        Title = "Name Filter", 
        Multi = true, 
        Options = v676, 
        Default = {}, 
        Callback = function(v685) --[[ Line: 0 ]] --[[ Name:  ]]
            _G.WebhookNames = v685;
            SaveConfig();
        end
    });
    webhook:AddInput({
        Title = "Hide Identity", 
        Content = "Protect your name for sending webhook to discord", 
        Default = _G.WebhookCustomName or "", 
        Callback = function(v686) --[[ Line: 0 ]] --[[ Name:  ]]
            _G.WebhookCustomName = v686;
            SaveConfig();
        end
    });
    webhook:AddToggle({
        Title = "Send Fish Webhook", 
        Default = _G.WebhookFlags.FishCaught.Enabled, 
        Callback = function(v687) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref)
            _G.WebhookFlags.FishCaught.Enabled = v687;
            v8.autoWebhook = v687;
            SaveConfig();
        end
    });
    webhook:AddButton({
        Title = "Test Webhook Connection", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v0 (ref)
            local l_URL_1 = _G.WebhookFlags.FishCaught.URL;
            if not l_URL_1 or not l_URL_1:match("discord.com/api/webhooks") then
                warn("[Webhook Test] \226\157\140 Invalid or missing webhook URL.");
                return;
            else
                local v689 = {
                    content = nil, 
                    embeds = {
                        {
                            color = 44543, 
                            author = {
                                name = "Ding dongggg! Webhook is connected :3"
                            }, 
                            image = {
                                url = "https://media.tenor.com/KJDqZ0H6Gb4AAAAC/gawr-gura-gura.gif"
                            }
                        }
                    }, 
                    username = "Chloe X Notification!", 
                    avatar_url = "https://i.imgur.com/9afHGRy.jpeg", 
                    attachments = {}
                };
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: l_URL_1 (ref), v0 (ref), v689 (ref)
                    local l_status_9, l_result_9 = pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_URL_1 (ref), v0 (ref), v689 (ref)
                        return _G.httpRequest({
                            Url = l_URL_1, 
                            Method = "POST", 
                            Headers = {
                                ["Content-Type"] = "application/json"
                            }, 
                            Body = v0.HttpService:JSONEncode(v689)
                        });
                    end);
                    if l_status_9 then
                        print("[Webhook Test] \226\156\133 Successfully sent test message!");
                    else
                        warn("[Webhook Test] \226\157\140 Failed to send webhook:", l_result_9);
                    end;
                end);
                return;
            end;
        end
    });
    local v692 = v130.Webhook:AddSection("Webhook Statistic Player");
    v692:AddInput({
        Title = "Statistic Webhook URL", 
        Default = _G.WebhookFlags.Stats.URL, 
        Placeholder = "Paste your stats webhook here...", 
        Callback = function(v693) --[[ Line: 0 ]] --[[ Name:  ]]
            if v693 and v693:match("discord") and v693:match("/api/webhooks/") then
                local v694 = v693:gsub("discordapp%.com", "discord.com"):gsub("canary%.discord%.com", "discord.com"):gsub("ptb%.discord%.com", "discord.com");
                if v694:match("^https://discord%.com/api/webhooks/[%w-_]+/[%w-_]+") then
                    _G.WebhookFlags.Stats.URL = v694;
                    SaveConfig();
                end;
            end;
        end
    });
    v692:AddInput({
        Title = "Delay (Minutes)", 
        Default = tostring(_G.WebhookFlags.Stats.Delay), 
        Placeholder = "Delay between data sends...", 
        Numeric = true, 
        Callback = function(v695) --[[ Line: 0 ]] --[[ Name:  ]]
            local v696 = tonumber(v695);
            if v696 and v696 >= 1 then
                _G.WebhookFlags.Stats.Delay = v696;
                SaveConfig();
            end;
        end
    });
    v692:AddToggle({
        Title = "Send Webhook Statistic", 
        Content = "Automatically send player stats, inventory, utility, and quest info to Discord.", 
        Default = _G.WebhookFlags.Stats.Enabled or false, 
        Callback = function(v697) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v8 (ref), v0 (ref), v7 (ref)
            v8.autoWebhookStats = v697;
            _G.WebhookFlags.Stats.Enabled = v697;
            SaveConfig();
            if not v697 then
                return;
            else
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v0 (ref), v7 (ref), v8 (ref)
                    local l_RS_0 = v0.RS;
                    local l_HttpService_0 = v0.HttpService;
                    local l_Data_1 = v7.Data;
                    local l_Items_1 = l_RS_0:WaitForChild("Items");
                    local l_Baits_0 = l_RS_0:WaitForChild("Baits");
                    local l_Totems_0 = l_RS_0:WaitForChild("Totems");
                    local v704 = {};
                    local v705 = {
                        Fishes = {
                            folders = {
                                l_Items_1
                            }, 
                            expectType = "Fishes"
                        }, 
                        ["Fishing Rods"] = {
                            folders = {
                                l_Items_1
                            }, 
                            expectType = "Fishing Rods"
                        }, 
                        Baits = {
                            folders = {
                                l_Baits_0
                            }, 
                            expectType = "Baits"
                        }, 
                        Totems = {
                            folders = {
                                l_Totems_0
                            }, 
                            expectType = "Totems"
                        }, 
                        Items = {
                            folders = {
                                l_Items_1
                            }, 
                            expectType = nil
                        }
                    };
                    local function v709(v706) --[[ Line: 0 ]] --[[ Name:  ]]
                        local l_status_10, l_result_10 = pcall(require, v706);
                        if l_status_10 and type(l_result_10) == "table" and l_result_10.Data then
                            return l_result_10;
                        else
                            return;
                        end;
                    end;
                    local function v721(v710, v711) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v704 (ref), v709 (ref)
                        local v712 = (v711.expectType or "ANY") .. ":" .. tostring(v710);
                        if v704[v712] ~= nil then
                            return v704[v712];
                        else
                            for _, v714 in ipairs(v711.folders) do
                                for _, v716 in ipairs(v714:GetDescendants()) do
                                    if v716:IsA("ModuleScript") then
                                        local v717 = v709(v716);
                                        if v717 and v717.Data and v717.Data.Id == v710 and (not v711.expectType or v717.Data.Type == v711.expectType) then
                                            v704[v712] = v717;
                                            return v717;
                                        end;
                                    else
                                        local v718 = v716.GetAttribute and v716:GetAttribute("Id");
                                        if v718 == v710 then
                                            local v719 = v716.GetAttribute and v716:GetAttribute("Type");
                                            if not v711.expectType or v719 == v711.expectType then
                                                local v720 = {
                                                    Data = {
                                                        Id = v718, 
                                                        Type = v719, 
                                                        Name = v716:GetAttribute("Name"), 
                                                        Tier = v716:GetAttribute("Rarity")
                                                    }
                                                };
                                                v704[v712] = v720;
                                                return v720;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            v704[v712] = false;
                            return nil;
                        end;
                    end;
                    local function v723(v722) --[[ Line: 0 ]] --[[ Name:  ]]
                        if v722 >= 1000000000 then
                            return string.format("%.1fB", v722 / 1000000000);
                        elseif v722 >= 1000000 then
                            return string.format("%.1fM", v722 / 1000000);
                        elseif v722 >= 1000 then
                            return string.format("%.1fk", v722 / 1000);
                        else
                            return tostring(v722);
                        end;
                    end;
                    local function v726(v724) --[[ Line: 0 ]] --[[ Name:  ]]
                        local v725 = v724 and v724.Data and v724.Data.Tier;
                        return _G.TierFish[v725] or v725 and tostring(v725) or "Unknown";
                    end;
                    local function v739(v727, v728, v729) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v721 (ref), v705 (ref)
                        local v730 = {};
                        if typeof(v727) == "table" then
                            for _, v732 in ipairs(v727) do
                                local v733 = v721(v732.Id, v705[v728] or v705.Items);
                                local v734 = v733 and v733.Data and v733.Data.Name or "Unknown";
                                v730[v734] = (v730[v734] or 0) + (v732.Amount or 1);
                            end;
                        end;
                        local v735 = {};
                        local v736 = 1;
                        for v737, v738 in pairs(v730) do
                            if v729 then
                                table.insert(v735, string.format("%d. %s | x%s", v736, v737, v738));
                            else
                                table.insert(v735, string.format("%d. %s", v736, v737));
                            end;
                            v736 = v736 + 1;
                        end;
                        return table.concat(v735, "\n");
                    end;
                    local function v749() --[[ Line: 0 ]] --[[ Name:  ]]
                        local v740 = {
                            DeepSea = {}, 
                            Element = {}
                        };
                        local l_workspace_FirstChild_7 = workspace:FindFirstChild("!!! MENU RINGS");
                        if not l_workspace_FirstChild_7 then
                            return v740;
                        else
                            local v742 = {
                                DeepSea = l_workspace_FirstChild_7:FindFirstChild("Deep Sea Tracker"), 
                                Element = l_workspace_FirstChild_7:FindFirstChild("Element Tracker")
                            };
                            for v743, v744 in pairs(v742) do
                                local v745 = v744 and v744:FindFirstChild("Board") and v744.Board:FindFirstChild("Gui");
                                local v746 = v745 and v745:FindFirstChild("Content");
                                if v746 then
                                    for _, v748 in ipairs(v746:GetChildren()) do
                                        if v748:IsA("TextLabel") and v748.Name:match("Label") then
                                            table.insert(v740[v743], string.format("%d. %s", #v740[v743] + 1, v748.Text));
                                        end;
                                    end;
                                end;
                            end;
                            return v740;
                        end;
                    end;
                    local function v751() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_Data_1 (ref)
                        local v750 = l_Data_1:Get({
                            "Statistics"
                        }) or {};
                        return {
                            Coins = l_Data_1:Get({
                                "Coins"
                            }) or 0, 
                            FishCaught = v750.FishCaught or 0, 
                            XP = l_Data_1:Get({
                                "XP"
                            }) or 0
                        };
                    end;
                    local function v787(v752, v753) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v739 (ref), v749 (ref), v721 (ref), v705 (ref), v726 (ref), v723 (ref), l_HttpService_0 (ref)
                        local v754 = _G.WebhookFlags and _G.WebhookFlags.Stats.URL or "";
                        if v754 == "" then
                            warn("[Webhook Stats] \226\157\140 Please set your Webhook URL first!");
                            return;
                        else
                            local l_LocalPlayer_1 = game.Players.LocalPlayer;
                            local v756 = l_LocalPlayer_1 and l_LocalPlayer_1.Name or "Unknown";
                            local v757 = v739(v753["Fishing Rods"], "Fishing Rods", false);
                            local v758 = v739(v753.Baits, "Baits", false);
                            local v759 = v739(v753.Totems, "Totems", true);
                            local v760 = {};
                            local l_ipairs_0 = ipairs;
                            local v762 = v753.Items or {};
                            for _, v764 in l_ipairs_0(v762) do
                                if v764.Id == 10 then
                                    v760["Enchant Stone"] = (v760["Enchant Stone"] or 0) + (v764.Amount or 1);
                                elseif v764.Id == 125 then
                                    v760["Super Enchant Stone"] = (v760["Super Enchant Stone"] or 0) + (v764.Amount or 1);
                                elseif v764.Id == 246 then
                                    v760["Transcended Stone"] = (v760["Transcended Stone"] or 0) + (v764.Amount or 1);
                                end;
                            end;
                            l_ipairs_0 = {};
                            v762 = 1;
                            for v765, v766 in pairs(v760) do
                                table.insert(l_ipairs_0, string.format("%d. %s | x%s", v762, v765, v766));
                                v762 = v762 + 1;
                            end;
                            local v767 = next(v760) and table.concat(l_ipairs_0, "\n") or "(None)";
                            local v768 = v749();
                            local v769 = #v768.DeepSea > 0 and table.concat(v768.DeepSea, "\n") or "(No Deep Sea Quest Found)";
                            local v770 = #v768.Element > 0 and table.concat(v768.Element, "\n") or "(No Element Quest Found)";
                            local v771 = v753.Items or {};
                            local v772 = {};
                            for _, v774 in ipairs(v771) do
                                local v775 = v721(v774.Id, v705.Fishes);
                                if v775 and v775.Data and v775.Data.Type == "Fishes" then
                                    local v776 = v726(v775);
                                    local v777 = v775.Data.Name or "Unknown";
                                    v772[v776] = v772[v776] or {};
                                    v772[v776][v777] = (v772[v776][v777] or 0) + (v774.Amount or 1);
                                end;
                            end;
                            local v778 = {};
                            for _, v780 in ipairs({
                                "Uncommon", 
                                "Common", 
                                "Rare", 
                                "Epic", 
                                "Legendary", 
                                "Mythic", 
                                "Secret"
                            }) do
                                local v781 = v772[v780];
                                if v781 then
                                    table.insert(v778, string.format("\227\128\162**%s :**", v780));
                                    local v782 = 1;
                                    for v783, v784 in pairs(v781) do
                                        table.insert(v778, string.format("%d. %s | x%s", v782, v783, v784));
                                        v782 = v782 + 1;
                                    end;
                                end;
                            end;
                            local v785 = #v778 > 0 and table.concat(v778, "\n") or "(No Fishes Found)";
                            local v786 = {
                                username = "Chloe X Notification!", 
                                avatar_url = "https://i.imgur.com/9afHGRy.jpeg", 
                                embeds = {
                                    {
                                        title = "\227\128\162Chloe X Webhook | Player Info", 
                                        color = 52479, 
                                        fields = {
                                            {
                                                name = "\227\128\162Player Data", 
                                                value = string.format("**\226\157\175 NAME:** %s\n**\226\157\175 COINS:** $%s\n**\226\157\175 FISH CAUGHT:** %s", v756, v723(v752.Coins), v752.FishCaught)
                                            }, 
                                            {
                                                name = "\227\128\162Inventory", 
                                                value = string.format("**Totems:**\n%s\n**Rods:**\n%s\n**Baits:**\n%s", v759, v757, v758)
                                            }
                                        }
                                    }, 
                                    {
                                        title = "Utility & Quest Data", 
                                        color = 26367, 
                                        fields = {
                                            {
                                                name = "\227\128\162Utility Data", 
                                                value = string.format("**\226\157\175 Fishes:**\n%s\n**\226\157\175 Enchant Stones:**\n%s", v785, v767)
                                            }, 
                                            {
                                                name = "\227\128\162Quest Data", 
                                                value = string.format("**\226\157\175 Deep Sea Quest:**\n%s\n**\226\157\175 Element Quest:**\n%s", v769, v770)
                                            }
                                        }, 
                                        footer = {
                                            text = string.format("Chloe X Auto Sync | Every %dm", _G.WebhookFlags.Stats.Delay or 5), 
                                            icon_url = "https://i.imgur.com/WltO8IG.png"
                                        }, 
                                        timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
                                    }
                                }
                            };
                            task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                -- upvalues: v754 (ref), l_HttpService_0 (ref), v786 (ref)
                                pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                                    -- upvalues: v754 (ref), l_HttpService_0 (ref), v786 (ref)
                                    _G.httpRequest({
                                        Url = v754, 
                                        Method = "POST", 
                                        Headers = {
                                            ["Content-Type"] = "application/json"
                                        }, 
                                        Body = l_HttpService_0:JSONEncode(v786)
                                    });
                                end);
                            end);
                            return;
                        end;
                    end;
                    while v8.autoWebhookStats do
                        v787(v751(), l_Data_1:Get({
                            "Inventory"
                        }) or {});
                        task.wait((_G.WebhookFlags.Stats.Delay or 5) * 60);
                    end;
                end);
                return;
            end;
        end
    });
    local v788 = "";
    local v789 = false;
    local v790 = false;
    SendDisconnectWebhook = function(v791) --[[ Line: 0 ]] --[[ Name:  ]]
        -- upvalues: v789 (ref), v788 (ref), v0 (ref)
        if not v789 then
            return;
        else
            local v792 = _G.WebhookURLs.Disconnect or _G.WebhookFlags and _G.WebhookFlags.Disconnect.URL or "";
            if v792 == "" or not v792:match("discord") then
                return;
            else
                local l_LocalPlayer_2 = game.Players.LocalPlayer;
                local v794 = "Unknown";
                if _G.DisconnectCustomName and _G.DisconnectCustomName ~= "" then
                    v794 = _G.DisconnectCustomName;
                elseif l_LocalPlayer_2 and l_LocalPlayer_2.Name then
                    v794 = l_LocalPlayer_2.Name;
                end;
                local v795 = os.date("*t");
                local v796 = v795.hour > 12 and v795.hour - 12 or v795.hour;
                local v797 = v795.hour >= 12 and "PM" or "AM";
                local v798 = string.format("%02d/%02d/%04d %02d.%02d %s", v795.day, v795.month, v795.year, v796, v795.min, v797);
                local v799 = v788 ~= "" and v788 or "Anonymous";
                local v800 = v791 and v791 ~= "" and v791 or "Disconnected from server";
                local v801 = {
                    content = "Ding Dongg Ding Dongggg, Hello! " .. v799 .. " your account got disconnected from server!", 
                    embeds = {
                        {
                            title = "DETAIL ACCOUNT", 
                            color = 36863, 
                            fields = {
                                {
                                    name = "\227\128\162Username :", 
                                    value = "> " .. v794
                                }, 
                                {
                                    name = "\227\128\162Time got disconnected :", 
                                    value = "> " .. v798
                                }, 
                                {
                                    name = "\227\128\162Reason :", 
                                    value = "> " .. v800
                                }
                            }, 
                            thumbnail = {
                                url = "https://media.tenor.com/rx88bhLtmyUAAAAC/gawr-gura.gif"
                            }
                        }
                    }, 
                    username = "Chloe X Notification!", 
                    avatar_url = "https://i.imgur.com/9afHGRy.jpeg"
                };
                task.spawn(function() --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v792 (ref), v0 (ref), v801 (ref)
                    pcall(function() --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: v792 (ref), v0 (ref), v801 (ref)
                        _G.httpRequest({
                            Url = v792, 
                            Method = "POST", 
                            Headers = {
                                ["Content-Type"] = "application/json"
                            }, 
                            Body = v0.HttpService:JSONEncode(v801)
                        });
                    end);
                end);
                return;
            end;
        end;
    end;
    local v802 = v130.Webhook:AddSection("Webhook Alert");
    v802:AddInput({
        Title = "Disconnect Alert Webhook URL", 
        Default = _G.WebhookFlags.Disconnect.URL or "", 
        Callback = function(v803) --[[ Line: 0 ]] --[[ Name:  ]]
            if not v803 or v803 == "" then
                return;
            else
                local v804 = v803:gsub("discordapp%.com", "discord.com"):gsub("canary%.discord%.com", "discord.com"):gsub("ptb%.discord%.com", "discord.com");
                _G.WebhookURLs = _G.WebhookURLs or {};
                _G.WebhookURLs.Disconnect = v804;
                if _G.WebhookFlags and _G.WebhookFlags.Disconnect then
                    _G.WebhookFlags.Disconnect.URL = v804;
                end;
                SaveConfig();
                return;
            end;
        end
    });
    v802:AddInput({
        Title = "Discord ID", 
        Default = "", 
        Callback = function(v805) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v788 (ref)
            if v805 and v805 ~= "" then
                v788 = "<@" .. v805:gsub("%D", "") .. ">";
            else
                v788 = "";
            end;
            SaveConfig();
        end
    });
    v802:AddInput({
        Title = "Hide Identity", 
        Placeholder = "Enter custom name (leave blank for default)", 
        Default = _G.DisconnectCustomName or "", 
        Callback = function(v806) --[[ Line: 0 ]] --[[ Name:  ]]
            _G.DisconnectCustomName = v806;
            SaveConfig();
        end
    });
    v802:AddToggle({
        Title = "Send Webhook On Disconnect", 
        Content = "Notify your Discord when account disconnected and auto rejoin.", 
        Default = _G.WebhookFlags.Disconnect.Enabled or false, 
        Callback = function(v807) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v789 (ref), v790 (ref), v0 (ref)
            v789 = v807;
            if _G.WebhookFlags and _G.WebhookFlags.Disconnect then
                _G.WebhookFlags.Disconnect.Enabled = v807;
            end;
            SaveConfig();
            if v807 then
                v790 = false;
                local function v812(v808) --[[ Line: 0 ]] --[[ Name:  ]]
                    -- upvalues: v790 (ref), v789 (ref)
                    if not v790 and v789 then
                        v790 = true;
                        local v809 = v808 or "Disconnected from server";
                        SendDisconnectWebhook(v809);
                        task.wait(2);
                        local l_TeleportService_0 = game:GetService("TeleportService");
                        local l_LocalPlayer_3 = game:GetService("Players").LocalPlayer;
                        l_TeleportService_0:Teleport(game.PlaceId, l_LocalPlayer_3);
                    end;
                end;
                do
                    local l_v812_0 = v812;
                    v0.GuiService.ErrorMessageChanged:Connect(function(v814) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v812_0 (ref)
                        if v814 and v814 ~= "" then
                            l_v812_0(v814);
                        end;
                    end);
                    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(v815) --[[ Line: 0 ]] --[[ Name:  ]]
                        -- upvalues: l_v812_0 (ref)
                        if v815.Name == "ErrorPrompt" then
                            task.wait(1);
                            local l_v815_FirstChildWhichIsA_0 = v815:FindFirstChildWhichIsA("TextLabel", true);
                            local v817 = l_v815_FirstChildWhichIsA_0 and l_v815_FirstChildWhichIsA_0.Text or "Disconnected";
                            l_v812_0(v817);
                        end;
                    end);
                end;
            end;
        end
    });
    v802:AddButton({
        Title = "Test Disconnected Player", 
        Content = "Kick yourself, send webhook, and auto rejoin.", 
        Callback = function() --[[ Line: 0 ]] --[[ Name:  ]]
            chloex("Kicking player...");
            task.wait(1);
            SendDisconnectWebhook("Test Successfully :3");
            task.wait(2);
            local l_TeleportService_1 = game:GetService("TeleportService");
            local l_LocalPlayer_4 = game:GetService("Players").LocalPlayer;
            l_TeleportService_1:Teleport(game.PlaceId, l_LocalPlayer_4);
        end
    });
    local v820 = loadstring(game:HttpGet("https://raw.githubusercontent.com/MajestySkie/Chloe-X/refs/heads/main/Addons/2.lua"))();
    local v821 = v130.Webhook:AddSection("Webhook Event Settings");
    v821:AddInput({
        Title = "Set Hunt Webhook", 
        Content = "Input webhook link for Hunt", 
        Callback = function(v822) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v820 (ref)
            if v822 and v822:match("^https://discord.com/api/webhooks/") then
                v820.Links.Hunt = v822;
                chloex("Hunt webhook updated!");
            end;
        end
    });
    v821:AddInput({
        Title = "Set Luck Webhook", 
        Content = "Input webhook link for Server Luck", 
        Callback = function(v823) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v820 (ref)
            if v823 and v823:match("^https://discord.com/api/webhooks/") then
                v820.Links.ServerLuck = v823;
                chloex("Server Luck webhook updated!");
            end;
        end
    });
    v821:AddToggle({
        Title = "Auto Send Webhook", 
        Default = true, 
        Callback = function(v824) --[[ Line: 0 ]] --[[ Name:  ]]
            -- upvalues: v820 (ref)
            if v824 then
                _G.WebhookDisabled = false;
                if not _G.WebhookStarted then
                    _G.WebhookStarted = true;
                    v820.Start();
                end;
            else
                _G.WebhookDisabled = true;
            end;
        end
    });
    return;
end;
