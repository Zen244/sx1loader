-- SenzX Optimizer Hub (With Image Asset MiniIcon)
-- Author: SenzX
-- Toggle Key: RightControl atau K

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

-- Clean UI Lama
local oldGui = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("SenzXOptimizerHub")
if oldGui then oldGui:Destroy() end

-- ScreenGui Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SenzXOptimizerHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame Window
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 340)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainUICorner = Instance.new("UICorner")
MainUICorner.CornerRadius = UDim.new(0, 10)
MainUICorner.Parent = MainFrame

local MainUIStroke = Instance.new("UIStroke")
MainUIStroke.Color = Color3.fromRGB(40, 40, 50)
MainUIStroke.Thickness = 1
MainUIStroke.Parent = MainFrame

-- Floating Mini Icon (Menggunakan ID Asset Roblox)
local MiniIcon = Instance.new("ImageButton")
MiniIcon.Name = "MiniIcon"
MiniIcon.Size = UDim2.new(0, 45, 0, 45)
MiniIcon.Position = UDim2.new(0.02, 0, 0.2, 0)
MiniIcon.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MiniIcon.Image = "rbxassetid://125375074853375"
MiniIcon.Visible = false
MiniIcon.Active = true
MiniIcon.Draggable = true
MiniIcon.Parent = ScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 10)
MiniCorner.Parent = MiniIcon

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Color3.fromRGB(129, 140, 248)
MiniStroke.Thickness = 1.5
MiniStroke.Parent = MiniIcon

MiniIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MiniIcon.Visible = false
end)

-- Keybind Toggle UI
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightControl or input.KeyCode == Enum.KeyCode.K then
        MainFrame.Visible = not MainFrame.Visible
        if MiniIcon.Visible then MiniIcon.Visible = false end
    end
end)

-- ==================== SIDEBAR ====================

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 140, 1, 0)
Sidebar.Position = UDim2.new(0, 0, 0, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Sidebar.BorderSizePixel = 0
Sidebar.ClipsDescendants = true
Sidebar.ZIndex = 2
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 10)
SidebarCorner.Parent = Sidebar

local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(1, -1, 0, 0)
SidebarLine.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
SidebarLine.BorderSizePixel = 0
SidebarLine.ZIndex = 3
SidebarLine.Parent = Sidebar

local BrandLabel = Instance.new("TextLabel")
BrandLabel.Size = UDim2.new(1, -20, 0, 30)
BrandLabel.Position = UDim2.new(0, 14, 0, 15)
BrandLabel.Text = "SENZX OPTIMIZER"
BrandLabel.TextColor3 = Color3.fromRGB(129, 140, 248)
BrandLabel.TextSize = 12
BrandLabel.Font = Enum.Font.GothamBold
BrandLabel.TextXAlignment = Enum.TextXAlignment.Left
BrandLabel.BackgroundTransparency = 1
BrandLabel.ZIndex = 3
BrandLabel.Parent = Sidebar

local SubBrandLabel = Instance.new("TextLabel")
SubBrandLabel.Size = UDim2.new(1, -20, 0, 15)
SubBrandLabel.Position = UDim2.new(0, 14, 0, 40)
SubBrandLabel.Text = "FPS & Performance Tweaks"
SubBrandLabel.TextColor3 = Color3.fromRGB(100, 116, 139)
SubBrandLabel.TextSize = 8
SubBrandLabel.Font = Enum.Font.GothamMedium
SubBrandLabel.TextXAlignment = Enum.TextXAlignment.Left
SubBrandLabel.BackgroundTransparency = 1
SubBrandLabel.ZIndex = 3
SubBrandLabel.Parent = Sidebar

local TabList = Instance.new("Frame")
TabList.Size = UDim2.new(1, -16, 1, -80)
TabList.Position = UDim2.new(0, 8, 0, 68)
TabList.BackgroundTransparency = 1
TabList.ZIndex = 3
TabList.Parent = Sidebar

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 8)
TabListLayout.Parent = TabList

-- ==================== HEADER ====================

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, -140, 0, 45)
Header.Position = UDim2.new(0, 140, 0, 0)
Header.BackgroundTransparency = 1
Header.ZIndex = 2
Header.Parent = MainFrame

local TabTitle = Instance.new("TextLabel")
TabTitle.Name = "TabTitle"
TabTitle.Size = UDim2.new(1, -120, 1, 0)
TabTitle.Position = UDim2.new(0, 16, 0, 0)
TabTitle.Text = ""
TabTitle.TextColor3 = Color3.fromRGB(241, 245, 249)
TabTitle.TextSize = 14
TabTitle.Font = Enum.Font.GothamBold
TabTitle.TextXAlignment = Enum.TextXAlignment.Left
TabTitle.BackgroundTransparency = 1
TabTitle.ZIndex = 2
TabTitle.Parent = Header

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -34, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
CloseBtn.BackgroundTransparency = 0.8
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(239, 68, 68)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.ZIndex = 3
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Minimize Button
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 24, 0, 24)
MinimizeBtn.Position = UDim2.new(1, -64, 0, 10)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(148, 163, 184)
MinimizeBtn.BackgroundTransparency = 0.8
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(226, 232, 240)
MinimizeBtn.TextSize = 16
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.ZIndex = 3
MinimizeBtn.Parent = Header

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeBtn

MinimizeBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniIcon.Visible = true
end)

-- ==================== CONTENT PANEL ====================

local ContentPanel = Instance.new("Frame")
ContentPanel.Name = "ContentPanel"
ContentPanel.Size = UDim2.new(1, -148, 1, -52)
ContentPanel.Position = UDim2.new(0, 144, 0, 48)
ContentPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ContentPanel.BorderSizePixel = 0
ContentPanel.ZIndex = 2
ContentPanel.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentPanel

local ContentStroke = Instance.new("UIStroke")
ContentStroke.Color = Color3.fromRGB(20, 20, 25)
ContentStroke.Thickness = 1
ContentStroke.Parent = ContentPanel

local PagesFolder = Instance.new("Folder")
PagesFolder.Name = "Pages"
PagesFolder.Parent = ContentPanel

local tabs = {}
local firstTabCreated = false

local INACTIVE_BG = Color3.fromRGB(12, 12, 16)
local ACTIVE_BG = Color3.fromRGB(79, 70, 229)
local INACTIVE_TEXT = Color3.fromRGB(148, 163, 184)
local ACTIVE_TEXT = Color3.fromRGB(255, 255, 255)

-- ==================== UI BUILDER FUNCTIONS ====================

local function AddTab(tabName)
    local Page = Instance.new("ScrollingFrame")
    Page.Name = tabName .. "Page"
    Page.Size = UDim2.new(1, -8, 1, -8)
    Page.Position = UDim2.new(0, 4, 0, 4)
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 2
    Page.ScrollBarImageColor3 = Color3.fromRGB(129, 140, 248)
    Page.Visible = false
    Page.ZIndex = 3
    Page.Parent = PagesFolder

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 6)
    PageLayout.Parent = Page

    PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
    end)

    local TabCard = Instance.new("TextButton")
    TabCard.Name = tabName .. "TabCard"
    TabCard.Size = UDim2.new(1, 0, 0, 34)
    TabCard.BackgroundColor3 = INACTIVE_BG
    TabCard.BorderSizePixel = 0
    TabCard.Text = "   " .. tabName
    TabCard.TextColor3 = INACTIVE_TEXT
    TabCard.TextSize = 11
    TabCard.Font = Enum.Font.GothamMedium
    TabCard.TextXAlignment = Enum.TextXAlignment.Left
    TabCard.AutoButtonColor = false
    TabCard.ZIndex = 4
    TabCard.Parent = TabList

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = TabCard

    local TabStroke = Instance.new("UIStroke")
    TabStroke.Color = Color3.fromRGB(25, 25, 32)
    TabStroke.Thickness = 1
    TabStroke.Parent = TabCard

    TabCard.MouseButton1Click:Connect(function()
        TweenService:Create(TabCard, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0.95, 0, 0, 31)
        }):Play()
        
        task.wait(0.08)
        
        TweenService:Create(TabCard, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 0, 34)
        }):Play()

        for name, data in pairs(tabs) do
            data.Page.Visible = false
            TweenService:Create(data.Card, TweenInfo.new(0.2), {
                BackgroundColor3 = INACTIVE_BG,
                TextColor3 = INACTIVE_TEXT
            }):Play()
            TweenService:Create(data.Stroke, TweenInfo.new(0.2), {
                Color = Color3.fromRGB(25, 25, 32)
            }):Play()
        end

        Page.Visible = true
        TabTitle.Text = tabName
        TweenService:Create(TabCard, TweenInfo.new(0.2), {
            BackgroundColor3 = ACTIVE_BG,
            TextColor3 = ACTIVE_TEXT
        }):Play()
        TweenService:Create(TabStroke, TweenInfo.new(0.2), {
            Color = Color3.fromRGB(129, 140, 248)
        }):Play()
    end)

    tabs[tabName] = {Page = Page, Card = TabCard, Stroke = TabStroke}

    if not firstTabCreated then
        firstTabCreated = true
        Page.Visible = true
        TabTitle.Text = tabName
        TabCard.BackgroundColor3 = ACTIVE_BG
        TabCard.TextColor3 = ACTIVE_TEXT
        TabStroke.Color = Color3.fromRGB(129, 140, 248)
    end

    return Page
end

local function AddToggle(page, name, callback)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(1, -12, 0, 36)
    Row.BackgroundTransparency = 1
    Row.BorderSizePixel = 0
    Row.ZIndex = 3
    Row.Parent = page

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Position = UDim2.new(0, 8, 0, 0)
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(226, 232, 240)
    Label.TextSize = 11
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.BackgroundTransparency = 1
    Label.ZIndex = 3
    Label.Parent = Row

    local SwitchBG = Instance.new("TextButton")
    SwitchBG.Size = UDim2.new(0, 38, 0, 18)
    SwitchBG.Position = UDim2.new(1, -44, 0.5, -9)
    SwitchBG.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    SwitchBG.BorderSizePixel = 0
    SwitchBG.Text = ""
    SwitchBG.AutoButtonColor = false
    SwitchBG.ZIndex = 3
    SwitchBG.Parent = Row

    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = SwitchBG

    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 12, 0, 12)
    Knob.Position = UDim2.new(0, 3, 0.5, -6)
    Knob.BackgroundColor3 = Color3.fromRGB(148, 163, 184)
    Knob.BorderSizePixel = 0
    Knob.ZIndex = 4
    Knob.Parent = SwitchBG

    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob

    local toggled = false

    SwitchBG.MouseButton1Click:Connect(function()
        toggled = not toggled
        
        local targetPos = toggled and UDim2.new(1, -15, 0.5, -6) or UDim2.new(0, 3, 0.5, -6)
        local targetBgColor = toggled and Color3.fromRGB(129, 140, 248) or Color3.fromRGB(25, 25, 32)
        local targetKnobColor = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(148, 163, 184)

        Knob:TweenPosition(targetPos, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.15, true)
        TweenService:Create(SwitchBG, TweenInfo.new(0.15), {BackgroundColor3 = targetBgColor}):Play()
        TweenService:Create(Knob, TweenInfo.new(0.15), {BackgroundColor3 = targetKnobColor}):Play()

        task.spawn(function()
            callback(toggled)
        end)
    end)
end

local function AddInfoLabel(page, text, color, isBold)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -12, 0, 20)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = color or Color3.fromRGB(226, 232, 240)
    Label.TextSize = 11
    Label.Font = isBold and Enum.Font.GothamBold or Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 3
    Label.Parent = page
    return Label
end

local origGlobalShadows = Lighting.GlobalShadows
local origFogEnd = Lighting.FogEnd


-- =========================================================================
--                     PEMANGGULAN TAB & TOGGLE
-- =========================================================================

-- ----- TAB 1: GRAPHICS -----
local GraphicsPage = AddTab("Graphics")

AddToggle(GraphicsPage, "Disable Shadows (Matikan Bayangan)", function(state)
    Lighting.GlobalShadows = not state
end)

AddToggle(GraphicsPage, "Remove Fog (Hapus Kabut)", function(state)
    Lighting.FogEnd = state and 9e9 or origFogEnd
end)

AddToggle(GraphicsPage, "Low Quality Materials (Smooth World)", function(state)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and not obj:IsA("MeshPart") then
            if state then
                if not obj:FindFirstChild("OrigMat") then
                    local val = Instance.new("StringValue")
                    val.Name = "OrigMat"
                    val.Value = obj.Material.Name
                    val.Parent = obj
                end
                obj.Material = Enum.Material.SmoothPlastic
            else
                local orig = obj:FindFirstChild("OrigMat")
                if orig then pcall(function() obj.Material = Enum.Material[orig.Value] end) end
            end
        end
    end
end)

AddToggle(GraphicsPage, "Remove Decals & Textures", function(state)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = state and 1 or 0
        end
    end
end)


-- ----- TAB 2: EFFECTS -----
local EffectsPage = AddTab("Effects")

AddToggle(EffectsPage, "Disable Particles (Fire/Smoke)", function(state)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
            obj.Enabled = not state
        end
    end
end)

AddToggle(EffectsPage, "Disable Lighting Post-Effects", function(state)
    for _, effect in ipairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") then
            effect.Enabled = not state
        end
    end
end)


-- ----- TAB 3: DISPLAY -----
local DisplayPage = AddTab("Display")

AddToggle(DisplayPage, "Fullbright (Pencahayaan Konstan)", function(state)
    Lighting.Brightness = state and 2 or 1
    Lighting.ClockTime = state and 14 or 12
    Lighting.FogEnd = state and 100000 or origFogEnd
end)


-- ----- TAB 4: INFO -----
local InfoPage = AddTab("Info")

AddInfoLabel(InfoPage, "• Username: " .. LocalPlayer.Name, Color3.fromRGB(200, 200, 210), false)
AddInfoLabel(InfoPage, "• Display Name: " .. LocalPlayer.DisplayName, Color3.fromRGB(200, 200, 210), false)
AddInfoLabel(InfoPage, "• User ID: " .. tostring(LocalPlayer.UserId), Color3.fromRGB(200, 200, 210), false)
AddInfoLabel(InfoPage, "• Account Age: " .. tostring(LocalPlayer.AccountAge) .. " days", Color3.fromRGB(200, 200, 210), false)

local healthLabel = AddInfoLabel(InfoPage, "• Health: Loading...", Color3.fromRGB(200, 200, 210), false)

task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            healthLabel.Text = "• Health: " .. math.floor(hum.Health) .. " / " .. math.floor(hum.MaxHealth)
        else
            healthLabel.Text = "• Health: N/A"
        end
        task.wait(0.5)
    end
end)

AddInfoLabel(InfoPage, "", Color3.fromRGB(0, 0, 0), false)

AddInfoLabel(InfoPage, "• Name: SenzX Optimizer Hub", Color3.fromRGB(200, 200, 210), false)
AddInfoLabel(InfoPage, "• Version: v2.1 (Pure Black Edition)", Color3.fromRGB(200, 200, 210), false)
AddInfoLabel(InfoPage, "• Status: Active & Operational", Color3.fromRGB(34, 197, 94), false)

AddInfoLabel(InfoPage, "", Color3.fromRGB(0, 0, 0), false)

AddInfoLabel(InfoPage, "• Lead Developer: SenzX", Color3.fromRGB(200, 200, 210), false)
AddInfoLabel(InfoPage, "• Core Features: Performance Booster & UI Cleaner", Color3.fromRGB(200, 200, 210), false)
AddInfoLabel(InfoPage, "• Toggle Keybind: [ Right Control ] or [ K ]", Color3.fromRGB(200, 200, 210), false)
