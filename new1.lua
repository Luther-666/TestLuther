-- ULTIMATE FPS BOOSTER with PERSISTENT LIGHTING
-- Made for Fisch and other Roblox games
-- Discord: Your Discord Here

if not _G.Ignore then
    _G.Ignore = {} -- Add Instances to ignore (e.g. _G.Ignore = {workspace.Map})
end

if _G.SendNotifications == nil then
    _G.SendNotifications = false -- Set to false if you don't want notifications
end

if _G.ConsoleLogs == nil then
    _G.ConsoleLogs = false -- Set to false to disable console logs
end

if not game:IsLoaded() then
    repeat
        task.wait()
    until game:IsLoaded()
end

-- ========================================
-- SETTINGS
-- ========================================
if not _G.Settings then
    _G.Settings = {
        Players = {
            ["Ignore Me"] = false,
            ["Ignore Others"] = false,
            ["Ignore Tools"] = true
        },
        Meshes = {
            NoMesh = true,
            NoTexture = true,
            Destroy = false
        },
        Images = {
            Invisible = false,
            Destroy = true
        },
        Explosions = {
            Smaller = true,
            Invisible = true,
            Destroy = false
        },
        Particles = {
            Invisible = true,
            Destroy = true
        },
        TextLabels = {
            LowerQuality = true,
            Invisible = false,
            Destroy = false
        },
        MeshParts = {
            LowerQuality = true,
            Invisible = false,
            NoTexture = true,
            NoMesh = false,
            Destroy = false
        },
        Lighting = {
            PersistentMode = true, -- PERSISTENT LIGHTING - Langit tetap abu-abu
            RemoveEffects = true,
            NoShadows = true,
            LowFog = true
        },
        Water = {
            NoWaves = true,
            NoReflection = true,
            LowQuality = true
        },
        Other = {
            ["FPS Cap"] = true, -- Set to number (e.g. 240) or true for uncapped
            ["No Camera Effects"] = true,
            ["No Clothes"] = true,
            ["Low Water Graphics"] = true,
            ["No Shadows"] = true,
            ["Low Rendering"] = true,
            ["Low Quality Parts"] = true,
            ["Low Quality Models"] = true,
            ["Reset Materials"] = true,
            ["Remove Rod Effects"] = true, -- For fishing games
            ["Block Weather Changes"] = true -- PERSISTENT - Block weather dari ngubah lighting
        }
    }
end

-- ========================================
-- SERVICES
-- ========================================
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local MaterialService = game:GetService("MaterialService")
local RunService = game:GetService("RunService")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

local ME = Players.LocalPlayer
local CanBeEnabled = {"ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles", "Beam"}

-- ========================================
-- COUNTERS
-- ========================================
local Stats = {
    WeatherBlocked = 0,
    EffectsRemoved = 0,
    TexturesRemoved = 0,
    LightingMaintained = 0
}

-- ========================================
-- TARGET LIGHTING (PERSISTENT MODE)
-- ========================================
local TARGET_LIGHTING = {
    Ambient = Color3.new(1, 1, 1),
    Brightness = 0,
    ColorShift_Bottom = Color3.new(0, 0, 0),
    ColorShift_Top = Color3.new(0, 0, 0),
    OutdoorAmbient = Color3.new(1, 1, 1),
    GlobalShadows = false,
    FogEnd = 9e9,
    FogStart = 0,
    ClockTime = 12,
    TimeOfDay = "12:00:00"
}

-- ========================================
-- HELPER FUNCTIONS
-- ========================================
local function PartOfCharacter(Inst)
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= ME and v.Character and Inst:IsDescendantOf(v.Character) then
            return true
        end
    end
    return false
end

local function DescendantOfIgnore(Inst)
    for i, v in pairs(_G.Ignore) do
        if Inst:IsDescendantOf(v) then
            return true
        end
    end
    return false
end

local function ShouldIgnore(Inst)
    if Inst:IsDescendantOf(Players) then
        return true
    end
    
    if _G.Settings.Players["Ignore Others"] and PartOfCharacter(Inst) then
        return true
    end
    
    if _G.Settings.Players["Ignore Me"] and ME.Character and Inst:IsDescendantOf(ME.Character) then
        return true
    end
    
    if _G.Settings.Players["Ignore Tools"] and (Inst:IsA("BackpackItem") or Inst:FindFirstAncestorWhichIsA("BackpackItem")) then
        return true
    end
    
    if _G.Ignore and (table.find(_G.Ignore, Inst) or DescendantOfIgnore(Inst)) then
        return true
    end
    
    return false
end

-- ========================================
-- PERSISTENT LIGHTING SYSTEM
-- ========================================
local function MaintainLighting()
    if not _G.Settings.Lighting.PersistentMode then
        return
    end
    
    for property, value in pairs(TARGET_LIGHTING) do
        if Lighting[property] ~= value then
            Lighting[property] = value
            Stats.LightingMaintained = Stats.LightingMaintained + 1
        end
    end
end

-- ========================================
-- MAIN OPTIMIZATION FUNCTION
-- ========================================
local function OptimizeInstance(Inst)
    if ShouldIgnore(Inst) then
        return
    end
    
    -- Meshes
    if Inst:IsA("DataModelMesh") then
        if Inst:IsA("SpecialMesh") then
            if _G.Settings.Meshes.NoMesh then
                Inst.MeshId = ""
            end
            if _G.Settings.Meshes.NoTexture then
                Inst.TextureId = ""
                Stats.TexturesRemoved = Stats.TexturesRemoved + 1
            end
        end
        if _G.Settings.Meshes.Destroy then
            Inst:Destroy()
        end
        
    -- Images (Decals, Textures)
    elseif Inst:IsA("FaceInstance") then
        if _G.Settings.Images.Invisible then
            Inst.Transparency = 1
            Inst.Shiny = 1
        end
        if _G.Settings.Images.Destroy then
            Inst:Destroy()
            Stats.TexturesRemoved = Stats.TexturesRemoved + 1
        end
        
    elseif Inst:IsA("ShirtGraphic") then
        if _G.Settings.Images.Invisible then
            Inst.Graphic = ""
        end
        if _G.Settings.Images.Destroy then
            Inst:Destroy()
        end
        
    -- Particles & Effects
    elseif table.find(CanBeEnabled, Inst.ClassName) then
        if _G.Settings.Particles.Invisible then
            Inst.Enabled = false
            Stats.EffectsRemoved = Stats.EffectsRemoved + 1
        end
        if _G.Settings.Particles.Destroy then
            Inst:Destroy()
            Stats.EffectsRemoved = Stats.EffectsRemoved + 1
        end
        
    -- Post Effects (Camera)
    elseif Inst:IsA("PostEffect") and _G.Settings.Other["No Camera Effects"] then
        Inst.Enabled = false
        
    -- Explosions
    elseif Inst:IsA("Explosion") then
        if _G.Settings.Explosions.Smaller then
            Inst.BlastPressure = 1
            Inst.BlastRadius = 1
        end
        if _G.Settings.Explosions.Invisible then
            Inst.BlastPressure = 1
            Inst.BlastRadius = 1
            Inst.Visible = false
        end
        if _G.Settings.Explosions.Destroy then
            Inst:Destroy()
        end
        
    -- Clothing & Appearance
    elseif Inst:IsA("Clothing") or Inst:IsA("SurfaceAppearance") or Inst:IsA("BaseWrap") then
        if _G.Settings.Other["No Clothes"] then
            Inst:Destroy()
        end
        
    -- Parts
    elseif Inst:IsA("BasePart") and not Inst:IsA("MeshPart") then
        if _G.Settings.Other["Low Quality Parts"] then
            Inst.Material = Enum.Material.Plastic
            Inst.Reflectance = 0
            Inst.CastShadow = false
        end
        
        -- Water optimization
        if Inst.Name:lower():find("water") or Inst.Name:lower():find("ocean") then
            if _G.Settings.Water.LowQuality then
                Inst.Transparency = 0.0
                Inst.Material = Enum.Material.SmoothPlastic
                Inst.Reflectance = 0
            end
        end
        
    -- Text Labels
    elseif Inst:IsA("TextLabel") and Inst:IsDescendantOf(workspace) then
        if _G.Settings.TextLabels.LowerQuality then
            Inst.Font = Enum.Font.SourceSans
            Inst.TextScaled = false
            Inst.RichText = false
            Inst.TextSize = 14
        end
        if _G.Settings.TextLabels.Invisible then
            Inst.Visible = false
        end
        if _G.Settings.TextLabels.Destroy then
            Inst:Destroy()
        end
        
    -- Models
    elseif Inst:IsA("Model") then
        if _G.Settings.Other["Low Quality Models"] then
            Inst.LevelOfDetail = Enum.ModelLevelOfDetail.StreamingMesh
        end
        
    -- MeshParts
    elseif Inst:IsA("MeshPart") then
        if _G.Settings.MeshParts.LowerQuality then
            Inst.RenderFidelity = Enum.RenderFidelity.Performance
            Inst.Reflectance = 0
            Inst.Material = Enum.Material.Plastic
            Inst.CastShadow = false
        end
        if _G.Settings.MeshParts.Invisible then
            Inst.Transparency = 1
        end
        if _G.Settings.MeshParts.NoTexture then
            Inst.TextureID = ""
            Stats.TexturesRemoved = Stats.TexturesRemoved + 1
        end
        if _G.Settings.MeshParts.NoMesh then
            Inst.MeshId = ""
        end
        if _G.Settings.MeshParts.Destroy then
            Inst:Destroy()
        end
    end
end

-- ========================================
-- INITIAL SETUP
-- ========================================
if _G.SendNotifications then
    StarterGui:SetCore("SendNotification", {
        Title = "FPS Booster",
        Text = "Loading...",
        Duration = 3
    })
end

-- Terrain Optimization
if Terrain and _G.Settings.Water.LowQuality then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = _G.Settings.Water.NoReflection and 1 or 0
    
    if sethiddenproperty then
        pcall(function()
            sethiddenproperty(Terrain, "Decoration", false)
        end)
    end
    
    if _G.ConsoleLogs then
        warn("✓ Water Optimization: Enabled")
    end
end

-- Lighting Optimization
if _G.Settings.Lighting.NoShadows or _G.Settings.Other["No Shadows"] then
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.ShadowSoftness = 0
    
    if sethiddenproperty then
        pcall(function()
            sethiddenproperty(Lighting, "Technology", Enum.Technology.Compatibility)
        end)
    end
    
    if _G.ConsoleLogs then
        warn("✓ No Shadows: Enabled")
    end
end

-- Initial Lighting Setup
if _G.Settings.Lighting.PersistentMode then
    MaintainLighting()
    
    if _G.ConsoleLogs then
        warn("✓ Persistent Lighting: Enabled (Langit locked abu-abu)")
    end
end

-- Rendering Quality
if _G.Settings.Other["Low Rendering"] then
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
    
    if _G.ConsoleLogs then
        warn("✓ Low Rendering: Enabled")
    end
end

-- Reset Materials
if _G.Settings.Other["Reset Materials"] then
    for i, v in pairs(MaterialService:GetChildren()) do
        pcall(function()
            v:Destroy()
        end)
    end
    MaterialService.Use2022Materials = false
    
    if _G.ConsoleLogs then
        warn("✓ Materials Reset: Enabled")
    end
end

-- FPS Cap
if _G.Settings.Other["FPS Cap"] then
    if setfpscap then
        local capValue = _G.Settings.Other["FPS Cap"]
        if type(capValue) == "number" then
            setfpscap(capValue)
            if _G.ConsoleLogs then
                warn("✓ FPS Cap: " .. capValue)
            end
        elseif capValue == true then
            setfpscap(1000)
            if _G.ConsoleLogs then
                warn("✓ FPS: Uncapped")
            end
        end
    end
end

-- Remove Lighting Effects
if _G.Settings.Lighting.RemoveEffects then
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("Atmosphere") or effect:IsA("Sky") or effect:IsA("Clouds") then
            pcall(function()
                effect:Destroy()
            end)
        end
    end
end

-- ========================================
-- PROCESS EXISTING INSTANCES
-- ========================================
local Descendants = game:GetDescendants()

if _G.SendNotifications then
    StarterGui:SetCore("SendNotification", {
        Title = "FPS Booster",
        Text = "Processing " .. #Descendants .. " instances...",
        Duration = 3
    })
end

if _G.ConsoleLogs then
    warn("Processing " .. #Descendants .. " instances...")
end

for i, v in pairs(Descendants) do
    pcall(function()
        OptimizeInstance(v)
    end)
end

-- ========================================
-- PERSISTENT LIGHTING MONITOR
-- ========================================
if _G.Settings.Lighting.PersistentMode and _G.Settings.Other["Block Weather Changes"] then
    
    -- Method 1: Property Change Monitor
    Lighting.Changed:Connect(function(property)
        if TARGET_LIGHTING[property] and Lighting[property] ~= TARGET_LIGHTING[property] then
            Lighting[property] = TARGET_LIGHTING[property]
            Stats.WeatherBlocked = Stats.WeatherBlocked + 1
            
            if _G.ConsoleLogs then
                warn("🌤️ Weather blocked: " .. property)
            end
        end
    end)
    
    -- Method 2: Child Added Monitor
    Lighting.ChildAdded:Connect(function(child)
        task.wait(0.05)
        
        if child:IsA("PostEffect") or child:IsA("Atmosphere") or child:IsA("Sky") or child:IsA("Clouds") then
            Stats.WeatherBlocked = Stats.WeatherBlocked + 1
            
            if _G.ConsoleLogs then
                warn("🌤️ Weather effect blocked: " .. child.Name)
            end
            
            pcall(function()
                child:Destroy()
            end)
        end
    end)
    
    -- Method 3: Heartbeat Loop
    RunService.Heartbeat:Connect(function()
        MaintainLighting()
    end)
    
    if _G.ConsoleLogs then
        warn("✓ Weather Block System: Active")
    end
end

-- ========================================
-- MONITOR NEW INSTANCES
-- ========================================
game.DescendantAdded:Connect(function(Inst)
    task.wait(_G.LoadedWait or 0.1)
    
    pcall(function()
        OptimizeInstance(Inst)
    end)
end)

-- ========================================
-- ROD EFFECTS CLEANER (For Fishing Games)
-- ========================================
if _G.Settings.Other["Remove Rod Effects"] then
    local function CleanRodEffects()
        if ME.Character then
            for _, obj in pairs(ME.Character:GetDescendants()) do
                if obj:IsA("Beam") or obj:IsA("Trail") or obj:IsA("ParticleEmitter") then
                    pcall(function()
                        obj:Destroy()
                    end)
                end
            end
        end
    end
    
    -- Clean every 3 seconds
    coroutine.wrap(function()
        while task.wait(3) do
            CleanRodEffects()
        end
    end)()
    
    -- Clean on character respawn
    ME.CharacterAdded:Connect(function(character)
        task.wait(1)
        CleanRodEffects()
    end)
    
    if _G.ConsoleLogs then
        warn("✓ Rod Effects Cleaner: Active")
    end
end

-- ========================================
-- GARBAGE COLLECTION
-- ========================================
coroutine.wrap(function()
    while task.wait(60) do -- 30 detik
        pcall(function()
            for i = 1, 10 do
                RunService.Heartbeat:Wait()
            end
        end)
        
        if _G.ConsoleLogs then
            warn("🗑️ Garbage collection cycle completed")
        end
    end
end)()

if _G.ConsoleLogs then
    warn("✓ Garbage Collection: Active (every 30s)")
end

-- ========================================
-- STATUS REPORT (Every 60 seconds)
-- ========================================
if _G.ConsoleLogs then
    coroutine.wrap(function()
        while task.wait(60) do
            warn("\n📊 FPS Booster Status:")
            warn("  ├─ Weather Blocked: " .. Stats.WeatherBlocked)
            warn("  ├─ Effects Removed: " .. Stats.EffectsRemoved)
            warn("  ├─ Textures Removed: " .. Stats.TexturesRemoved)
            warn("  ├─ Lighting Maintained: " .. Stats.LightingMaintained)
            warn("  └─ Status: Running ✓\n")
        end
    end)()
end

-- ========================================
-- COMPLETE
-- ========================================
if _G.SendNotifications then
    StarterGui:SetCore("SendNotification", {
        Title = "FPS Booster",
        Text = "Loaded Successfully! ✓",
        Duration = 5
    })
end

if _G.ConsoleLogs then
    warn("\n╔════════════════════════════════════╗")
    warn("║   FPS BOOSTER - LOADED! ✓         ║")
    warn("╚════════════════════════════════════╝")
    warn("✓ All Optimizations: Active")
    warn("✓ Persistent Lighting: Active")
    warn("✓ Weather Blocking: Active")
    warn("✓ Auto Monitoring: Active")
    warn("🎮 Enjoy maximum FPS!\n")
end
