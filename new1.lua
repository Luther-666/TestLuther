_G.Ignore = _G.Ignore or {}
_G.Settings = _G.Settings or {

    RemoveEffects = true,        -- Particles, Trails, Beams, Explosions
    RemoveTextures = true,       -- Semua texture & decals
    RemoveClothes = true,        -- Clothing & accessories
    
    PersistentLighting = true,   -- Lock abu-abu
    BlockWeather = true,         -- Block weather changes
    NoShadows = true,
    
    LowQuality = true,           -- Parts, MeshParts, Models
    LowWater = true,             -- Water optimization
    LowRendering = true,         -- Graphics quality
    FPSCap = true,               -- true = uncapped, number = cap
    
    IgnoreMe = false,            -- Optimize player sendiri?
    IgnoreOthers = false,        -- Optimize player lain?
    IgnoreTools = false           -- Jangan optimize tools
}

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

local Player = Players.LocalPlayer
local S = _G.Settings

local TARGET_LIGHTING = {
    Ambient = Color3.new(1, 1, 1),
    Brightness = 0,
    OutdoorAmbient = Color3.new(1, 1, 1),
    GlobalShadows = false,
    FogEnd = 9e9,
    ClockTime = 12
}

local function ShouldIgnore(obj)
    if obj:IsDescendantOf(Players) then
        return true
    end
    
    if S.IgnoreOthers then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= Player and plr.Character and obj:IsDescendantOf(plr.Character) then
                return true
            end
        end
    end
    
    if S.IgnoreMe and Player.Character and obj:IsDescendantOf(Player.Character) then
        return true
    end
    
    if S.IgnoreTools and (obj:IsA("BackpackItem") or obj:FindFirstAncestorWhichIsA("BackpackItem")) then
        return true
    end
    
    for _, v in pairs(_G.Ignore) do
        if obj:IsDescendantOf(v) then
            return true
        end
    end
    
    return false
end

local function MaintainLighting()
    if not S.PersistentLighting then return end
    
    for prop, val in pairs(TARGET_LIGHTING) do
        if Lighting[prop] ~= val then
            Lighting[prop] = val
        end
    end
end

local function Optimize(obj)
    if ShouldIgnore(obj) then return end
    
    pcall(function()
        if S.RemoveEffects then
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or 
               obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                obj.Enabled = false
            
            elseif obj:IsA("Explosion") then
                obj.BlastRadius = 1
                obj.BlastPressure = 1
                obj.Visible = false
            end
        end
        
        -- Textures
        if S.RemoveTextures then
            if obj:IsA("SpecialMesh") then
                obj.TextureId = ""
            
            elseif obj:IsA("MeshPart") then
                obj.TextureID = ""
            
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj:Destroy()
            
            elseif obj:IsA("ShirtGraphic") then
                obj.Graphic = ""
            end
        end
        
        -- Clothes
        if S.RemoveClothes then
            if obj:IsA("Clothing") or obj:IsA("SurfaceAppearance") or obj:IsA("BaseWrap") then
                obj:Destroy()
            end
        end
        
        -- Low Quality
        if S.LowQuality then
            if obj:IsA("MeshPart") then
                obj.RenderFidelity = Enum.RenderFidelity.Performance
                obj.Material = Enum.Material.Plastic
                obj.Reflectance = 0
                obj.CastShadow = false
            
            elseif obj:IsA("BasePart") and not obj:IsA("MeshPart") then
                obj.Material = Enum.Material.Plastic
                obj.Reflectance = 0
                obj.CastShadow = false
            
            elseif obj:IsA("Model") then
                obj.LevelOfDetail = Enum.ModelLevelOfDetail.StreamingMesh
            end
        end
        
        -- Camera Effects
        if obj:IsA("PostEffect") then
            obj.Enabled = false
        end
    end)
end

-- Initial Setup
if S.PersistentLighting then
    MaintainLighting()
    
    -- Remove existing effects
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("Atmosphere") or 
           effect:IsA("Sky") or effect:IsA("Clouds") then
            effect:Destroy()
        end
    end
end

if S.NoShadows then
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
end

if S.LowWater and Terrain then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
end

if S.LowRendering then
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end

if S.FPSCap and setfpscap then
    if type(S.FPSCap) == "number" then
        setfpscap(S.FPSCap)
    else
        setfpscap(1000)
    end
end

-- Process existing objects
for _, obj in pairs(game:GetDescendants()) do
    Optimize(obj)
end

-- Monitor new objects
game.DescendantAdded:Connect(function(obj)
    task.wait(0.1)
    Optimize(obj)
end)

-- Block Weather
if S.BlockWeather and S.PersistentLighting then
    Lighting.Changed:Connect(function(prop)
        if TARGET_LIGHTING[prop] and Lighting[prop] ~= TARGET_LIGHTING[prop] then
            Lighting[prop] = TARGET_LIGHTING[prop]
        end
    end)
    
    Lighting.ChildAdded:Connect(function(child)
        task.wait(0.05)
        if child:IsA("PostEffect") or child:IsA("Atmosphere") or 
           child:IsA("Sky") or child:IsA("Clouds") then
            child:Destroy()
        end
    end)
    
    RunService.Heartbeat:Connect(MaintainLighting)
end

warn("✓ FPS Booster Loaded!")
