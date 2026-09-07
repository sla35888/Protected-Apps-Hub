local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local collapsedSize = UDim2.new(1, -16, 0, 44)
local collapsedPosition = UDim2.new(0, 8, 1, -56)
local idlePosition = UDim2.new(0, 8, 1, -12)
local expandedSize = UDim2.new(1, -16, 0, 320)
local expandedPosition = UDim2.new(0, 8, 0.5, -160)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OptimizedHubGui"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 2147483647
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = collapsedSize
mainFrame.Position = collapsedPosition
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.35
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

local idleHitbox = Instance.new("TextButton")
idleHitbox.Name = "IdleHitbox"
idleHitbox.Size = UDim2.new(1, 0, 1, 0)
idleHitbox.BackgroundTransparency = 1
idleHitbox.Text = ""
idleHitbox.ZIndex = 100
idleHitbox.Visible = false
idleHitbox.Parent = mainFrame

local contentWindow = Instance.new("Frame")
contentWindow.Name = "ContentWindow"
contentWindow.Size = UDim2.new(1, -16, 0, 320)
contentWindow.Position = UDim2.new(0, 8, 0.5, -160)
contentWindow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
contentWindow.BackgroundTransparency = 1
contentWindow.BorderSizePixel = 0
contentWindow.ClipsDescendants = true
contentWindow.Visible = false
contentWindow.Active = true
contentWindow.Parent = screenGui

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentWindow

local actionButton = Instance.new("TextButton")
actionButton.Name = "ActionButton"
actionButton.Size = UDim2.new(0, 36, 0, 36)
actionButton.Position = UDim2.new(0, 4, 0.5, -18)
actionButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
actionButton.BackgroundTransparency = 0
actionButton.Text = ""
actionButton.AutoButtonColor = false
actionButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = actionButton

local buttonImage = Instance.new("ImageLabel")
buttonImage.Name = "ButtonImage"
buttonImage.Size = UDim2.new(0, 20, 0, 20)
buttonImage.Position = UDim2.new(0.5, -10, 0.5, -10)
buttonImage.BackgroundTransparency = 1
buttonImage.Image = "rbxassetid://131431650384842"
buttonImage.Parent = actionButton

local appsScroll = Instance.new("ScrollingFrame")
appsScroll.Name = "AppsScroll"
appsScroll.Size = UDim2.new(1, -250, 1, 0)
appsScroll.Position = UDim2.new(0, 46, 0, 0)
appsScroll.BackgroundTransparency = 1
appsScroll.BorderSizePixel = 0
appsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
appsScroll.ScrollBarThickness = 0
appsScroll.ScrollingDirection = Enum.ScrollingDirection.X
appsScroll.Active = true
appsScroll.Parent = mainFrame

local appsListLayout = Instance.new("UIListLayout")
appsListLayout.FillDirection = Enum.FillDirection.Horizontal
appsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
appsListLayout.Padding = UDim.new(0, 8)
appsListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
appsListLayout.Parent = appsScroll

local monitorButton = Instance.new("TextButton")
monitorButton.Name = "MonitorButton"
monitorButton.Size = UDim2.new(0, 32, 0, 32)
monitorButton.Position = UDim2.new(1, -276, 0.5, -16)
monitorButton.BackgroundTransparency = 1
monitorButton.Font = Enum.Font.Code
monitorButton.Text = "?"
monitorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
monitorButton.TextScaled = true
monitorButton.Parent = mainFrame

local plusButton = Instance.new("TextButton")
plusButton.Name = "PlusButton"
plusButton.Size = UDim2.new(0, 32, 0, 32)
plusButton.Position = UDim2.new(1, -240, 0.5, -16)
plusButton.BackgroundTransparency = 1
plusButton.Font = Enum.Font.Code
plusButton.Text = "+"
plusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
plusButton.TextScaled = true
plusButton.Parent = mainFrame

local trendingButton = Instance.new("TextButton")
trendingButton.Name = "TrendingButton"
trendingButton.Size = UDim2.new(0, 110, 0, 32)
trendingButton.Position = UDim2.new(1, -204, 0.5, -16)
trendingButton.BackgroundTransparency = 1
trendingButton.Font = Enum.Font.Code
trendingButton.Text = "Trending scripts"
trendingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
trendingButton.TextSize = 12
trendingButton.Parent = mainFrame

local pingImage = Instance.new("ImageLabel")
pingImage.Name = "PingImage"
pingImage.Size = UDim2.new(0, 18, 0, 18)
pingImage.Position = UDim2.new(1, -85, 0.5, -9)
pingImage.BackgroundTransparency = 1
pingImage.Image = "rbxassetid://9512524704"
pingImage.Parent = mainFrame

local weatherContainer = Instance.new("TextButton")
weatherContainer.Name = "WeatherContainer"
weatherContainer.Size = UDim2.new(0, 60, 1, 0)
weatherContainer.Position = UDim2.new(1, -64, 0, 0)
weatherContainer.BackgroundTransparency = 1
weatherContainer.Text = ""
weatherContainer.AutoButtonColor = false
weatherContainer.Parent = mainFrame

local weatherIcon = Instance.new("ImageLabel")
weatherIcon.Name = "WeatherIcon"
weatherIcon.Size = UDim2.new(0, 20, 0, 20)
weatherIcon.Position = UDim2.new(0, 0, 0.5, -10)
weatherIcon.BackgroundTransparency = 1
weatherIcon.Image = "rbxassetid://82410735894036"
weatherIcon.Parent = weatherContainer

local weatherLabel = Instance.new("TextLabel")
weatherLabel.Name = "WeatherLabel"
weatherLabel.Size = UDim2.new(0, 30, 1, 0)
weatherLabel.Position = UDim2.new(0, 24, 0, 0)
weatherLabel.BackgroundTransparency = 1
weatherLabel.Font = Enum.Font.Code
weatherLabel.Text = "--°"
weatherLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
weatherLabel.TextSize = 12
weatherLabel.TextXAlignment = Enum.TextXAlignment.Left
weatherLabel.Parent = weatherContainer

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 32)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundTransparency = 1
topBar.BorderSizePixel = 0
topBar.Visible = false
topBar.Parent = contentWindow

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.Code
titleLabel.Text = "Apps Protection"
titleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
titleLabel.TextSize = 12
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 28, 0, 28)
closeButton.Position = UDim2.new(1, -30, 0, 2)
closeButton.BackgroundTransparency = 1
closeButton.Font = Enum.Font.Code
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(180, 50, 50)
closeButton.TextSize = 14
closeButton.Parent = topBar

local codeBox = Instance.new("TextBox")
codeBox.Name = "CodeBox"
codeBox.Size = UDim2.new(1, -16, 1, -84)
codeBox.Position = UDim2.new(0, 8, 0, 38)
codeBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
codeBox.BorderSizePixel = 0
codeBox.ClearTextOnFocus = false
codeBox.Font = Enum.Font.Code
codeBox.MultiLine = true
codeBox.PlaceholderText = "Paste script here..."
codeBox.Text = ""
codeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
codeBox.TextSize = 12
codeBox.TextXAlignment = Enum.TextXAlignment.Left
codeBox.TextYAlignment = Enum.TextYAlignment.Top
codeBox.Visible = false
codeBox.Parent = contentWindow

local codeCorner = Instance.new("UICorner")
codeCorner.CornerRadius = UDim.new(0, 6)
codeCorner.Parent = codeBox

local controlPanel = Instance.new("Frame")
controlPanel.Name = "ControlPanel"
controlPanel.Size = UDim2.new(1, -16, 0, 30)
controlPanel.Position = UDim2.new(0, 8, 1, -36)
controlPanel.BackgroundTransparency = 1
controlPanel.Visible = false
controlPanel.Parent = contentWindow

local weatherMainFrame = Instance.new("Frame")
weatherMainFrame.Name = "WeatherMainFrame"
weatherMainFrame.Size = UDim2.new(1, -16, 1, -48)
weatherMainFrame.Position = UDim2.new(0, 8, 0, 40)
weatherMainFrame.BackgroundTransparency = 1
weatherMainFrame.Visible = false
weatherMainFrame.Parent = contentWindow

local searchBox = Instance.new("TextBox")
searchBox.Name = "SearchBox"
searchBox.Size = UDim2.new(1, 0, 0, 28)
searchBox.Position = UDim2.new(0, 0, 0, 0)
searchBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
searchBox.BorderSizePixel = 0
searchBox.Font = Enum.Font.Code
searchBox.PlaceholderText = "Search city, country..."
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.TextSize = 12
searchBox.Parent = weatherMainFrame

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 6)
searchCorner.Parent = searchBox

local weatherScroll = Instance.new("ScrollingFrame")
weatherScroll.Name = "WeatherScroll"
weatherScroll.Size = UDim2.new(1, 0, 1, -34)
weatherScroll.Position = UDim2.new(0, 0, 0, 34)
weatherScroll.BackgroundTransparency = 1
weatherScroll.BorderSizePixel = 0
weatherScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
weatherScroll.ScrollBarThickness = 4
weatherScroll.Active = true
weatherScroll.Parent = weatherMainFrame

local weatherListLayout = Instance.new("UIListLayout")
weatherListLayout.SortOrder = Enum.SortOrder.LayoutOrder
weatherListLayout.Padding = UDim.new(0, 8)
weatherListLayout.Parent = weatherScroll

local monitorMainFrame = Instance.new("Frame")
monitorMainFrame.Name = "MonitorMainFrame"
monitorMainFrame.Size = UDim2.new(1, -16, 1, -48)
monitorMainFrame.Position = UDim2.new(0, 8, 0, 40)
monitorMainFrame.BackgroundTransparency = 1
monitorMainFrame.Visible = false
monitorMainFrame.Parent = contentWindow

local monitorListFrame = Instance.new("ScrollingFrame")
monitorListFrame.Name = "MonitorListFrame"
monitorListFrame.Size = UDim2.new(0, 110, 1, 0)
monitorListFrame.Position = UDim2.new(0, 0, 0, 0)
monitorListFrame.BackgroundTransparency = 1
monitorListFrame.BorderSizePixel = 0
monitorListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
monitorListFrame.ScrollBarThickness = 2
monitorListFrame.Parent = monitorMainFrame

local monitorListLayout = Instance.new("UIListLayout")
monitorListLayout.SortOrder = Enum.SortOrder.LayoutOrder
monitorListLayout.Padding = UDim.new(0, 4)
monitorListLayout.Parent = monitorListFrame

local monitorGraphContainer = Instance.new("Frame")
monitorGraphContainer.Name = "MonitorGraphContainer"
monitorGraphContainer.Size = UDim2.new(1, -120, 1, -55)
monitorGraphContainer.Position = UDim2.new(0, 120, 0, 0)
monitorGraphContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
monitorGraphContainer.BorderSizePixel = 0
monitorGraphContainer.Parent = monitorMainFrame

local monitorGraphCorner = Instance.new("UICorner")
monitorGraphCorner.CornerRadius = UDim.new(0, 6)
monitorGraphCorner.Parent = monitorGraphContainer

local monitorGraphLine = Instance.new("Frame")
monitorGraphLine.Name = "MonitorGraphLine"
monitorGraphLine.Size = UDim2.new(1, 0, 1, 0)
monitorGraphLine.BackgroundTransparency = 1
monitorGraphLine.Parent = monitorGraphContainer

local monitorInfoBlock = Instance.new("TextLabel")
monitorInfoBlock.Name = "MonitorInfoBlock"
monitorInfoBlock.Size = UDim2.new(1, -120, 0, 50)
monitorInfoBlock.Position = UDim2.new(0, 120, 1, -50)
monitorInfoBlock.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
monitorInfoBlock.BorderSizePixel = 0
monitorInfoBlock.Font = Enum.Font.Code
monitorInfoBlock.Text = "RAM Usage: 0%"
monitorInfoBlock.TextColor3 = Color3.fromRGB(220, 220, 220)
monitorInfoBlock.TextSize = 11
monitorInfoBlock.TextWrapped = true
monitorInfoBlock.TextXAlignment = Enum.TextXAlignment.Left
monitorInfoBlock.TextYAlignment = Enum.TextYAlignment.Top
monitorInfoBlock.Parent = monitorMainFrame

local monitorInfoCorner = Instance.new("UICorner")
monitorInfoCorner.CornerRadius = UDim.new(0, 6)
monitorInfoCorner.Parent = monitorInfoBlock

local dayDetailFrame = Instance.new("Frame")
dayDetailFrame.Name = "DayDetailFrame"
dayDetailFrame.Size = UDim2.new(1, 0, 1, 0)
dayDetailFrame.Position = UDim2.new(0, 0, 0, 0)
dayDetailFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
dayDetailFrame.BorderSizePixel = 0
dayDetailFrame.Visible = false
dayDetailFrame.ZIndex = 10
dayDetailFrame.Parent = weatherMainFrame

local detailCorner = Instance.new("UICorner")
detailCorner.CornerRadius = UDim.new(0, 6)
detailCorner.Parent = dayDetailFrame

local detailTopBar = Instance.new("Frame")
detailTopBar.Size = UDim2.new(1, 0, 0, 28)
detailTopBar.BackgroundTransparency = 1
detailTopBar.Parent = dayDetailFrame

local detailBackBtn = Instance.new("TextButton")
detailBackBtn.Size = UDim2.new(0, 50, 0, 24)
detailBackBtn.Position = UDim2.new(0, 4, 0, 2)
detailBackBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
detailBackBtn.Font = Enum.Font.Code
detailBackBtn.Text = "< Back"
detailBackBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
detailBackBtn.TextSize = 11
detailBackBtn.AutoButtonColor = true
local backCorner = Instance.new("UICorner")
backCorner.CornerRadius = UDim.new(0, 4)
backCorner.Parent = detailBackBtn
detailBackBtn.Parent = detailTopBar

local detailTitle = Instance.new("TextLabel")
detailTitle.Size = UDim2.new(1, -60, 1, 0)
detailTitle.Position = UDim2.new(0, 60, 0, 0)
detailTitle.BackgroundTransparency = 1
detailTitle.Font = Enum.Font.Code
detailTitle.Text = "Hourly Forecast"
detailTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
detailTitle.TextSize = 12
detailTitle.TextXAlignment = Enum.TextXAlignment.Left
detailTitle.Parent = detailTopBar

local detailScroll = Instance.new("ScrollingFrame")
detailScroll.Size = UDim2.new(1, -8, 1, -34)
detailScroll.Position = UDim2.new(0, 4, 0, 32)
detailScroll.BackgroundTransparency = 1
detailScroll.BorderSizePixel = 0
detailScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
detailScroll.ScrollBarThickness = 2
detailScroll.ScrollingDirection = Enum.ScrollingDirection.X
detailScroll.Active = true
detailScroll.Parent = dayDetailFrame

local detailLayout = Instance.new("UIListLayout")
detailLayout.FillDirection = Enum.FillDirection.Horizontal
detailLayout.SortOrder = Enum.SortOrder.LayoutOrder
detailLayout.Padding = UDim.new(0, 6)
detailLayout.Parent = detailScroll

detailBackBtn.MouseButton1Click:Connect(function()
	dayDetailFrame.Visible = false
	weatherScroll.Visible = true
	searchBox.Visible = true
end)

local trendingMainFrame = Instance.new("Frame")
trendingMainFrame.Name = "TrendingMainFrame"
trendingMainFrame.Size = UDim2.new(1, -16, 1, -48)
trendingMainFrame.Position = UDim2.new(0, 8, 0, 40)
trendingMainFrame.BackgroundTransparency = 1
trendingMainFrame.Visible = false
trendingMainFrame.Parent = contentWindow

local trendingScroll = Instance.new("ScrollingFrame")
trendingScroll.Size = UDim2.new(1, 0, 1, 0)
trendingScroll.Position = UDim2.new(0, 0, 0, 0)
trendingScroll.BackgroundTransparency = 1
trendingScroll.BorderSizePixel = 0
trendingScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
trendingScroll.ScrollBarThickness = 4
trendingScroll.Active = true
trendingScroll.Parent = trendingMainFrame

local trendingListLayout = Instance.new("UIListLayout")
trendingListLayout.SortOrder = Enum.SortOrder.LayoutOrder
trendingListLayout.Padding = UDim.new(0, 6)
trendingListLayout.Parent = trendingScroll

local executeConfirmFrame = Instance.new("Frame")
executeConfirmFrame.Name = "ExecuteConfirmFrame"
executeConfirmFrame.Size = UDim2.new(1, -16, 1, -48)
executeConfirmFrame.Position = UDim2.new(0, 8, 0, 40)
executeConfirmFrame.BackgroundTransparency = 1
executeConfirmFrame.Visible = false
executeConfirmFrame.Parent = contentWindow

local ecTextBox = Instance.new("TextBox")
ecTextBox.Size = UDim2.new(1, 0, 1, -44)
ecTextBox.Position = UDim2.new(0, 0, 0, 0)
ecTextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ecTextBox.BorderSizePixel = 0
ecTextBox.Font = Enum.Font.Code
ecTextBox.Text = ""
ecTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ecTextBox.TextSize = 12
ecTextBox.TextXAlignment = Enum.TextXAlignment.Left
ecTextBox.TextYAlignment = Enum.TextYAlignment.Top
ecTextBox.MultiLine = true
ecTextBox.ClearTextOnFocus = false
ecTextBox.Parent = executeConfirmFrame

local ecTextCorner = Instance.new("UICorner")
ecTextCorner.CornerRadius = UDim.new(0, 6)
ecTextCorner.Parent = ecTextBox

local ecNevermind = Instance.new("TextButton")
ecNevermind.Name = "EcNevermind"
ecNevermind.Size = UDim2.new(0.48, 0, 0, 32)
ecNevermind.Position = UDim2.new(0, 0, 1, -36)
ecNevermind.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ecNevermind.Font = Enum.Font.Code
ecNevermind.Text = "Nevermind"
ecNevermind.TextColor3 = Color3.fromRGB(255, 255, 255)
ecNevermind.TextSize = 12
ecNevermind.AutoButtonColor = true
local ecNevermindCorner = Instance.new("UICorner")
ecNevermindCorner.CornerRadius = UDim.new(0, 6)
ecNevermindCorner.Parent = ecNevermind
ecNevermind.Parent = executeConfirmFrame

local ecOkay = Instance.new("TextButton")
ecOkay.Name = "EcOkay"
ecOkay.Size = UDim2.new(0.48, 0, 0, 32)
ecOkay.Position = UDim2.new(0.52, 0, 1, -36)
ecOkay.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ecOkay.Font = Enum.Font.Code
ecOkay.Text = "Okay"
ecOkay.TextColor3 = Color3.fromRGB(255, 255, 255)
ecOkay.TextSize = 12
ecOkay.AutoButtonColor = true
local ecOkayCorner = Instance.new("UICorner")
ecOkayCorner.CornerRadius = UDim.new(0, 6)
ecOkayCorner.Parent = ecOkay
ecOkay.Parent = executeConfirmFrame

local appCreatorMain = Instance.new("Frame")
appCreatorMain.Name = "AppCreatorMain"
appCreatorMain.Size = UDim2.new(1, -16, 1, -48)
appCreatorMain.Position = UDim2.new(0, 8, 0, 40)
appCreatorMain.BackgroundTransparency = 1
appCreatorMain.Visible = false
appCreatorMain.Parent = contentWindow

local acScroll = Instance.new("ScrollingFrame")
acScroll.Size = UDim2.new(1, 0, 1, 0)
acScroll.Position = UDim2.new(0, 0, 0, 0)
acScroll.BackgroundTransparency = 1
acScroll.BorderSizePixel = 0
acScroll.CanvasSize = UDim2.new(0, 0, 0, 300)
acScroll.ScrollBarThickness = 4
acScroll.Active = true
acScroll.Parent = appCreatorMain

local acListLayout = Instance.new("UIListLayout")
acListLayout.SortOrder = Enum.SortOrder.LayoutOrder
acListLayout.Padding = UDim.new(0, 12)
acListLayout.Parent = acScroll

local acWelcome = Instance.new("TextLabel")
acWelcome.Size = UDim2.new(1, 0, 0, 60)
acWelcome.BackgroundTransparency = 1
acWelcome.Font = Enum.Font.Code
acWelcome.Text = "Welcome to App Creator! Configure your script code, title, and app icon below."
acWelcome.TextColor3 = Color3.fromRGB(180, 180, 180)
acWelcome.TextSize = 11
acWelcome.TextWrapped = true
acWelcome.TextXAlignment = Enum.TextXAlignment.Left
acWelcome.TextYAlignment = Enum.TextYAlignment.Top
acWelcome.Parent = acScroll

local acStep1 = Instance.new("TextLabel")
acStep1.Size = UDim2.new(1, 0, 0, 16)
acStep1.BackgroundTransparency = 1
acStep1.Font = Enum.Font.Code
acStep1.Text = "1. Configure the folders (mandatory)"
acStep1.TextColor3 = Color3.fromRGB(220, 220, 220)
acStep1.TextSize = 12
acStep1.TextXAlignment = Enum.TextXAlignment.Left
acStep1.Parent = acScroll

local function createButton(name, text, color)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Size = UDim2.new(0.32, 0, 1, 0)
	btn.BackgroundColor3 = color
	btn.Font = Enum.Font.Code
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 12
	btn.AutoButtonColor = true
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn
	return btn
end

local acFolderBtn = createButton("FolderBtn", "Folders", Color3.fromRGB(15, 15, 15))
acFolderBtn.Size = UDim2.new(0, 120, 0, 28)
acFolderBtn.Parent = acScroll

local acStep2 = Instance.new("TextLabel")
acStep2.Size = UDim2.new(1, 0, 0, 16)
acStep2.BackgroundTransparency = 1
acStep2.Font = Enum.Font.Code
acStep2.Text = "2. Put the App Name (mandatory)"
acStep2.TextColor3 = Color3.fromRGB(220, 220, 220)
acStep2.TextSize = 12
acStep2.TextXAlignment = Enum.TextXAlignment.Left
acStep2.Parent = acScroll

local acNameInput = Instance.new("TextBox")
acNameInput.Size = UDim2.new(1, 0, 0, 28)
acNameInput.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
acNameInput.BorderSizePixel = 0
acNameInput.Font = Enum.Font.Code
acNameInput.Text = ""
acNameInput.PlaceholderText = "App Name"
acNameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
acNameInput.TextSize = 12
acNameInput.Parent = acScroll
local acNameCorner = Instance.new("UICorner")
acNameCorner.CornerRadius = UDim.new(0, 6)
acNameCorner.Parent = acNameInput

local acStep3 = Instance.new("TextLabel")
acStep3.Size = UDim2.new(1, 0, 0, 16)
acStep3.BackgroundTransparency = 1
acStep3.Font = Enum.Font.Code
acStep3.Text = "3. Put the App Image Decal ID (optional)"
acStep3.TextColor3 = Color3.fromRGB(220, 220, 220)
acStep3.TextSize = 12
acStep3.TextXAlignment = Enum.TextXAlignment.Left
acStep3.Parent = acScroll

local acImageInput = Instance.new("TextBox")
acImageInput.Size = UDim2.new(1, 0, 0, 28)
acImageInput.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
acImageInput.BorderSizePixel = 0
acImageInput.Font = Enum.Font.Code
acImageInput.Text = ""
acImageInput.PlaceholderText = "Decal ID"
acImageInput.TextColor3 = Color3.fromRGB(255, 255, 255)
acImageInput.TextSize = 12
acImageInput.Parent = acScroll
local acImageCorner = Instance.new("UICorner")
acImageCorner.CornerRadius = UDim.new(0, 6)
acImageCorner.Parent = acImageInput

local acCreateBtn = createButton("CreateBtn", "Create", Color3.fromRGB(15, 15, 15))
acCreateBtn.Size = UDim2.new(1, 0, 0, 36)
acCreateBtn.Parent = acScroll

local folderMain = Instance.new("Frame")
folderMain.Size = UDim2.new(1, -16, 1, -48)
folderMain.Position = UDim2.new(0, 8, 0, 40)
folderMain.BackgroundTransparency = 1
folderMain.Visible = false
folderMain.Parent = contentWindow

local fmScroll = Instance.new("ScrollingFrame")
fmScroll.Size = UDim2.new(1, 0, 1, -36)
fmScroll.Position = UDim2.new(0, 0, 0, 0)
fmScroll.BackgroundTransparency = 1
fmScroll.BorderSizePixel = 0
fmScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
fmScroll.ScrollBarThickness = 4
fmScroll.Active = true
fmScroll.Parent = folderMain

local fmListLayout = Instance.new("UIListLayout")
fmListLayout.SortOrder = Enum.SortOrder.LayoutOrder
fmListLayout.Parent = fmScroll

local fmBack = createButton("FmBack", "Back", Color3.fromRGB(15, 15, 15))
fmBack.Size = UDim2.new(1, 0, 0, 30)
fmBack.Position = UDim2.new(0, 0, 1, -32)
fmBack.Parent = folderMain

local scriptMain = Instance.new("Frame")
scriptMain.Size = UDim2.new(1, -16, 1, -48)
scriptMain.Position = UDim2.new(0, 8, 0, 40)
scriptMain.BackgroundTransparency = 1
scriptMain.Visible = false
scriptMain.Parent = contentWindow

local smTextBox = Instance.new("TextBox")
smTextBox.Size = UDim2.new(1, 0, 1, -44)
smTextBox.Position = UDim2.new(0, 0, 0, 0)
smTextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
smTextBox.BorderSizePixel = 0
smTextBox.Font = Enum.Font.Code
smTextBox.Text = ""
smTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
smTextBox.TextSize = 12
smTextBox.TextXAlignment = Enum.TextXAlignment.Left
smTextBox.TextYAlignment = Enum.TextYAlignment.Top
smTextBox.MultiLine = true
smTextBox.ClearTextOnFocus = false
smTextBox.Parent = scriptMain
local smTextCorner = Instance.new("UICorner")
smTextCorner.CornerRadius = UDim.new(0, 6)
smTextCorner.Parent = smTextBox

local smNevermind = createButton("SmNevermind", "Back", Color3.fromRGB(15, 15, 15))
smNevermind.Size = UDim2.new(0.48, 0, 0, 32)
smNevermind.Position = UDim2.new(0, 0, 1, -36)
smNevermind.Parent = scriptMain

local smSave = createButton("SmSave", "Save", Color3.fromRGB(15, 15, 15))
smSave.Size = UDim2.new(0.48, 0, 0, 32)
smSave.Position = UDim2.new(0.52, 0, 1, -36)
smSave.Parent = scriptMain

local executeButton = createButton("ExecuteButton", "Execute", Color3.fromRGB(15, 15, 15))
executeButton.Position = UDim2.new(0, 0, 0, 0)
executeButton.Parent = controlPanel

local clearButton = createButton("ClearButton", "Clear", Color3.fromRGB(15, 15, 15))
clearButton.Position = UDim2.new(0.34, 0, 0, 0)
clearButton.Parent = controlPanel

local pasteButton = createButton("PasteButton", "Paste", Color3.fromRGB(15, 15, 15))
pasteButton.Position = UDim2.new(0.68, 0, 0, 0)
pasteButton.Parent = controlPanel

local renameMain = Instance.new("Frame")
renameMain.Size = UDim2.new(0, 240, 0, 110)
renameMain.Position = UDim2.new(0.5, -120, 0.5, -55)
renameMain.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
renameMain.BorderSizePixel = 0
renameMain.Visible = false
renameMain.Parent = screenGui
local rmCorner = Instance.new("UICorner")
rmCorner.CornerRadius = UDim.new(0, 6)
rmCorner.Parent = renameMain

local rmInput = Instance.new("TextBox")
rmInput.Size = UDim2.new(1, -20, 0, 28)
rmInput.Position = UDim2.new(0, 10, 0, 20)
rmInput.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
rmInput.BorderSizePixel = 0
rmInput.Font = Enum.Font.Code
rmInput.Text = ""
rmInput.TextColor3 = Color3.fromRGB(255, 255, 255)
rmInput.TextSize = 12
rmInput.Parent = renameMain

local rmClose = createButton("RmClose", "Close", Color3.fromRGB(30, 30, 30))
rmClose.Size = UDim2.new(0, 80, 0, 28)
rmClose.Position = UDim2.new(0, 20, 1, -38)
rmClose.Parent = renameMain

local rmSave = createButton("RmSave", "Save", Color3.fromRGB(30, 80, 30))
rmSave.Size = UDim2.new(0, 80, 0, 28)
rmSave.Position = UDim2.new(1, -100, 1, -38)
rmSave.Parent = renameMain

local contextMenu = Instance.new("Frame")
contextMenu.Size = UDim2.new(0, 140, 0, 60)
contextMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
contextMenu.BorderSizePixel = 0
contextMenu.Visible = false
contextMenu.ZIndex = 200
contextMenu.Parent = screenGui
local cmCorner = Instance.new("UICorner")
cmCorner.CornerRadius = UDim.new(0, 4)
cmCorner.Parent = contextMenu

local cmLayout = Instance.new("UIListLayout")
cmLayout.SortOrder = Enum.SortOrder.LayoutOrder
cmLayout.Parent = contextMenu

local cmBtn1 = Instance.new("TextButton")
cmBtn1.Size = UDim2.new(1, 0, 0, 30)
cmBtn1.BackgroundTransparency = 1
cmBtn1.Font = Enum.Font.Code
cmBtn1.Text = ""
cmBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
cmBtn1.TextSize = 12
cmBtn1.ZIndex = 201
cmBtn1.Parent = contextMenu

local cmBtn2 = Instance.new("TextButton")
cmBtn2.Size = UDim2.new(1, 0, 0, 30)
cmBtn2.BackgroundTransparency = 1
cmBtn2.Font = Enum.Font.Code
cmBtn2.Text = ""
cmBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
cmBtn2.TextSize = 12
cmBtn2.ZIndex = 201
cmBtn2.Parent = contextMenu

local deleteAppMenu = Instance.new("Frame")
deleteAppMenu.Size = UDim2.new(0, 140, 0, 30)
deleteAppMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
deleteAppMenu.BorderSizePixel = 0
deleteAppMenu.Visible = false
deleteAppMenu.ZIndex = 200
deleteAppMenu.Parent = screenGui
local damCorner = Instance.new("UICorner")
damCorner.CornerRadius = UDim.new(0, 4)
damCorner.Parent = deleteAppMenu

local damBtn = Instance.new("TextButton")
damBtn.Size = UDim2.new(1, 0, 1, 0)
damBtn.BackgroundTransparency = 1
damBtn.Font = Enum.Font.Code
damBtn.Text = "Delete This App"
damBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
damBtn.TextSize= 12
damBtn.ZIndex = 201
damBtn.Parent = deleteAppMenu

local HubManager = {}
local isExpanded = false
local isWeatherOpen = false
local isMonitorOpen = false
local isIdle = false
local idleTween = nil
local activeTween = nil
local currentCity = "New York, United States"
local currentWeatherCode = 0
local currentTemp = 0

local appsData = {}
local currentAppStruct = nil
local currentEditingNode = nil
local contextTarget = nil
local contextTargetBtn = nil
local contextType = ""
local holdRegistry = {}
local pendingCode = ""

local appTrackers = {}
local selectedMetric = "RAM"
local monitorHistory = {CPU = {}, GPU = {}, VRAM = {}, RAM = {}, ["FRAMES/S"] = {}}
for _, m in ipairs({"CPU", "GPU", "VRAM", "RAM", "FRAMES/S"}) do
	for i = 1, 30 do table.insert(monitorHistory[m], 0) end
end

local function unproxy(obj)
	if type(obj) == "userdata" then
		local s, mt = pcall(getmetatable, obj)
		if s and type(mt) == "table" and mt.__isProxy then
			return mt.__real
		end
	end
	return obj
end

local function createProxy(obj, tracker)
	if typeof(obj) ~= "Instance" then return obj end
	if tracker.proxies[obj] then return tracker.proxies[obj] end
	
	local p = newproxy(true)
	local mt = getmetatable(p)
	
	mt.__index = function(self, k)
		local v = obj[k]
		if type(v) == "function" then
			return function(_, ...)
				local args = {...}
				for i = 1, #args do args[i] = unproxy(args[i]) end
				
				if k == "Destroy" or k == "Remove" then
					if not tracker.created[obj] then
						if tracker.removed[obj] == nil then
							tracker.removed[obj] = obj.Parent
						end
						obj.Parent = nil
						return
					end
				elseif k == "Clone" then
					local cloned = v(obj, unpack(args))
					tracker.created[cloned] = true
					return createProxy(cloned, tracker)
				end
				
				local ret = {v(obj, unpack(args))}
				for i = 1, #ret do ret[i] = createProxy(ret[i], tracker) end
				return unpack(ret)
			end
		elseif typeof(v) == "Instance" then
			return createProxy(v, tracker)
		elseif typeof(v) == "RBXScriptSignal" then
			local sigP = newproxy(true)
			local sigMt = getmetatable(sigP)
			sigMt.__index = function(_, sigK)
				if sigK == "Connect" then
					return function(_, fn)
						local conn = v:Connect(function(...)
							local args = {...}
							for i = 1, #args do args[i] = createProxy(args[i], tracker) end
							fn(unpack(args))
						end)
						table.insert(tracker.connections, conn)
						return conn
					end
				elseif sigK == "Wait" then
					return function(_)
						local args = {v:Wait()}
						for i = 1, #args do args[i] = createProxy(args[i], tracker) end
						return unpack(args)
					end
				end
				return v[sigK]
			end
			return sigP
		end
		return v
	end
	
	mt.__newindex = function(self, k, v)
		v = unproxy(v)
		if not tracker.created[obj] then
			if not tracker.modified[obj] then tracker.modified[obj] = {} end
			if tracker.modified[obj][k] == nil then
				pcall(function() tracker.modified[obj][k] = obj[k] end)
			end
		end
		pcall(function() obj[k] = v end)
	end
	
	mt.__tostring = function() return tostring(obj) end
	mt.__isProxy = true
	mt.__real = obj
	
	tracker.proxies[obj] = p
	return p
end

local function terminateApp(appData)
	if appTrackers[appData] then
		for _, tracker in ipairs(appTrackers[appData]) do
			for _, t in ipairs(tracker.threads) do
				pcall(task.cancel, t)
				pcall(coroutine.close, t)
			end
			for _, c in ipairs(tracker.connections) do
				pcall(function() c:Disconnect() end)
			end
			for inst, _ in pairs(tracker.created) do
				pcall(function() inst:Destroy() end)
			end
			for inst, props in pairs(tracker.modified) do
				for k, v in pairs(props) do
					pcall(function() inst[k] = v end)
				end
			end
			for inst, parent in pairs(tracker.removed) do
				pcall(function() inst.Parent = parent end)
			end
		end
		appTrackers[appData] = nil
	end
end

local function playExplosionEffect(startPos, iconImage)
	local fragments = {}
	for i = 1, 15 do
		local frag = Instance.new(iconImage and "ImageLabel" or "Frame")
		frag.Size = UDim2.new(0, 10, 0, 10)
		frag.Position = UDim2.new(0, startPos.X, 0, startPos.Y)
		if iconImage then
			frag.Image = iconImage
			frag.BackgroundTransparency = 1
		else
			frag.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0, 4)
			corner.Parent = frag
		end
		frag.Parent = screenGui
		local vx = math.random(-15, 15)
		local vy = math.random(-25, -5)
		local rot = math.random(-20, 20)
		table.insert(fragments, {obj = frag, vx = vx, vy = vy, rot = rot})
	end
	local conn
	conn = RunService.RenderStepped:Connect(function()
		local screenY = screenGui.AbsoluteSize.Y
		local screenX = screenGui.AbsoluteSize.X
		local active = false
		for _, f in ipairs(fragments) do
			if f.obj.Parent then
				active = true
				f.vy = f.vy + 1.2
				local pos = f.obj.AbsolutePosition
				local newX = pos.X + f.vx
				local newY = pos.Y + f.vy
				f.obj.Position = UDim2.new(0, newX, 0, newY)
				f.obj.Rotation = f.obj.Rotation + f.rot
				if newY > screenY + 50 or newX < -50 or newX > screenX + 50 then
					f.obj:Destroy()
				end
			end
		end
		if not active then
			conn:Disconnect()
		end
	end)
end

local function loadSavedLocation()
	pcall(function()
		if readfile and isfile and isfile("weather_hub_loc.txt") then
			local res = readfile("weather_hub_loc.txt")
			if res and res ~= "" then currentCity = res end
		end
	end)
end

local function saveCurrentLocation(city)
	pcall(function()
		if writefile then writefile("weather_hub_loc.txt", city) end
	end)
end

local function saveApps()
	pcall(function()
		if writefile then
			writefile("optimized_hub_apps.json", HttpService:JSONEncode(appsData))
		end
	end)
end

local function loadApps()
	pcall(function()
		if readfile and isfile and isfile("optimized_hub_apps.json") then
			local res = readfile("optimized_hub_apps.json")
			if res and res ~= "" then
				appsData = HttpService:JSONDecode(res)
			end
		end
	end)
end

loadSavedLocation()
loadApps()

local function executeAppCode(appData)
	if not appTrackers[appData] then appTrackers[appData] = {} end
	local tracker = {
		created = {},
		modified = {},
		removed = {},
		proxies = {},
		connections = {},
		threads = {}
	}
	table.insert(appTrackers[appData], tracker)
	
	local env = setmetatable({}, {
		__index = function(_, k)
			if k == "game" then return createProxy(game, tracker) end
			if k == "workspace" then return createProxy(workspace, tracker) end
			if k == "Instance" then
				return {
					new = function(cls, parent)
						parent = unproxy(parent)
						local inst = Instance.new(cls)
						tracker.created[inst] = true
						if parent then inst.Parent = parent end
						return createProxy(inst, tracker)
					end
				}
			end
			if k == "task" then
				return {
					spawn = function(f, ...) local t = task.spawn(f, ...) table.insert(tracker.threads, t) return t end,
					defer = function(f, ...) local t = task.defer(f, ...) table.insert(tracker.threads, t) return t end,
					delay = function(d, f, ...) local t = task.delay(d, f, ...) table.insert(tracker.threads, t) return t end,
					cancel = function(t) pcall(task.cancel, t) end,
					wait = task.wait
				}
			end
			if k == "coroutine" then
				return {
					create = function(f) local c = coroutine.create(f) table.insert(tracker.threads, c) return c end,
					resume = coroutine.resume,
					yield = coroutine.yield,
					status = coroutine.status,
					close = coroutine.close,
					running = coroutine.running,
					wrap = function(f) return coroutine.wrap(f) end,
					isyieldable = coroutine.isyieldable
				}
			end
			return getfenv()[k]
		end
	})
	
	local mainAppTable = {}
	local clientSrc = nil
	local function parseNode(node, tbl)
		for _, child in ipairs(node.children) do
			if child.type == "Script" then
				if node.name == "Main_App" and child.name == "ClientScript" then
					clientSrc = child.source
				end
				local scriptObj = {
					execute = function(self)
						local f = loadstring(child.source)
						if f then
							setfenv(f, env)
							return pcall(f)
						end
					end,
					find = function(self)
						return child
					end,
					read = function(self)
						return child.source
					end
				}
				setmetatable(scriptObj, {
					__call = function(self)
						local f = loadstring(child.source)
						if f then
							setfenv(f, env)
							return pcall(f)
						end
					end
				})
				tbl[child.name] = scriptObj
			elseif child.type == "Folder" then
				tbl[child.name] = {}
				parseNode(child, tbl[child.name])
			end
		end
	end
	parseNode(appData.structure, mainAppTable)
	env.Main_App = mainAppTable
	env.main_app = mainAppTable
	if clientSrc then
		local f = loadstring(clientSrc)
		if f then
			setfenv(f, env)
			pcall(f)
		end
	end
end

local function refreshAppsUI()
	for _, c in ipairs(appsScroll:GetChildren()) do
		if c:IsA("ImageButton") or c:IsA("TextButton") then c:Destroy() end
	end
	for i, app in ipairs(appsData) do
		local btn = Instance.new("ImageButton")
		btn.Size = UDim2.new(0, 36, 0, 36)
		btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		btn.BackgroundTransparency = 0
		btn.BorderSizePixel = 0
		if app.appIcon and app.appIcon ~= "" then
			btn.Image = app.appIcon
		end
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 6)
		corner.Parent = btn
		btn.Parent = appsScroll
		btn.MouseButton1Click:Connect(function()
			executeAppCode(app)
		end)
		btn.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				deleteAppMenu.Position = UDim2.new(0, input.Position.X + 10, 0, input.Position.Y + 10)
				deleteAppMenu.Visible = true
				contextTarget = i
				contextTargetBtn = btn
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				holdRegistry[btn] = {start = tick(), pos = input.Position, type = "App", target = i, targetBtn = btn}
			end
		end)
		btn.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				holdRegistry[btn] = nil
			end
		end)
	end
	appsScroll.CanvasSize = UDim2.new(0, #appsData * 44, 0, 0)
end

local function renderTree(node, depth, parentFrame)
	local item = Instance.new("TextButton")
	item.Size = UDim2.new(1, -10, 0, 24)
	item.BackgroundTransparency = 1
	item.Font = Enum.Font.Code
	local prefix = string.rep("  ", depth)
	local icon = node.type == "Folder" and "📁 " or "📜 "
	item.Text = prefix .. icon .. node.name
	item.TextColor3 = Color3.fromRGB(200, 200, 200)
	item.TextSize = 12
	item.TextXAlignment = Enum.TextXAlignment.Left
	item.Parent = parentFrame
	
	item.MouseButton1Click:Connect(function()
		if node.type == "Script" then
			currentEditingNode = node
			smTextBox.Text = node.source or ""
			scriptMain.Visible = true
			folderMain.Visible = false
		end
	end)
	item.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			contextTarget = node
			contextType = node.name == "Main_App" and "Main" or "Normal"
			if contextType == "Main" then
				cmBtn1.Text = "📜 ClientScript"
				cmBtn2.Text = "📁 Folder"
				contextMenu.Size = UDim2.new(0, 140, 0, 60)
				cmBtn2.Visible = true
			else
				cmBtn1.Text = "Rename"
				cmBtn2.Text = "Delete"
				contextMenu.Size = UDim2.new(0, 140, 0, 60)
				cmBtn2.Visible = true
			end
			contextMenu.Position = UDim2.new(0, input.Position.X + 10, 0, input.Position.Y + 10)
			contextMenu.Visible = true
		elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			holdRegistry[item] = {start = tick(), pos = input.Position, type = "Tree", node = node}
		end
	end)
	item.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			holdRegistry[item] = nil
		end
	end)
	if node.type == "Folder" and node.children then
		for _, child in ipairs(node.children) do
			renderTree(child, depth + 1, parentFrame)
		end
	end
end

local function updateFolderUI()
	for _, c in ipairs(fmScroll:GetChildren()) do
		if c:IsA("TextButton") then c:Destroy() end
	end
	if currentAppStruct then
		renderTree(currentAppStruct, 0, fmScroll)
		fmScroll.CanvasSize = UDim2.new(0, 0, 0, #fmScroll:GetChildren() * 24)
	end
end

local function resetIdleTimer()
	if isExpanded then return end
	if idleTween then idleTween:Cancel() end
	if isIdle then
		isIdle = false
		idleHitbox.Visible = false
		idleTween = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = collapsedPosition})
		idleTween:Play()
	end
	task.spawn(function()
		local startTime = tick()
		while tick() - startTime < 5 do
			if isExpanded or isIdle then return end
			task.wait(0.2)
		end
		if not isExpanded and not isIdle then
			isIdle = true
			idleHitbox.Visible = true
			idleTween = TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = idlePosition})
			idleTween:Play()
		end
	end)
end

idleHitbox.MouseButton1Click:Connect(function()
	resetIdleTimer()
end)

RunService.Heartbeat:Connect(function()
	local now = tick()
	for obj, data in pairs(holdRegistry) do
		if now - data.start >= 1.5 then
			if data.type == "Tree" then
				contextTarget = data.node
				contextType = data.node.name == "Main_App" and "Main" or "Normal"
				if contextType == "Main" then
					cmBtn1.Text = "📜 ClientScript"
					cmBtn2.Text = "📁 Folder"
					cmBtn2.Visible = true
				else
					cmBtn1.Text = "Rename"
					cmBtn2.Text = "Delete"
					cmBtn2.Visible = true
				end
				contextMenu.Position = UDim2.new(0, data.pos.X + 10, 0, data.pos.Y + 10)
				contextMenu.Visible = true
			elseif data.type == "App" then
				deleteAppMenu.Position = UDim2.new(0, data.pos.X + 10, 0, data.pos.Y + 10)
				deleteAppMenu.Visible = true
				contextTarget = data.target
				contextTargetBtn = data.targetBtn
			end
			holdRegistry[obj] = nil
		end
	end
end)

task.spawn(function()
	while true do
		local success, pingVal = pcall(function()
			local networkStats = Stats.Network.ServerStatsItem
			local dataPing = nil
			for _, item in ipairs(networkStats:GetChildren()) do
				if item.Name == "Data Ping" then
					dataPing = item:GetValue()
					break
				end
			end
			return dataPing or (Stats.PerformanceStats.Ping:GetValue())
		end)
		if success and pingVal then
			if pingVal < 170 then pingImage.Image = "rbxassetid://9512524704"
			elseif pingVal >= 170 and pingVal < 300 then pingImage.Image = "rbxassetid://9512524085"
			else pingImage.Image = "rbxassetid://9512523511"
			end
		end
		task.wait(1)
	end
end)

local function updateMonitorGraph()
	for _, c in ipairs(monitorGraphLine:GetChildren()) do
		c:Destroy()
	end
	local history = monitorHistory[selectedMetric]
	local maxPts = #history
	if maxPts < 2 then return end
	local width = monitorGraphLine.AbsoluteSize.X
	local height = monitorGraphLine.AbsoluteSize.Y
	if width <= 0 or height <= 0 then return end

	for i = 1, maxPts - 1 do
		local v1 = history[i]
		local v2 = history[i+1]
		local x1 = (i - 1) / (maxPts - 1) * width
		local x2 = i / (maxPts - 1) * width
		local y1 = height - (v1 / 100 * height)
		local y2 = height - (v2 / 100 * height)

		local line = Instance.new("Frame")
		line.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
		line.BorderSizePixel = 0
		local dist = math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
		line.Size = UDim2.new(0, dist, 0, 2)
		line.Position = UDim2.new(0, x1, 0, y1)
		line.Rotation = math.deg(math.atan2(y2 - y1, x2 - x1))
		line.AnchorPoint = Vector2.new(0, 0.5)
		line.Parent = monitorGraphLine
	end
end

local function updateMonitorData()
	local ramVal = math.clamp(math.floor(math.noise(tick() * 0.5) * 25 + 50), 10, 95)
	local cpuVal = math.clamp(math.floor(math.noise(tick() * 0.7 + 10) * 30 + 45), 5, 98)
	local gpuVal = math.clamp(math.floor(math.noise(tick() * 0.6 + 20) * 35 + 55), 10, 99)
	local vramVal = math.clamp(math.floor(math.noise(tick() * 0.4 + 30) * 20 + 40), 10, 90)
	local fpsVal = math.clamp(math.floor(60 + math.noise(tick()) * 15), 15, 120)

	monitorHistory["RAM"][#monitorHistory["RAM"] + 1] = ramVal
	table.remove(monitorHistory["RAM"], 1)
	monitorHistory["CPU"][#monitorHistory["CPU"] + 1] = cpuVal
	table.remove(monitorHistory["CPU"], 1)
	monitorHistory["GPU"][#monitorHistory["GPU"] + 1] = gpuVal
	table.remove(monitorHistory["GPU"], 1)
	monitorHistory["VRAM"][#monitorHistory["VRAM"] + 1] = vramVal
	table.remove(monitorHistory["VRAM"], 1)
	monitorHistory["FRAMES/S"][#monitorHistory["FRAMES/S"] + 1] = math.floor(fpsVal / 120 * 100)
	table.remove(monitorHistory["FRAMES/S"], 1)

	if isMonitorOpen then
		updateMonitorGraph()
		local currentVal = selectedMetric == "FRAMES/S" and fpsVal .. " FPS" or (monitorHistory[selectedMetric][#monitorHistory[selectedMetric]] .. "%")
		local specs = {
			RAM = "RAM: System Random Access Memory allocation. Dedicated to active runtime variables and instances.",
			CPU = "CPU: Central Processing Unit core load. Handles core game logic, physics calculations, and scripts.",
			GPU = "GPU: Graphics Processing Unit rendering pipeline. Handles meshes, textures, shaders, and lighting.",
			VRAM = "VRAM: Video RAM usage. Stores active textures, graphic buffers, and frame buffers.",
			["FRAMES/S"] = "FRAMES/S: Screen refresh rate performance. Measures rendered frames per second."
		}
		monitorInfoBlock.Text = selectedMetric .. " Usage: " .. currentVal .. "\n" .. (specs[selectedMetric] or "")
	end
end

task.spawn(function()
	while true do
		local rate = isMonitorOpen and 1.5 or 4.0
		pcall(updateMonitorData)
		task.wait(rate)
	end
end)

local function initMonitorList()
	for _, c in ipairs(monitorListFrame:GetChildren()) do
		if c:IsA("TextButton") then c:Destroy() end
	end
	local metrics = {"RAM", "CPU", "GPU", "VRAM", "FRAMES/S"}
	for _, m in ipairs(metrics) do
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, 0, 0, 28)
		btn.BackgroundColor3 = (m == selectedMetric) and Color3.fromRGB(35, 35, 35) or Color3.fromRGB(20, 20, 20)
		btn.BorderSizePixel = 0
		btn.Font = Enum.Font.Code
		btn.Text = m
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		btn.TextSize = 11
		btn.AutoButtonColor = true
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 4)
		corner.Parent = btn
		btn.Parent = monitorListFrame

		btn.MouseButton1Click:Connect(function()
			selectedMetric = m
			initMonitorList()
			updateMonitorData()
		end)
	end
	monitorListFrame.CanvasSize = UDim2.new(0, 0, 0, #metrics * 32)
end

local function getWeatherAsset(code)
	if code == 0 then return "rbxassetid://82410735894036"
	elseif code == 1 then return "rbxassetid://89819932982430"
	elseif code == 2 then return "rbxassetid://104524040159057"
	elseif code == 3 then return "rbxassetid://100955492250141"
	elseif code >= 45 and code <= 48 then return "rbxassetid://70432872473102"
	elseif code == 51 or code == 53 or code == 55 then return "rbxassetid://112276281424544"
	elseif code >= 61 and code <= 63 then return "rbxassetid://121339017688218"
	elseif code == 65 then return "rbxassetid://96332226552349"
	elseif code >= 71 and code <= 77 then return "rbxassetid://121339017688218"
	elseif code == 80 then return "rbxassetid://126410542264413"
	elseif code >= 81 and code <= 82 then return "rbxassetid://96332226552349"
	elseif code == 95 then return "rbxassetid://77207049898483"
	elseif code == 96 or code == 99 then return "rbxassetid://118053892864488"
	else return "rbxassetid://82410735894036"
	end
end

local function openDayDetail(dayIdx, dateTitle, response)
	if not (response and response.hourly and response.hourly.time) then return end

	for _, c in ipairs(detailScroll:GetChildren()) do
		if c:IsA("Frame") then c:Destroy() end
	end

	detailTitle.Text = "Forecast (" .. dateTitle .. ")"

	local times = response.hourly.time
	local temps = response.hourly.temperature_2m
	local codes = response.hourly.weather_code
	local pops = response.hourly.precipitation_probability or {}

	local startHourIndex = (dayIdx - 1) * 24 + 1
	local endHourIndex = math.min(dayIdx * 24, #times)

	local itemWidth = 52
	local count = 0

	for i = startHourIndex, endHourIndex do
		count = count + 1
		local tStr = times[i] or ""
		local hStr = string.match(tStr, "T(%d+:%d+)") or string.format("%02d:00", count - 1)

		local item = Instance.new("Frame")
		item.Size = UDim2.new(0, itemWidth, 1, -10)
		item.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		item.BorderSizePixel = 0
		item.Parent = detailScroll

		local itCorner = Instance.new("UICorner")
		itCorner.CornerRadius = UDim.new(0, 4)
		itCorner.Parent = item

		local timeLbl = Instance.new("TextLabel")
		timeLbl.Size = UDim2.new(1, 0, 0, 16)
		timeLbl.Position = UDim2.new(0, 0, 0, 4)
		timeLbl.BackgroundTransparency = 1
		timeLbl.Font = Enum.Font.Code
		timeLbl.Text = hStr
		timeLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
		timeLbl.TextSize = 10
		timeLbl.Parent = item

		local icon = Instance.new("ImageLabel")
		icon.Size = UDim2.new(0, 22, 0, 22)
		icon.Position = UDim2.new(0.5, -11, 0, 24)
		icon.BackgroundTransparency = 1
		icon.Image = getWeatherAsset(codes[i])
		icon.Parent = item

		local popVal = pops[i] or 0
		local popLbl = Instance.new("TextLabel")
		popLbl.Size = UDim2.new(1, 0, 0, 14)
		popLbl.Position = UDim2.new(0, 0, 0, 50)
		popLbl.BackgroundTransparency = 1
		popLbl.Font = Enum.Font.Code
		popLbl.Text = popVal .. "%"
		popLbl.TextColor3 = Color3.fromRGB(100, 200, 255)
		popLbl.TextSize = 9
		popLbl.Parent = item

		local tempLbl = Instance.new("TextLabel")
		tempLbl.Size = UDim2.new(1, 0, 0, 16)
		tempLbl.Position = UDim2.new(0, 0, 0, 68)
		tempLbl.BackgroundTransparency = 1
		tempLbl.Font = Enum.Font.Code
		tempLbl.Text = math.floor(temps[i] + 0.5) .. "°"
		tempLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
		tempLbl.TextSize = 11
		tempLbl.Parent = item
	end

	detailScroll.CanvasSize = UDim2.new(0, count * (itemWidth + 6), 0, 0)

	weatherScroll.Visible = false
	searchBox.Visible = false
	dayDetailFrame.Visible = true
end

local function updateWeatherDisplay()
	local success, response = pcall(function()
		local encoded = HttpService:UrlEncode(currentCity)
		local geoUrl = "https://geocoding-api.open-meteo.com/v1/search?name=" .. encoded .. "&count=1"
		local geoData = HttpService:JSONDecode(game:HttpGet(geoUrl))
		if geoData and geoData.results and #geoData.results > 0 then
			local lat = geoData.results[1].latitude
			local lon = geoData.results[1].longitude
			local weatherUrl = "https://api.open-meteo.com/v1/forecast?latitude=" .. lat .. "&longitude=" .. lon .. "&current=temperature_2m,apparent_temperature,weather_code&hourly=temperature_2m,weather_code,precipitation_probability&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max&forecast_days=10&timezone=auto"
			return HttpService:JSONDecode(game:HttpGet(weatherUrl))
		end
	end)
	if success and response then
		if response.current then
			currentTemp = math.floor(response.current.temperature_2m + 0.5)
			currentWeatherCode = response.current.weather_code
			weatherLabel.Text = currentTemp .. "°"
			weatherIcon.Image = getWeatherAsset(currentWeatherCode)
		end
		if isWeatherOpen then
			for _, child in ipairs(weatherScroll:GetChildren()) do
				if child:IsA("Frame") then child:Destroy() end
			end

			local currentTempVal = response.current and math.floor(response.current.temperature_2m + 0.5) or 0
			local apparentTemp = (response.current and response.current.apparent_temperature) and math.floor(response.current.apparent_temperature + 0.5) or currentTempVal
			local todayMin = (response.daily and response.daily.temperature_2m_min and response.daily.temperature_2m_min[1]) and math.floor(response.daily.temperature_2m_min[1] + 0.5) or "--"
			local todayMax = (response.daily and response.daily.temperature_2m_max and response.daily.temperature_2m_max[1]) and math.floor(response.daily.temperature_2m_max[1] + 0.5) or "--"

			local currentFrame = Instance.new("Frame")
			currentFrame.Name = "CurrentFrame"
			currentFrame.Size = UDim2.new(1, 0, 0, 60)
			currentFrame.BackgroundTransparency = 1
			currentFrame.Parent = weatherScroll

			local bigTemp = Instance.new("TextLabel")
			bigTemp.Size = UDim2.new(0, 70, 0, 36)
			bigTemp.Position = UDim2.new(0, 0, 0, 0)
			bigTemp.BackgroundTransparency = 1
			bigTemp.Font = Enum.Font.Code
			bigTemp.Text = currentTempVal .. "°"
			bigTemp.TextColor3 = Color3.fromRGB(255, 255, 255)
			bigTemp.TextSize = 28
			bigTemp.TextXAlignment = Enum.TextXAlignment.Left
			bigTemp.Parent = currentFrame

			local bigIcon = Instance.new("ImageLabel")
			bigIcon.Size = UDim2.new(0, 32, 0, 32)
			bigIcon.Position = UDim2.new(0, 75, 0, 2)
			bigIcon.BackgroundTransparency = 1
			bigIcon.Image = getWeatherAsset(response.current and response.current.weather_code or 0)
			bigIcon.Parent = currentFrame

			local detailsLbl = Instance.new("TextLabel")
			detailsLbl.Size = UDim2.new(1, 0, 0, 20)
			detailsLbl.Position = UDim2.new(0, 0, 0, 36)
			detailsLbl.BackgroundTransparency = 1
			detailsLbl.Font = Enum.Font.Code
			detailsLbl.Text = "Feels like " .. apparentTemp .. "° | Min: " .. todayMin .. "° Max: " .. todayMax .. "°"
			detailsLbl.TextColor3 = Color3.fromRGB(180, 180, 180)
			detailsLbl.TextSize = 11
			detailsLbl.TextXAlignment = Enum.TextXAlignment.Left
			detailsLbl.Parent = currentFrame

			if response.hourly and response.hourly.time then
				local hourlyCardFrame = Instance.new("Frame")
				hourlyCardFrame.Name = "HourlyCardFrame"
				hourlyCardFrame.Size = UDim2.new(1, 0, 0, 95)
				hourlyCardFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				hourlyCardFrame.BorderSizePixel = 0
				hourlyCardFrame.Parent = weatherScroll

				local hCardCorner = Instance.new("UICorner")
				hCardCorner.CornerRadius = UDim.new(0, 6)
				hCardCorner.Parent = hourlyCardFrame

				local hTitle = Instance.new("TextLabel")
				hTitle.Size = UDim2.new(1, -10, 0, 18)
				hTitle.Position = UDim2.new(0, 8, 0, 4)
				hTitle.BackgroundTransparency = 1
				hTitle.Font = Enum.Font.Code
				hTitle.Text = "HOURLY FORECAST"
				hTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
				hTitle.TextSize = 10
				hTitle.TextXAlignment = Enum.TextXAlignment.Left
				hTitle.Parent = hourlyCardFrame

				local hScroll = Instance.new("ScrollingFrame")
				hScroll.Size = UDim2.new(1, -8, 0, 68)
				hScroll.Position = UDim2.new(0, 4, 0, 22)
				hScroll.BackgroundTransparency = 1
				hScroll.BorderSizePixel = 0
				hScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
				hScroll.ScrollBarThickness = 2
				hScroll.ScrollingDirection = Enum.ScrollingDirection.X
				hScroll.Active = true
				hScroll.Parent = hourlyCardFrame

				local hLayout = Instance.new("UIListLayout")
				hLayout.FillDirection = Enum.FillDirection.Horizontal
				hLayout.SortOrder = Enum.SortOrder.LayoutOrder
				hLayout.Padding = UDim.new(0, 6)
				hLayout.Parent = hScroll

				local times = response.hourly.time
				local temps = response.hourly.temperature_2m
				local codes = response.hourly.weather_code
				local pops = response.hourly.precipitation_probability or {}

				local currentTimeStr = os.date("!%Y-%m-%dT%H:00")
				local startIndex = 1
				for i, t in ipairs(times) do
					if t >= currentTimeStr then startIndex = i break end
				end

				local currentLocalTime = os.time()
				local baseTime = currentLocalTime - (currentLocalTime % 3600)
				local itemWidth = 52
				local count = 0

				for i = startIndex, #times do
					local forecastLocalTime = baseTime + ((i - startIndex) * 3600)
					local hourStr = os.date("%H:00", forecastLocalTime)

					count = count + 1

					local item = Instance.new("Frame")
					item.Size = UDim2.new(0, itemWidth, 1, 0)
					item.BackgroundTransparency = 1
					item.Parent = hScroll

					local timeLbl = Instance.new("TextLabel")
					timeLbl.Size = UDim2.new(1, 0, 0, 14)
					timeLbl.Position = UDim2.new(0, 0, 0, 0)
					timeLbl.BackgroundTransparency = 1
					timeLbl.Font = Enum.Font.Code
					timeLbl.Text = (count == 1) and "Now" or hourStr
					timeLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
					timeLbl.TextSize = 10
					timeLbl.Parent = item

					local icon = Instance.new("ImageLabel")
					icon.Size = UDim2.new(0, 18, 0, 18)
					icon.Position = UDim2.new(0.5, -9, 0, 15)
					icon.BackgroundTransparency = 1
					icon.Image = getWeatherAsset(codes[i])
					icon.Parent = item

					local popVal = pops[i] or 0
					local popLbl = Instance.new("TextLabel")
					popLbl.Size = UDim2.new(1, 0, 0, 12)
					popLbl.Position = UDim2.new(0, 0, 0, 34)
					popLbl.BackgroundTransparency = 1
					popLbl.Font = Enum.Font.Code
					popLbl.Text = popVal .. "%"
					popLbl.TextColor3 = Color3.fromRGB(100, 200, 255)
					popLbl.TextSize = 9
					popLbl.Parent = item

					local tempLbl = Instance.new("TextLabel")
					tempLbl.Size = UDim2.new(1, 0, 0, 14)
					tempLbl.Position = UDim2.new(0, 0, 0, 48)
					tempLbl.BackgroundTransparency = 1
					tempLbl.Font = Enum.Font.Code
					tempLbl.Text = math.floor(temps[i] + 0.5) .. "°"
					tempLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
					tempLbl.TextSize = 11
					tempLbl.Parent = item

					if hourStr == "23:00" then break end
				end
				hScroll.CanvasSize = UDim2.new(0, count * (itemWidth + 6), 0, 0)
			end

			if response.daily and response.daily.time then
				local dailyCardFrame = Instance.new("Frame")
				dailyCardFrame.Name = "DailyCardFrame"
				dailyCardFrame.Size = UDim2.new(1, 0, 0, 155)
				dailyCardFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				dailyCardFrame.BorderSizePixel = 0
				dailyCardFrame.Parent = weatherScroll

				local dCardCorner = Instance.new("UICorner")
				dCardCorner.CornerRadius = UDim.new(0, 6)
				dCardCorner.Parent = dailyCardFrame

				local dTitle = Instance.new("TextLabel")
				dTitle.Size = UDim2.new(1, -10, 0, 18)
				dTitle.Position = UDim2.new(0, 8, 0, 4)
				dTitle.BackgroundTransparency = 1
				dTitle.Font = Enum.Font.Code
				dTitle.Text = "10-DAY FORECAST"
				dTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
				dTitle.TextSize = 10
				dTitle.TextXAlignment = Enum.TextXAlignment.Left
				dTitle.Parent = dailyCardFrame

				local dScroll = Instance.new("ScrollingFrame")
				dScroll.Size = UDim2.new(1, -8, 0, 82)
				dScroll.Position = UDim2.new(0, 4, 0, 22)
				dScroll.BackgroundTransparency = 1
				dScroll.BorderSizePixel = 0
				dScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
				dScroll.ScrollBarThickness = 2
				dScroll.ScrollingDirection = Enum.ScrollingDirection.X
				dScroll.Active = true
				dScroll.Parent = dailyCardFrame

				local dLayout = Instance.new("UIListLayout")
				dLayout.FillDirection = Enum.FillDirection.Horizontal
				dLayout.SortOrder = Enum.SortOrder.LayoutOrder
				dLayout.Padding = UDim.new(0, 6)
				dLayout.Parent = dScroll

				local days = response.daily.time
				local maxTemps = response.daily.temperature_2m_max
				local minTemps = response.daily.temperature_2m_min
				local dCodes = response.daily.weather_code
				local dPops = response.daily.precipitation_probability_max or {}

				local itemWidth = 65
				for dayIdx = 1, #days do
					local dayBtn = Instance.new("TextButton")
					dayBtn.Size = UDim2.new(0, itemWidth, 1, 0)
					dayBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					dayBtn.BorderSizePixel = 0
					dayBtn.Text = ""
					dayBtn.AutoButtonColor = true
					dayBtn.Parent = dScroll

					local btnCorner = Instance.new("UICorner")
					btnCorner.CornerRadius = UDim.new(0, 4)
					btnCorner.Parent = dayBtn

					local dateStr = days[dayIdx]
					local y, m, d = string.match(dateStr, "(%d+)-(%d+)-(%d+)")
					local formattedDate = (d and m) and (d .. "/" .. m) or dateStr

					local dateLbl = Instance.new("TextLabel")
					dateLbl.Size = UDim2.new(1, 0, 0, 14)
					dateLbl.Position = UDim2.new(0, 0, 0, 2)
					dateLbl.BackgroundTransparency = 1
					dateLbl.Font = Enum.Font.Code
					dateLbl.Text = (dayIdx == 1) and "Today" or formattedDate
					dateLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
					dateLbl.TextSize = 10
					dateLbl.Parent = dayBtn

					local icon = Instance.new("ImageLabel")
					icon.Size = UDim2.new(0, 20, 0, 20)
					icon.Position = UDim2.new(0.5, -10, 0, 18)
					icon.BackgroundTransparency = 1
					icon.Image = getWeatherAsset(dCodes[dayIdx])
					icon.Parent = dayBtn

					local popVal = dPops[dayIdx] or 0
					local popLbl = Instance.new("TextLabel")
					popLbl.Size = UDim2.new(1, 0, 0, 12)
					popLbl.Position = UDim2.new(0, 0, 0, 40)
					popLbl.BackgroundTransparency = 1
					popLbl.Font = Enum.Font.Code
					popLbl.Text = popVal .. "%"
					popLbl.TextColor3 = Color3.fromRGB(100, 200, 255)
					popLbl.TextSize = 9
					popLbl.Parent = dayBtn

					local rangeLbl = Instance.new("TextLabel")
					rangeLbl.Size = UDim2.new(1, 0, 0, 24)
					rangeLbl.Position = UDim2.new(0, 0, 0, 54)
					rangeLbl.BackgroundTransparency = 1
					rangeLbl.Font = Enum.Font.Code
					rangeLbl.Text = math.floor(minTemps[dayIdx] + 0.5) .. "° / " .. math.floor(maxTemps[dayIdx] + 0.5) .. "°"
					rangeLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
					rangeLbl.TextSize = 10
					rangeLbl.TextWrapped = true
					rangeLbl.Parent = dayBtn

					dayBtn.MouseButton1Click:Connect(function()
						openDayDetail(dayIdx, formattedDate, response)
					end)
				end
				dScroll.CanvasSize = UDim2.new(0, #days * (itemWidth + 6), 0, 0)

				local weatherSubTextFrame = Instance.new("Frame")
				weatherSubTextFrame.Size = UDim2.new(1, -8, 0, 36)
				weatherSubTextFrame.Position = UDim2.new(0, 4, 0, 110)
				weatherSubTextFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
				weatherSubTextFrame.BorderSizePixel = 0
				weatherSubTextFrame.Parent = dailyCardFrame

				local subCorner = Instance.new("UICorner")
				subCorner.CornerRadius = UDim.new(0, 4)
				subCorner.Parent = weatherSubTextFrame

				local leftIcon = Instance.new("ImageLabel")
				leftIcon.Size = UDim2.new(0, 18, 0, 18)
				leftIcon.Position = UDim2.new(0, 6, 0.5, -9)
				leftIcon.BackgroundTransparency = 1
				leftIcon.Image = "rbxassetid://93196074526983"
				leftIcon.Parent = weatherSubTextFrame

				local rightIcon = Instance.new("ImageLabel")
				rightIcon.Size = UDim2.new(0, 18, 0, 18)
				rightIcon.Position = UDim2.new(1, -24, 0.5, -9)
				rightIcon.BackgroundTransparency = 1
				rightIcon.Image = "rbxassetid://93196074526983"
				rightIcon.Parent = weatherSubTextFrame

				local alertMsg = "Temperature increase in the next 10 Days, Better use sun protection when going out and stay in shadows!"
				local alertLbl = Instance.new("TextLabel")
				alertLbl.Size = UDim2.new(1, -56, 1, 0)
				alertLbl.Position = UDim2.new(0, 28, 0, 0)
				alertLbl.BackgroundTransparency = 1
				alertLbl.Font = Enum.Font.Code
				alertLbl.Text = alertMsg
				alertLbl.TextColor3 = Color3.fromRGB(240, 200, 100)
				alertLbl.TextSize = 10
				alertLbl.TextWrapped = true
				alertLbl.Parent = weatherSubTextFrame
			end

			weatherScroll.CanvasSize = UDim2.new(0, 0, 0, 340)
		end
	end
end

task.spawn(function()
	while true do
		pcall(updateWeatherDisplay)
		task.wait(600)
	end
end)
task.spawn(updateWeatherDisplay)

local function toggleMain(expand, weather, monitor)
	isExpanded = expand
	isWeatherOpen = weather
	isMonitorOpen = monitor
	isIdle = false
	if idleTween then idleTween:Cancel() end
	if activeTween then activeTween:Cancel() end
	
	actionButton.Visible = not expand
	pingImage.Visible = not expand
	weatherContainer.Visible = not expand
	appsScroll.Visible = not expand
	plusButton.Visible = not expand
	monitorButton.Visible = not expand
	trendingButton.Visible = not expand
	
	topBar.Visible = expand
	codeBox.Visible = expand and not weather and not monitor
	controlPanel.Visible = expand and not weather and not monitor
	weatherMainFrame.Visible = expand and weather
	monitorMainFrame.Visible = expand and monitor
	
	if not expand then
		appCreatorMain.Visible = false
		folderMain.Visible = false
		scriptMain.Visible = false
		renameMain.Visible = false
		contextMenu.Visible = false
		deleteAppMenu.Visible = false
		trendingMainFrame.Visible = false
		executeConfirmFrame.Visible = false
		dayDetailFrame.Visible = false
		monitorMainFrame.Visible = false
		weatherScroll.Visible = true
		searchBox.Visible = true
	end
	
	if weather then titleLabel.Text = "WEATHER: " .. currentCity
	elseif monitor then titleLabel.Text = "HARDWARE MONITOR" end
	
	local tInfo = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	
	local targetSize = expand and expandedSize or collapsedSize
	local targetPos = expand and expandedPosition or collapsedPosition
	
	activeTween = TweenService:Create(mainFrame, tInfo, {
		Size = targetSize,
		Position = targetPos,
		BackgroundTransparency = expand and 0 or 0.35
	})
	local cTween = TweenService:Create(mainCorner, tInfo, {CornerRadius = UDim.new(0, expand and 6 or 8)})
	
	local contentTween = TweenService:Create(contentWindow, tInfo, {
		Size = targetSize,
		Position = targetPos
	})
	
	if expand then
		contentWindow.Size = collapsedSize
		contentWindow.Position = collapsedPosition
		contentWindow.Visible = true
	end
	
	activeTween:Play()
	cTween:Play()
	contentTween:Play()
	
	if expand and weather then task.spawn(updateWeatherDisplay)
	elseif expand and monitor then initMonitorList() updateMonitorData() end
	if not expand then
		contentTween.Completed:Connect(function()
			if not isExpanded then contentWindow.Visible = false end
		end)
		resetIdleTimer() 
		titleLabel.Text = "Apps Protection" 
	end
end

actionButton.MouseButton1Click:Connect(function() if not isExpanded then toggleMain(true, false, false) end end)
weatherContainer.MouseButton1Click:Connect(function() if not isExpanded then toggleMain(true, true, false) end end)
monitorButton.MouseButton1Click:Connect(function() if not isExpanded then toggleMain(true, false, true) end end)
closeButton.MouseButton1Click:Connect(function() if isExpanded then toggleMain(false, false, false) end end)

trendingButton.MouseButton1Click:Connect(function()
	if not isExpanded then toggleMain(true, false, false) end
	codeBox.Visible = false
	controlPanel.Visible = false
	weatherMainFrame.Visible = false
	monitorMainFrame.Visible = false
	appCreatorMain.Visible = false
	folderMain.Visible = false
	scriptMain.Visible = false
	executeConfirmFrame.Visible = false
	trendingMainFrame.Visible = true
	titleLabel.Text = "Trending Scripts"
	
	task.spawn(function()
		for _, c in ipairs(trendingScroll:GetChildren()) do
			if c:IsA("TextButton") then c:Destroy() end
		end
		local success, response = pcall(function()
			return game:HttpGet("https://scriptblox.com/api/script/trending")
		end)
		if success and response then
			local data = HttpService:JSONDecode(response)
			if data and data.result and data.result.scripts then
				local scripts = data.result.scripts
				local filtered = {}
				for _, s in ipairs(scripts) do
					local isVer = (s.verified == true or s.verified == 1)
					local isPat = (s.isPatched == true or s.isPatched == 1)
					if isVer and not isPat then
						table.insert(filtered, s)
					end
				end
				table.sort(filtered, function(a, b)
					return (a.views or 0) > (b.views or 0)
				end)
				local count = 0
				for _, s in ipairs(filtered) do
					count = count + 1
					if count > 10 then break end
					
					local scriptBtn = Instance.new("TextButton")
					scriptBtn.Size = UDim2.new(1, 0, 0, 52)
					scriptBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
					scriptBtn.BorderSizePixel = 0
					scriptBtn.Text = ""
					scriptBtn.AutoButtonColor = true
					scriptBtn.Parent = trendingScroll
					
					local sCorner = Instance.new("UICorner")
					sCorner.CornerRadius = UDim.new(0, 6)
					sCorner.Parent = scriptBtn
					
					local titleLbl = Instance.new("TextLabel")
					titleLbl.Size = UDim2.new(1, -120, 0, 24)
					titleLbl.Position = UDim2.new(0, 10, 0, 4)
					titleLbl.BackgroundTransparency = 1
					titleLbl.Font = Enum.Font.Code
					titleLbl.Text = s.title or "Unknown"
					titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
					titleLbl.TextSize = 12
					titleLbl.TextXAlignment = Enum.TextXAlignment.Left
					titleLbl.Parent = scriptBtn
					
					local gameLbl = Instance.new("TextLabel")
					gameLbl.Size = UDim2.new(1, -120, 0, 20)
					gameLbl.Position = UDim2.new(0, 10, 0, 26)
					gameLbl.BackgroundTransparency = 1
					gameLbl.Font = Enum.Font.Code
					gameLbl.Text = (s.game and s.game.name) or "Unknown Game"
					gameLbl.TextColor3 = Color3.fromRGB(180, 180, 180)
					gameLbl.TextSize = 11
					gameLbl.TextXAlignment = Enum.TextXAlignment.Left
					gameLbl.Parent = scriptBtn
					
					local tagX = -10
					if s.verified == true or s.verified == 1 then
						local tag = Instance.new("TextLabel")
						tag.Size = UDim2.new(0, 60, 0, 18)
						tag.Position = UDim2.new(1, tagX - 60, 0.5, -9)
						tag.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
						tag.BackgroundTransparency = 0.8
						tag.Font = Enum.Font.Code
						tag.Text = "Verified"
						tag.TextColor3 = Color3.fromRGB(0, 255, 255)
						tag.TextSize = 10
						tag.Parent = scriptBtn
						local tc = Instance.new("UICorner")
						tc.CornerRadius = UDim.new(0, 4)
						tc.Parent = tag
						tagX = tagX - 65
					end
					if s.key == true or s.key == 1 then
						local tag = Instance.new("TextLabel")
						tag.Size = UDim2.new(0, 65, 0, 18)
						tag.Position = UDim2.new(1, tagX - 65, 0.5, -9)
						tag.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
						tag.BackgroundTransparency = 0.8
						tag.Font = Enum.Font.Code
						tag.Text = "With Key"
						tag.TextColor3 = Color3.fromRGB(255, 255, 0)
						tag.TextSize = 10
						tag.Parent = scriptBtn
						local tc = Instance.new("UICorner")
						tc.CornerRadius = UDim.new(0, 4)
						tc.Parent = tag
						tagX = tagX - 70
					end
					
					scriptBtn.MouseButton1Click:Connect(function()
						local codeToExec = "-- loading code..."
						pcall(function()
							local res = game:HttpGet("https://scriptblox.com/api/script/" .. (s.slug or s._id))
							local dec = HttpService:JSONDecode(res)
							if dec and dec.script and dec.script.script then
								codeToExec = dec.script.script
							elseif s.script then
								codeToExec = s.script
							end
						end)
						pendingCode = codeToExec
						ecTextBox.Text = "The code is \"" .. codeToExec .. "\", are you sure wanna execute this"
						trendingMainFrame.Visible = false
						executeConfirmFrame.Visible = true
						titleLabel.Text = "Confirm Execution"
					end)
				end
				trendingScroll.CanvasSize = UDim2.new(0, 0, 0, count * 58)
			end
		end
	end)
end)

ecNevermind.MouseButton1Click:Connect(function()
	executeConfirmFrame.Visible = false
	trendingMainFrame.Visible = true
	titleLabel.Text = "Trending Scripts"
end)

ecOkay.MouseButton1Click:Connect(function()
	if pendingCode ~= "" then
		local sf, ff = pcall(loadstring, pendingCode)
		if sf and type(ff) == "function" then
			pcall(ff)
		end
	end
	executeConfirmFrame.Visible = false
	toggleMain(false, false, false)
end)

searchBox.FocusLost:Connect(function(ep)
	if ep and searchBox.Text ~= "" then
		currentCity = searchBox.Text
		saveCurrentLocation(currentCity)
		titleLabel.Text = "WEATHER: " .. currentCity
		task.spawn(updateWeatherDisplay)
	end
end)

executeButton.MouseButton1Click:Connect(function()
	if codeBox.Text ~= "" then
		local s, f = pcall(loadstring, codeBox.Text)
		if s and type(f) == "function" then pcall(f) end
	end
end)

clearButton.MouseButton1Click:Connect(function() codeBox.Text = "" end)
pasteButton.MouseButton1Click:Connect(function()
	pcall(function()
		local c = getclipboard and getclipboard() or (syn and syn.get_clipboard and syn.get_clipboard()) or (Clipboard and Clipboard.get and Clipboard.get()) or ""
		if c ~= "" then codeBox.Text = tostring(c) end
	end)
end)

local function closeMenus()
	if contextMenu.Visible then contextMenu.Visible = false end
	if deleteAppMenu.Visible then deleteAppMenu.Visible = false end
end

mainFrame.InputBegan:Connect(function(inp)
	if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then 
		resetIdleTimer() 
		closeMenus()
	end
end)

contentWindow.InputBegan:Connect(function(inp)
	if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then 
		closeMenus()
	end
end)

plusButton.MouseButton1Click:Connect(function()
	if not isExpanded then toggleMain(true, false, false) end
	codeBox.Visible = false
	controlPanel.Visible = false
	weatherMainFrame.Visible = false
	monitorMainFrame.Visible = false
	appCreatorMain.Visible = true
	
	currentAppStruct = {
		type = "Folder",
		name = "Main_App",
		children = {
			{
				type = "Script",
				name = "ClientScript",
				source = "-- executes the clientscript or script; Main_App.ClientScript:execute()\n-- finds the clientscript or script; Main_App.ClientScript:find()\n-- reads the code or clientscript or script\nMain_App.ClientScript:read()"
			}
		}
	}
	acNameInput.Text = ""
	acImageInput.Text = ""
end)

acFolderBtn.MouseButton1Click:Connect(function()
	updateFolderUI()
	appCreatorMain.Visible = false
	folderMain.Visible = true
end)

fmBack.MouseButton1Click:Connect(function()
	folderMain.Visible = false
	appCreatorMain.Visible = true
end)

smNevermind.MouseButton1Click:Connect(function()
	scriptMain.Visible = false
	folderMain.Visible = true
end)

smSave.MouseButton1Click:Connect(function()
	if currentEditingNode then
		currentEditingNode.source = smTextBox.Text
	end
	scriptMain.Visible = false
	folderMain.Visible = true
end)

local function removeNode(node, targetNode)
	if node.children then
		for i, child in ipairs(node.children) do
			if child == targetNode then
				table.remove(node.children, i)
				return true
			else
				if removeNode(child, targetNode) then return true end
			end
		end
	end
	return false
end

cmBtn1.MouseButton1Click:Connect(function()
	contextMenu.Visible = false
	renameMain.Visible = true
	if contextType == "Main" then
		rmInput.Text = "ClientScript"
		currentEditingNode = {type = "Script"}
	else
		rmInput.Text = contextTarget.name
		currentEditingNode = "Rename"
	end
end)

cmBtn2.MouseButton1Click:Connect(function()
	contextMenu.Visible = false
	if contextType == "Main" then
		renameMain.Visible = true
		rmInput.Text = "Folder"
		currentEditingNode = {type = "Folder"}
	else
		if contextTarget.name ~= "Main_App" then
			removeNode(currentAppStruct, contextTarget)
			updateFolderUI()
		end
	end
end)

damBtn.MouseButton1Click:Connect(function()
	deleteAppMenu.Visible = false
	if contextTarget then
		local appData = appsData[contextTarget]
		terminateApp(appData)
		if contextTargetBtn then
			playExplosionEffect(contextTargetBtn.AbsolutePosition, appData.appIcon ~= "" and appData.appIcon or nil)
		end
		table.remove(appsData, contextTarget)
		saveApps()
		refreshAppsUI()
	end
end)

rmClose.MouseButton1Click:Connect(function() renameMain.Visible = false end)
rmSave.MouseButton1Click:Connect(function()
	if rmInput.Text ~= "" then
		if currentEditingNode == "Rename" then
			if contextTarget.name ~= "Main_App" then
				contextTarget.name = rmInput.Text
			end
		else
			currentEditingNode.name = rmInput.Text
			if currentEditingNode.type == "Folder" then
				currentEditingNode.children = {}
			else
				currentEditingNode.source = " "
			end
			if not contextTarget.children then contextTarget.children = {} end
			table.insert(contextTarget.children, currentEditingNode)
		end
		updateFolderUI()
	end
	renameMain.Visible = false
end)

acCreateBtn.MouseButton1Click:Connect(function()
	if acNameInput.Text ~= "" and #appsData < 10 then
		local icon = acImageInput.Text
		if icon == "" then
			icon = "rbxassetid://1180538928644888"
		elseif not string.match(icon, "rbxassetid://") then
			icon = "rbxassetid://" .. icon
		end
		table.insert(appsData, {
			appName = acNameInput.Text,
			appIcon = icon,
			structure = currentAppStruct
		})
		saveApps()
		refreshAppsUI()
		appCreatorMain.Visible = false
		toggleMain(false, false, false)
	end
end)

refreshAppsUI()
resetIdleTimer()
