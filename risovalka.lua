local tooldraw = Instance.new("ScreenGui")
local canvas = Instance.new("Frame")
local undo = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local partCount = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local heading = Instance.new("TextLabel")
local X = Instance.new("TextButton")
local circleButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")

-- Properties:

tooldraw.Name = "tooldraw"
tooldraw.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
tooldraw.ResetOnSpawn = false

canvas.Name = "canvas"
canvas.Parent = tooldraw
canvas.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White for drawing area
canvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
canvas.BorderSizePixel = 3
canvas.Position = UDim2.new(0.107591286, 0, 0.34321183, 0)
canvas.Size = UDim2.new(0, 614, 0, 286)

undo.Name = "undo"
undo.Parent = canvas
undo.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
undo.BackgroundTransparency = 0.400
undo.BorderColor3 = Color3.fromRGB(0, 0, 0)
undo.BorderSizePixel = 0
undo.Position = UDim2.new(0.863454342, 0, 0.867436349, 0)
undo.Size = UDim2.new(0, 65, 0, 31)
undo.Font = Enum.Font.SourceSans
undo.Text = "↩️"
undo.TextColor3 = Color3.fromRGB(255, 255, 255) -- White
undo.TextSize = 21.000
undo.TextWrapped = true

UICorner.CornerRadius = UDim.new(0.200000003, 8)
UICorner.Parent = undo

partCount.Name = "partCount"
partCount.Parent = canvas
partCount.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
partCount.BorderColor3 = Color3.fromRGB(0, 0, 0)
partCount.BorderSizePixel = 0
partCount.Position = UDim2.new(-0.00112408074, 0, 1.03302538, 0)
partCount.Size = UDim2.new(0, 265, 0, 36)
partCount.Font = Enum.Font.SourceSansBold
partCount.Text = "PARTS: 0/0"
partCount.TextColor3 = Color3.fromRGB(255, 255, 255) -- White
partCount.TextScaled = true
partCount.TextSize = 14.000
partCount.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0.200000003, 8)
UICorner_2.Parent = partCount

heading.Name = "heading"
heading.Parent = tooldraw
heading.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
heading.BorderColor3 = Color3.fromRGB(255, 255, 255) -- White
heading.BorderSizePixel = 3
heading.Position = UDim2.new(0.107591286, 0, 0.30526374, 0)
heading.Size = UDim2.new(0, 614, 0, 26)
heading.Font = Enum.Font.Unknown
heading.Text = "ToolEditor by z0nxx"
heading.TextColor3 = Color3.fromRGB(255, 255, 255) -- White
heading.TextSize = 14.000

X.Name = "X"
X.Parent = heading
X.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
X.BorderColor3 = Color3.fromRGB(255, 255, 255) -- White
X.BorderSizePixel = 0
X.Position = UDim2.new(0.943230331, 0, 0.140418425, 0)
X.Size = UDim2.new(0, 33, 0, 17)
X.Font = Enum.Font.SourceSansBold
X.Text = "X"
X.TextColor3 = Color3.fromRGB(255, 255, 255) -- White
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

circleButton.Name = "circleButton"
circleButton.Parent = canvas
circleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
circleButton.BackgroundTransparency = 0.400
circleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
circleButton.BorderSizePixel = 0
circleButton.Position = UDim2.new(0.752442002, 0, 0.867436349, 0) -- Positioned left of undo button
circleButton.Size = UDim2.new(0, 65, 0, 31)
circleButton.Font = Enum.Font.SourceSans
circleButton.Text = "⭕"
circleButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White
circleButton.TextSize = 21.000
circleButton.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0.200000003, 8)
UICorner_3.Parent = circleButton

local player = game:GetService('Players').LocalPlayer
local RunService = game:GetService("RunService")

local used = 0

local function UTG()
    local backpack = player.Backpack:GetChildren()
    local total = #backpack
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA("Tool") then
            total = total + 1
        end
    end
    partCount.Text = "PARTS: " .. used .. "/" .. total

    if used >= total then
        partCount.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red for full
    else
        partCount.TextColor3 = Color3.fromRGB(255, 255, 255) -- White
    end
end

RunService.RenderStepped:Connect(UTG)

-- Scripts:
local function XQFJOB_fake_script()
    local script = Instance.new('LocalScript', canvas)

    local frame = script.Parent
    local isDrawing = false
    
    local toolGripOffset = Vector3.new(-27, -20, 0)

    local function toolLogic(pos)
        local backpack = player.Backpack:GetChildren()
        local canvasSize = frame.Size
        local canvasWidth = canvasSize.X.Offset
        local canvasHeight = canvasSize.Y.Offset
    
        local gripPosition = Vector3.new(
            ((pos.X - frame.AbsolutePosition.X) / canvasWidth) * 60 - 1,
            ((pos.Y - frame.AbsolutePosition.Y) / canvasHeight) * 25 - 1,
            0
        ) + toolGripOffset
    
        local tool = backpack[1]
        if tool then
            if tool:FindFirstChild('LocalScript') then
                tool.LocalScript:Destroy()
            end
        
            tool.Grip = CFrame.new(gripPosition)
            tool.Parent = player.Character
            used = used + 1
            UTG()
        end
    end

    local function createDot(position)
        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 5, 0, 5)
        dot.Position = UDim2.new(0, position.X - frame.AbsolutePosition.X, 0, position.Y - frame.AbsolutePosition.Y)
        dot.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
        dot.BorderSizePixel = 0
        dot.Parent = frame
        toolLogic(position)
    end
    
    local function handleInput(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            local backpack = player.Backpack:GetChildren()
            if #backpack > 0 then
                isDrawing = true
                createDot(input.Position)
            end
        end
    end
    
    frame.InputBegan:Connect(handleInput)
    
    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            isDrawing = false
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if isDrawing and (input.UserInputType == Enum.UserInputType.MouseMovement or 
                          input.UserInputType == Enum.UserInputType.Touch) then
            createDot(input.Position)
        end
    end)
end

coroutine.wrap(XQFJOB_fake_script)()

local function QYOUZ_fake_script()
    local script = Instance.new('LocalScript', undo)
    local button = script.Parent
    local canvas = button.Parent
    
    local function reset()
        for _, line in ipairs(canvas:GetChildren()) do
            if line:IsA("Frame") then
                line:Destroy()
            end
        end
        for _, tool in ipairs(player.Character:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = player.Backpack
            end
        end
        used = 0
        UTG()
    end
    
    button.Activated:Connect(reset)
end
coroutine.wrap(QYOUZ_fake_script)()

local function CIRCLE_fake_script()
    local script = Instance.new('LocalScript', circleButton)
    local button = script.Parent
    
    local function createCircle()
        local backpack = player.Backpack:GetChildren()
        local tools = {}
        
        -- Collect all tools from backpack
        for _, tool in ipairs(backpack) do
            if tool:IsA("Tool") then
                table.insert(tools, tool)
            end
        end
        
        -- Clear existing dots on canvas
        for _, line in ipairs(canvas:GetChildren()) do
            if line:IsA("Frame") then
                line:Destroy()
            end
        end
        
        -- Move all tools to character and position in a circle
        local radius = 5 -- Radius of the circle around the player
        local center = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if center and #tools > 0 then
            for i, tool in ipairs(tools) do
                if tool:FindFirstChild('LocalScript') then
                    tool.LocalScript:Destroy()
                end
                local angle = (i - 1) * (2 * math.pi / #tools)
                local x = math.cos(angle) * radius
                local z = math.sin(angle) * radius
                tool.Grip = CFrame.new(Vector3.new(x, 0, z))
                tool.Parent = player.Character
                used = used + 1
                
                -- Create a dot on canvas to represent the tool
                local canvasSize = canvas.Size
                local canvasWidth = canvasSize.X.Offset
                local canvasHeight = canvasSize.Y.Offset
                local canvasPos = Vector2.new(
                    (x / 60 + 1) * canvasWidth,
                    (z / 25 + 1) * canvasHeight
                )
                local dot = Instance.new("Frame")
                dot.Size = UDim2.new(0, 5, 0, 5)
                dot.Position = UDim2.new(0, canvasPos.X, 0, canvasPos.Y)
                dot.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
                dot.BorderSizePixel = 0
                dot.Parent = canvas
            end
            UTG()
        end
    end
    
    button.Activated:Connect(createCircle)
end
coroutine.wrap(CIRCLE_fake_script)()

local function XMLK_fake_script()
    local script = Instance.new('LocalScript', heading)

    local UserInputService = game:GetService("UserInputService")
    
    local header = script.Parent
    local canvas = script.Parent.Parent.canvas
    
    local dragging = false
    local dragStart, startPos
    
    local function updatePosition(input)
        local delta = input.Position - dragStart
        header.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        canvas.Position = UDim2.new(canvasStartPos.X.Scale, canvasStartPos.X.Offset + delta.X, canvasStartPos.Y.Scale, canvasStartPos.Y.Offset + delta.Y)
    end
    
    local function onInputBegan(input, gameProcessed)
        if gameProcessed then return end
        
        local inputPosition = input.Position
        local headerPosition = header.AbsolutePosition
        local headerSize = header.AbsoluteSize
        
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and
           inputPosition.X >= headerPosition.X and inputPosition.X <= headerPosition.X + headerSize.X and
           inputPosition.Y >= headerPosition.Y and inputPosition.Y <= headerPosition.Y + headerSize.Y then
            dragging = true
            dragStart = inputPosition
            startPos = header.Position
            canvasStartPos = canvas.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end
    
    local function onInputChanged(input, gameProcessed)
        if gameProcessed then return end
        
        if dragging and 
           (input.UserInputType == Enum.UserInputType.MouseMovement or 
            input.UserInputType == Enum.UserInputType.Touch) then
            updatePosition(input)
        end
    end
    
    UserInputService.InputBegan:Connect(onInputBegan)
    UserInputService.InputChanged:Connect(onInputChanged)
end
coroutine.wrap(XMLK_fake_script)()

local function FKUSJ_fake_script()
    local script = Instance.new('LocalScript', X)

    local button = script.Parent
    local gui = button.Parent.Parent
    
    local function closeGUI()
        gui:Destroy()
    end
    
    button.Activated:Connect(closeGUI)
end
coroutine.wrap(FKUSJ_fake_script)()
