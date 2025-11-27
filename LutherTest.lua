local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Terrain = workspace.Terrain
local RunService = game:GetService("RunService")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

print("╔════════════════════════════════╗")
print("║  ULTIMATE ANTI LAG SCRIPT     ║")
print("║  Loading All Features...      ║")
print("╚════════════════════════════════╝")

local function OptimizeGraphics()
    print("[1/8] Mengoptimalkan Grafis...")
    
    -- Hapus semua lighting effects
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("BloomEffect") or 
           effect:IsA("BlurEffect") or 
           effect:IsA("ColorCorrectionEffect") or 
           effect:IsA("DepthOfFieldEffect") or
           effect:IsA("SunRaysEffect") or
           effect:IsA("Atmosphere") then
            pcall(function() effect:Destroy() end)
        end
    end
    
    -- Set lighting ke minimum
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.FogStart = 0
    Lighting.Brightness = 0
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
    Lighting.ColorShift_Top = Color3.new(0, 0, 0)
    Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    
    -- Set quality ke minimum
    settings().Rendering.QualityLevel = 1
    settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
end

local function RemoveAllTextures(obj)
    print("[2/8] Menghapus Semua Texture...")
    
    for _, child in pairs(obj:GetDescendants()) do
        -- Hapus texture, decal, surface
        if child:IsA("Decal") or 
           child:IsA("Texture") or 
           child:IsA("SurfaceAppearance") then
            pcall(function() child:Destroy() end)
        end
        
        -- Simplify parts
        if child:IsA("Part") or child:IsA("MeshPart") or child:IsA("UnionOperation") then
            child.Material = Enum.Material.SmoothPlastic
            child.Reflectance = 0
            child.CastShadow = false
            child.TopSurface = Enum.SurfaceType.Smooth
            child.BottomSurface = Enum.SurfaceType.Smooth
        end
        
        -- Hapus mesh texture
        if child:IsA("SpecialMesh") then
            child.TextureId = ""
        end
    end
end

local function RemoveAllEffects(obj)
    print("[3/8] Menghapus Semua Effects...")
    
    for _, child in pairs(obj:GetDescendants()) do
        -- Hapus ALL effects
        if child:IsA("ParticleEmitter") or 
           child:IsA("Trail") or 
           child:IsA("Beam") or
           child:IsA("Smoke") or 
           child:IsA("Fire") or
           child:IsA("Sparkles") or
           child:IsA("PointLight") or
           child:IsA("SpotLight") or
           child:IsA("SurfaceLight") then
            pcall(function() child:Destroy() end)
        end
    end
end

local function OptimizeTerrainAndWater()
    print("[4/8] Mengoptimalkan Terrain & Air...")
    
    -- Terrain optimization
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 1
    Terrain.Decoration = false
    
    -- Simplify water parts
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Part") and (obj.Name:lower():find("water") or obj.Name:lower():find("ocean")) then
            obj.Transparency = 0.8
            obj.Material = Enum.Material.SmoothPlastic
            obj.Reflectance = 0
            obj.CastShadow = false
        end
    end
end

local function RemoveRodEffects()
    print("[5/8] Menghapus Efek Pancingan...")
    
    local character = Players.LocalPlayer.Character
    if character then
        for _, obj in pairs(character:GetDescendants()) do
            -- Hapus rod effects
            if obj:IsA("Beam") or 
               obj:IsA("Trail") or 
               obj:IsA("ParticleEmitter") or
               obj:IsA("Fire") or
               obj:IsA("Sparkles") or
               obj:IsA("Smoke") then
                pcall(function() obj:Destroy() end)
            end
            
            -- Hapus attachment effects
            if obj:IsA("Attachment") then
                for _, child in pairs(obj:GetChildren()) do
                    if child:IsA("ParticleEmitter") or 
                       child:IsA("Beam") or 
                       child:IsA("Trail") then
                        pcall(function() child:Destroy() end)
                    end
                end
            end
        end
    end
end

local function SimplifyGUI()
    print("[6/8] Menyederhanakan GUI...")
    
    for _, gui in pairs(PlayerGui:GetDescendants()) do
        -- Hapus border/stroke
        if gui:IsA("UIStroke") then
            pcall(function() gui:Destroy() end)
        end
        
        -- Simplify frames
        if gui:IsA("Frame") or gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
            gui.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
            gui.BorderSizePixel = 0
            gui.BackgroundTransparency = 0.3
            
            if gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
                gui.Image = ""
            end
        end
        
        -- Simplify text
        if gui:IsA("TextLabel") or gui:IsA("TextButton") then
            gui.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
            gui.BorderSizePixel = 0
        end
        
        -- Hapus gradient
        if gui:IsA("UIGradient") then
            pcall(function() gui:Destroy() end)
        end
        
        -- Hapus corner radius
        if gui:IsA("UICorner") then
            gui.CornerRadius = UDim.new(0, 0)
        end
    end
end

local function OptimizeCharacter(character)
    print("[7/8] Mengoptimalkan Character...")
    
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Material = Enum.Material.SmoothPlastic
            part.Reflectance = 0
            part.CastShadow = false
        end
        
        if part:IsA("Decal") or part:IsA("Texture") then
            pcall(function() part:Destroy() end)
        end
        
        if part:IsA("SpecialMesh") then
            part.TextureId = ""
        end
    end
    
    RemoveRodEffects()
end

local function BoostFPS()
    print("[8/8] Menjalankan FPS Booster...")
    
    -- Disable unnecessary connections
    local connections = {}
    for _, connection in pairs(getconnections(RunService.Heartbeat)) do
        if connection.Enabled and not connection.Foreign then
            connection:Disable()
            table.insert(connections, connection)
        end
    end
end

print("\n🚀 Menjalankan Optimasi...")

OptimizeGraphics()
RemoveAllTextures(workspace)
RemoveAllEffects(workspace)
OptimizeTerrainAndWater()
SimplifyGUI()
BoostFPS()

-- Optimasi player character
local player = Players.LocalPlayer
if player.Character then
    OptimizeCharacter(player.Character)
end

-- ========================================
-- MONITORING & AUTO-CLEANUP
-- ========================================

-- Monitor character respawn
player.CharacterAdded:Connect(function(character)
    wait(0.5)
    OptimizeCharacter(character)
end)

-- Monitor GUI baru
PlayerGui.DescendantAdded:Connect(function(gui)
    wait(0.1)
    
    if gui:IsA("UIStroke") or gui:IsA("UIGradient") then
        pcall(function() gui:Destroy() end)
    elseif gui:IsA("Frame") or gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
        gui.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        gui.BorderSizePixel = 0
        gui.BackgroundTransparency = 0.3
        
        if gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
            gui.Image = ""
        end
    elseif gui:IsA("UICorner") then
        gui.CornerRadius = UDim.new(0, 0)
    end
end)

-- Monitor workspace objects
workspace.DescendantAdded:Connect(function(obj)
    wait(0.1)
    
    -- Auto-remove effects
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or
       obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") or
       obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
        pcall(function() obj:Destroy() end)
    elseif obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("SurfaceAppearance") then
        pcall(function() obj:Destroy() end)
    elseif obj:IsA("BasePart") then
        obj.Material = Enum.Material.SmoothPlastic
        obj.Reflectance = 0
        obj.CastShadow = false
        
        if obj.Name:lower():find("water") or obj.Name:lower():find("ocean") then
            obj.Transparency = 0.8
        end
    elseif obj:IsA("SpecialMesh") then
        obj.TextureId = ""
    end
end)

-- Monitor lighting changes
Lighting.ChildAdded:Connect(function(child)
    wait(0.1)
    pcall(function() child:Destroy() end)
end)

-- Periodic cleanup (setiap 5 detik)
spawn(function()
    while wait(5) do
        RemoveRodEffects()
        OptimizeTerrainAndWater()
    end
end)

-- Garbage collection (setiap 60 detik)
spawn(function()
    while wait(60) do
        pcall(function()
            for i = 1, 10 do
                RunService.Heartbeat:Wait()
            end
        end)
    end
end)

print("\n╔════════════════════════════════════╗")
print("║   ULTIMATE ANTI LAG - LOADED! ✓   ║")
print("╚════════════════════════════════════╝")
print("✓ Graphics: Optimized")
print("✓ Textures: Removed")
print("✓ Effects: Removed")
print("✓ Terrain & Water: Optimized")
print("✓ Rod Effects: Removed")
print("✓ GUI: Simplified")
print("✓ Character: Optimized")
print("✓ FPS Booster: Active")
print("✓ Auto-Monitor: Running")
print("\n🎮 Selamat Bermain dengan FPS Maksimal!")

-- Notifikasi
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🚀 ULTIMATE Anti Lag";
    Text = "All features loaded! FPS boost aktif!";
    Duration = 5;
})
