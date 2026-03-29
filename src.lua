-- The start of this Shhit 

--[[
	Warning this shit is severely skided, pasted, stolen and stuff like that
	First time doing oop type shit and didnt know how to do it so i am sorry

	Dev : degvidh 	Discord: degvidh 	
	
	I lost alot of brain cells working on it lmao
--]]

local Load
repeat 
	Load = tick() -- the tick when it loaded in
	task.wait()   -- we wait a small amount
until game:IsLoaded()

-- vars
local TweenService     = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')
local RunService       = game:GetService('RunService')
local TextService      = game:GetService('TextService')
local Players          = game:GetService('Players')
local HttpService      = game:GetService('HttpService')
local RenderStepped    = game:GetService('RunService').RenderStepped
local LocalPlayer      = Players.LocalPlayer
local Mouse            = LocalPlayer:GetMouse()
local Camera           = workspace.CurrentCamera
local ViewportSize     = Camera.ViewportSize
local CoreGui          = LocalPlayer:WaitForChild("PlayerGui") --or gethui() RunService:IsStudio() and 

--if CoreGui:WaitForChild("ScreenGui").Enabled  then CoreGui:WaitForChild("ScreenGui").Enabled = false end

-- current camera
RenderStepped:Connect(function()
	Camera = workspace.CurrentCamera
end)

-- library tables
local library   = { 
	opened      = true; 
	connections = {}; 
	themes      = {}; 
	objects     = {}; 
	colors      = {};
}
local utility   = {}
local tab       = {}
local frame     = {}
local addons    = {}

-- theme
local theme    = {
	accent        = Color3.fromRGB(190, 150, 115);
	lightcontrast = Color3.fromRGB(17, 17, 17);
	darkcontrast  = Color3.fromRGB(15, 15, 15);
	outline       = Color3.fromRGB(0, 0, 0);
	inline        = Color3.fromRGB(33, 33, 33);
	textcolor     = Color3.fromRGB(255, 255, 255);
	textdark      = Color3.fromRGB(100, 100, 100);
	textsize      = 12;
}

utility.__index = utility
library.__index = library
tab.__index     = tab
frame.__index   = frame
addons.__index  = addons

-- utility
do

	-- ui creation stuff

	function utility:Create(class, properties)

		local __meta = setmetatable({}, self)
		__meta.object = Instance.new(class)

		for i, v in next, properties do
			__meta.object[i] = v
		end

		library.objects[#library.objects+1] = __meta

		return __meta
	end

	function utility:CreateFrameWithOutline(properties1, properties2, parent)
		
		local frame1 = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 1;
			BackgroundColor3 = theme.inline;
			BorderColor3 = theme.outline;
			AnchorPoint = Vector2.new(0.5, 0.5);
			Size = UDim2.fromOffset(768, 562);
			Selectable = true; 
			Position = UDim2.new(0.5,0,0.5,0);
			Parent =  parent;
		})
		
		library.colors[frame1] = {
			Color		 = "inline";
			OutlineColor = "outline";
		}

		for i, v in next, properties1 do
			frame1.object[i] = v
		end

		local frame2 = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundColor3 = theme.lightcontrast;
			BorderColor3	= theme.outline;
			Size = UDim2.new(1, -2, 1, -2);
			Selectable = true;
			Position = UDim2.new(0, 1, 0, 1);
			Parent =  frame1:Get();
		})
		
		library.colors[frame2] = {
			Color		 = "lightcontrast";
			OutlineColor = "outline";
		}
		
		for i, v in next, properties2 do
			frame2.object[i] = v
		end
		
		return frame1, frame2
	end

	function utility:CreateLineWithShadow(properties1, properties2, parent)
		
		local line1 = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 0;
			BackgroundColor3 = theme.outline;
			Size = UDim2.new(1, -16, 0, 1);
			Selectable = true;
			BorderColor3 = theme.outline;
			Position = UDim2.new(0, 8, 0, 32);
			Parent = parent;
		})

		library.colors[line1] = {
			Color		 = "outline";
			OutlineColor = "outline";
		}

		for i, v in next, properties1 do
			line1.object[i] = v
		end

		local line2 = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 0;
			BackgroundColor3 = theme.inline;
			Size = UDim2.new(1, -16, 0, 1);
			Selectable = true;
			BorderColor3 = theme.outline;
			Position = UDim2.new(0, 8, 0, 33);
			Parent = parent;
		})

		library.colors[line2] = {
			Color		 = "inline";
			OutlineColor = "outline";
		}

		for i, v in next, properties2 do
			line2.object[i] = v
		end

		return line1, line2

	end
	
	function utility:CreateScrollingFrame(properties1, parent)
		
		local scrollingframe = utility:Create("ScrollingFrame",{
			Name = utility:RandomString(math.random(0,1000));	
			Active = true;	
			ScrollBarThickness = 0;
			BackgroundTransparency = 1;
			BorderSizePixel = 0;
			Size = UDim2.new(0, 248, 1, 0);
			Parent = parent;
		})

		for i, v in next, properties1 do
			scrollingframe.object[i] = v
		end

		local uilistlayout = utility:Create("UIListLayout",{
			Name = utility:RandomString(math.random(0,1000));
			FillDirection = "Horizontal";
			HorizontalAlignment = "Left";
			Padding = UDim.new(0, 8);
			SortOrder = "LayoutOrder";
			VerticalAlignment = "Top";
			Parent = scrollingframe:Get();
		})

		local uipadding = utility:Create("UIPadding",{
			PaddingBottom = UDim.new(0, 0);
			PaddingLeft = UDim.new(0, 8);
			PaddingRight = UDim.new(0, 4);
			PaddingTop = UDim.new(0, 8);
			Parent = scrollingframe:Get();
		})
		
		return scrollingframe, uilistlayout, uipadding
		
	end
	
	function utility:CreateLineWithOutline(properties1, parent)

		local line = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			AnchorPoint = Vector2.new(0, 0);
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 0;
			BackgroundColor3 = theme.accent;
			Size = UDim2.new(1, 2, 0, 1);
			Selectable = true;
			BorderColor3 = theme.outline;
			Visible = true;
			Position = UDim2.new(0, -1, 0, 0);
			Parent = parent:Get();
		})

		library.colors[line] = {
			Color		 = "accent";
			OutlineColor = "outline";
		}

		for i, v in next, properties1 do
			line.object[i] = v
		end

		local uistoke = utility:Create("UIStroke",{
			Name = utility:RandomString(math.random(0,1000));
			Parent = line:Get();
		})

		return line, uistoke

	end

	function utility:CreateGradientFrame(parent, rotation, colorSeq, transparencySeq, size, positon)
		local frame = utility:Create("Frame", {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			Position = (positon ~= 0 and positon) or UDim2.new(0, 0, 0, 0);
			Size = (size ~= 0 and size) or UDim2.new(1, 0, 1, 0),
			Parent = parent
		})

		local gradient = utility:Create("UIGradient", {
			Parent = frame:Get(),
			Rotation = rotation,
			Color = colorSeq,
			Transparency = (transparencySeq ~= 0 and transparencySeq) or NumberSequence.new(0),
		})

		return frame, gradient
	end

	function utility:CreateGradientImage(parent, image, rotation, colorSeq, transparencySeq, size, positon)
		local frame = utility:Create("ImageLabel", {
			Image = image or "rbxassetid://120342797917581",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			Position = (positon ~= 0 and positon) or UDim2.new(0, 0, 0, 0);
			Size = (size ~= 0 and size) or UDim2.new(1, 0, 1, 0),
			Parent = parent,
		})

		local gradient = utility:Create("UIGradient", {
			Parent = frame:Get(),
			Rotation = rotation,
			Color = colorSeq,
			Transparency = (transparencySeq ~= 0 and transparencySeq) or NumberSequence.new(0),
		})

		return frame, gradient
	end

	function utility:Properties(properties)

		for i, v in next, properties do
			self.object[i] = v
		end

	end

	function utility:Get()

		return self.object

	end

	function utility:Delete()

		self.object:Destroy()

	end

	-- ui interaction utilities

	function utility:GetTextBounds(Text, Font, Size)
		local params = Instance.new("GetTextBoundsParams")

		local object = self.object
		params.Text = object and object.Text or Text
		params.Font = object and object.FontFace or Font
		params.Size = object and object.TextSize or Size
		params.Width = 0

		local Bounds = TextService:GetTextBoundsAsync(params)

		return Bounds.X, Bounds.Y
	end

	function utility:GetAbsolutePosition()
		local object = self.object
		if object and object:IsA("GuiObject") then
			return object.AbsolutePosition.X, object.AbsolutePosition.Y
		end
		return nil, nil -- Return nil if the object is not valid
	end

	function utility:GetAbsoluteSize()
		local object = self.object
		if object and object:IsA("GuiObject") then
			return object.AbsoluteSize.X, object.AbsoluteSize.Y
		end
		return nil, nil -- Return nil if the object is not valid
	end

	function utility:MakeFrameDraggable()
		local object          = self.object
		local dragInput       = nil
		local dragStart       = nil
		local startPos        = nil
		local Dragging        = false
		local preparingToDrag = false


		local function update(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)

			TweenService:Create(object, TweenInfo.new(0.150), {
				Position = position
			}):Play()

			return position
		end

		object.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				preparingToDrag = true

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End and (Dragging or preparingToDrag) then
						Dragging = false
						preparingToDrag = false
					end
				end)
			end
		end)

		object.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if object.Parent == nil then
				return
			end
			if preparingToDrag then
				preparingToDrag = false

				Dragging    = true
				dragStart = input.Position
				startPos = object.Position
			end
			if input == dragInput and Dragging then
				update(input)
			end
		end)

		return self
	end

	function utility:TweenObject(object, properties, duration, easingStyle, easingDirection)
		local tweenInfo = TweenInfo.new(duration or 0.5, easingStyle or Enum.EasingStyle.Quad, easingDirection or Enum.EasingDirection.Out)
		local tween = TweenService:Create(object, tweenInfo, properties)
		tween:Play()
		return tween -- Return the tween in case you need to stop it
	end

	-- text interaction utilities

	function utility:RandomString(length)
		local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		local randomString = ""
		local charCount = string.len(characters)

		for i = 1, length do
			local randomIndex = math.random(1, charCount)
			randomString = randomString .. string.sub(characters, randomIndex, randomIndex)
		end

		return randomString
	end;

	-- Connections

	function utility:Connection(connectionType, connectionCallback)
		local connection = connectionType:Connect(connectionCallback)
		library.connections[#library.connections + 1] = connection
		--
		return connection
	end

	function utility:Disconnect(connection)
		for i,v in pairs(library.connections) do
			if v == connection then
				library.connections[i] = nil
				v:Disconnect()
			end
		end
	end

	-- checking utilities

	function utility:IsMouseOver(Frame)
		local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize

		if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X
			and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then
			return true;
		end
		return false
	end

	-- table interaction utilities

	function utility:ValidateOptions(defaults, options)
		for i, v in pairs(defaults) do
			if options[i] == nil then
				options[i] = v
			end
		end;
		return options
	end

	-- theme utilities

	function utility:ThemeUpdate()
		
		

	end

	function utility:ThemeSave()

	end

	function utility:ThemeLoad()
		
	end

	-- number utilities

	function utility:MakeEvenUp(n)
		return n % 2 == 0 and n or n + 1
	end

	-- color utilities

	function utility:AdjustColor(color, factor)
		return Color3.new(
			math.clamp(color.R * factor, 0, 1),
			math.clamp(color.G * factor, 0, 1),
			math.clamp(color.B * factor, 0, 1)
		)
	end

	function utility:Color3ToHex(color)
		return string.format("#%02X%02X%02X", color.R * 255, color.G * 255, color.B * 255)
	end

end

-- funcs
do
	
	--[[
	##################### func lib:new #####################

		[+] Creates the main frame and the outline
		[+] Creates the containers for the buttons and frames
		[+] Creates the cool line and the name 

	returned table && its metatable:

	return setmetatable(
		{
			["currenttab"] = nil;
			["framebuttons"] = the_instance;
			["framecontainers"] = the_instance;
			["screenGui"] = the_instance;
			["isVisible"] = boolean;
		},

		{
			__index = library
		}
	)
	
	]]--

	function library:New(option)

		local options = utility:ValidateOptions({
			Size = UDim2.fromOffset(768, 562)
		}, option or {})

		local screengui = utility:Create("ScreenGui",{
			Name = utility:RandomString(math.random(0,1000));
			IgnoreGuiInset = true;
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
			ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets;
			Parent = CoreGui;
		})

		local outline, frame = utility:CreateFrameWithOutline({}, {}, screengui:Get())

		outline:MakeFrameDraggable()
		
		local framecontainers = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 1;
			BackgroundTransparency = 0;
			BackgroundColor3 = theme.inline;
			Size = UDim2.new(1, -16, 1, -72);
			Selectable = true;
			BorderColor3 = theme.outline;
			Position = UDim2.new(0, 8, 0, 64);
			Parent = frame:Get();
		})

		local framebuttons = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 1;
			BackgroundColor3 = theme.inline;
			Size = UDim2.new(1, -16, 0, 28);
			Selectable = true;
			BorderColor3 = theme.outline;
			Position = UDim2.new(0, 8, 0, 34);
			Parent = frame:Get();
		})

		local uilistlayout = utility:Create("UIListLayout",{
			Name = utility:RandomString(math.random(0,1000));
			FillDirection = "Horizontal";
			HorizontalAlignment = "Center";
			Padding = UDim.new(0, 0);
			SortOrder = "LayoutOrder";
			VerticalAlignment = "Top";
			Parent = framebuttons:Get();
		})

		local line1, line2 = utility:CreateLineWithShadow({}, {}, frame:Get())

		local name = utility:Create("TextLabel",{
			Name = utility:RandomString(math.random(0,1000));
			TextStrokeTransparency = 0;
			Active = true;
			BackgroundTransparency = 1;
			BorderSizePixel = 0;
			TextXAlignment = Enum.TextXAlignment.Center;
			FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			TextSize = theme.textsize;
			TextColor3 = theme.textcolor;
			Selectable = true;
			RichText = true;
			Text = 'net.cut - <font color="#'..utility:Color3ToHex(theme.accent)..'">soultions</font>';
			Position = UDim2.new(0, 0, 0, 0);
			Size = UDim2.new(1, 0, 0, 32);
			ZIndex = 2;
			Parent = frame:Get()
		})

		return setmetatable(
			{
				["currenttab"] = nil;
				["isVisible"] = true;
				["framebuttons"] = framebuttons:Get();
				["framecontainers"] = framecontainers:Get();
				["screenGui"] = screengui:Get();
			}, 
			{
				__index = library
			}
		)

	end

	--[[
	##################### func lib:newTab #####################

		[+] Creates tab button
		[+] Gives the button the texts size
		[+] Creates the line beneath it
		[+] Creates frame in the frame container 

	returned table && its metatable:

	return setmetatable(
		{
			["isVisible"] = boolean;
			["active"] = boolean,
			["container"] = the_instance,
			["scrollingframes"] =  ▼  {
				[1] = the_instance,
				[2] = the_instance,
				[3] = the_instance
			}
		}, 
		{
			__index = tab
		}
	)
	]]--

	function library:NewTab(option)
		local options = utility:ValidateOptions({
			Text = 'Test';
		}, option or {})

		local library = self

		local thistab = { active = false; }

		local tabtext = utility:Create("TextLabel",{
			Name = utility:RandomString(math.random(0,1000));
			TextStrokeTransparency = 0;
			Active = true;
			BackgroundTransparency = 1;
			BorderSizePixel = 0;
			TextXAlignment = Enum.TextXAlignment.Center;
			FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			TextSize = theme.textsize;
			TextColor3 = theme.textdark;
			Selectable = true;
			RichText = false;
			Text = options.Text;
			Position = UDim2.new(0, 0, 0, 0);
			Size = UDim2.new(0, utility:MakeEvenUp(utility:GetTextBounds(options.Text, Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),theme.textsize) + 64), 0,  self.framebuttons.AbsoluteSize.Y);
			ZIndex = 2;
			Parent = self.framebuttons
		})

		local line = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			AnchorPoint = Vector2.new(0.5, 0.5);
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 0;
			BackgroundColor3 = theme.accent;
			Size = UDim2.new(0, 0, 0, 1);
			Selectable = true;
			BorderColor3 = theme.outline;
			Visible = true;
			Position = UDim2.new(0.5, 0, 1, 1);
			Parent = tabtext:Get();
		})

		library.colors[line] = {
			Color		 = "accent";
			OutlineColor = "outline";
		}

		local container = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 0;
			BackgroundColor3 = theme.lightcontrast;
			BorderColor3	= theme.outline;
			Size = UDim2.new(1, -2, 1, -2);
			Selectable = true;
			Position = UDim2.new(0, 1, 0, 1);
			Visible = false;
			Parent = self.framecontainers
		})

		local uilistlayout = utility:Create("UIListLayout",{
			Name = utility:RandomString(math.random(0,1000));
			FillDirection = "Horizontal";
			HorizontalAlignment = "Left";
			Padding = UDim.new(0, 0);
			SortOrder = "LayoutOrder";
			VerticalAlignment = "Top";
			Parent = container:Get();
		})

		local scrollingframe1 = utility:CreateScrollingFrame({}, container:Get())

		local scrollingframe2 = utility:CreateScrollingFrame({}, container:Get())

		local scrollingframe3 = utility:CreateScrollingFrame({}, container:Get())

		thistab.tabtext = tabtext:Get();
		
		thistab.line = line:Get()
		
		thistab.container = container:Get();

		utility:Connection(tabtext:Get().InputBegan,function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement and utility:IsMouseOver(tabtext:Get()) and library.isVisible then
				utility:TweenObject(tabtext:Get(), {TextColor3 = theme.textcolor}, 0.4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
			end
			if Input.UserInputType == Enum.UserInputType.MouseButton1 and utility:IsMouseOver(tabtext:Get()) and library.isVisible then
				if not thistab.active then
					thistab:Show()
				end
			end
		end)

		utility:Connection(tabtext:Get().InputEnded,function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement and not utility:IsMouseOver(tabtext:Get()) and library.isVisible and not thistab.active then
				utility:TweenObject(tabtext:Get(), {TextColor3 = theme.textdark}, 0.4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
			end
		end)

		function thistab:Fade()
			for _, instance in pairs(self.container:GetDescendants()) do
				if instance:IsA("UIListLayout") or instance:IsA("ScrollingFrame") 
					or instance:IsA("UIPadding") or instance:IsA("UIStroke") then 
					continue 
				end
				if instance:IsA("TextLabel") then
					instance.TextTransparency = 1
					utility:TweenObject(instance, {TextTransparency = 0}, 0.3, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				elseif instance:IsA("UIGradient") then
					instance.Enabled = false
					instance.Parent.BackgroundColor3 = theme.lightcontrast
					utility:TweenObject(instance.Parent, {BackgroundColor3 = theme.darkcontrast}, 0.3, Enum.EasingStyle.Circular, Enum.EasingDirection.Out).Completed:Connect(function()
						instance.Parent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						instance.Enabled = true
					end)
				else
					if instance.BackgroundTransparency == 1 then continue end
					local color3 = instance.BackgroundColor3
					instance.BackgroundColor3 = theme.lightcontrast
					utility:TweenObject(instance, {BackgroundColor3 = color3}, 0.3, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				end
			end
		end

		function thistab:Show()
			if library.currenttab ~= thistab and library.currenttab then
				utility:TweenObject(library.currenttab.tabtext, {TextColor3 = theme.textdark}, 0.4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				utility:TweenObject(library.currenttab.line, {Size = UDim2.new(0, 0, 0, 1);}, 0.6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				library.currenttab.container.Visible = false
				library.currenttab.active = false

				thistab.active = true
				container:Get().Visible = true
				thistab:Fade()
				utility:TweenObject(tabtext:Get(), {TextColor3 = theme.textcolor}, 0.1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				utility:TweenObject(line:Get(), {Size = UDim2.new(1, 0, 0, 1);}, 0.6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)

				library.currenttab = thistab
			end
		end

		if library.currenttab == nil then

			library.currenttab = thistab

			thistab.active = true

			utility:TweenObject(tabtext:Get(), {TextColor3 = theme.textcolor}, 0.1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
			utility:TweenObject(line:Get(), {Size = UDim2.new(1, 0, 0, 1)}, 0.3, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)

			container:Get().Visible = true

			thistab:Fade()
		end

		return setmetatable(
			{
				["isVisible"] = self.isVisible;
				["active"]    = thistab.active;
				["container"] = thistab.container;
				["screenGui"] = self.screenGui;
				["scrollingframes"] =  {
					[1]         = scrollingframe1:Get();
					[2]         = scrollingframe2:Get();
					[3]         = scrollingframe3:Get();
				}
			}, 
			{
				__index = tab
			}
		)
	end

	--[[
	##################### func lib:NewFrame #####################

		[+] Creates the frame 
		[+] Creates the frame close thingy
		[+] Creates the container for the buttons etc

	returned table && its metatable:

	return setmetatable(
		{
			["isVisible"] = boolean;
			["active"] = boolean;
			["containerframe"] = the_instance;
		}, 
		{
			__index = frame
		}
	)
	]]--

	function tab:NewFrame(option)
		local options = utility:ValidateOptions({
			Name  = 'Test';
			SizeY = 250;
			Type  = 1;	 -- types???
			Side  = 1;  -- idk like 1 2 3 ??
		}, option or {})

		local container, mainframe = utility:CreateFrameWithOutline(
			{
				Size = UDim2.new(1, 0, 0, options.SizeY);
				Position = UDim2.new(0, 0, 0, 0);
			}, 
			{
				BackgroundColor3 = theme.darkcontrast;
				Size = UDim2.new(1, -2, 1, -2);
				Position = UDim2.new(0, 1, 0, 1);
			}, 
			self.scrollingframes[options.Side])
		
		library.colors[mainframe] = {
			Color		 = "darkcontrast";
			OutlineColor = "outline";
		}

		local line, uistoke = utility:CreateLineWithOutline({}, container)

		local containerframe = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundColor3 = theme.darkcontrast;
			BorderColor3	= theme.outline;
			Size = UDim2.new(1, 0, 0.87, 0);
			Selectable = true;
			Position = UDim2.new(0, 0, 0, 18);
			Visible = true;
			Parent = mainframe:Get()
		})

		local uilistlayoutcontainer = utility:Create("UIListLayout",{
			Name = utility:RandomString(math.random(0,1000));
			FillDirection = "Vertical";
			HorizontalAlignment = "Left";
			Padding = UDim.new(0, 6);
			SortOrder = "LayoutOrder";
			VerticalAlignment = "Top";
			Parent = containerframe:Get();
		})

		local uipaddingcontainer = utility:Create("UIPadding",{
			PaddingBottom = UDim.new(0, 8);
			PaddingLeft = UDim.new(0, 8);
			PaddingRight = UDim.new(0, 8);
			PaddingTop = UDim.new(0, 8);
			Parent = containerframe:Get();
		})

		local containername = utility:Create("TextLabel",{
			Name = utility:RandomString(math.random(0,1000));
			TextStrokeTransparency = 0;
			Active = true;
			BackgroundTransparency = 1;
			BorderSizePixel = 0;
			TextXAlignment = Enum.TextXAlignment.Left;
			FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			TextSize = theme.textsize;
			TextColor3 = theme.textcolor;
			Selectable = true;
			RichText = false;
			Text = options.Name;
			Position = UDim2.new(0, 4, 0, 0);
			Size = UDim2.new(1, -8, 0,  20);
			ZIndex = 2;
			Parent = mainframe:Get()
		})

		local containerclose = utility:Create("TextLabel",{
			Name = utility:RandomString(math.random(0,1000));
			TextStrokeTransparency = 0;
			Active = true;
			BackgroundTransparency = 1;
			BorderSizePixel = 0;
			TextXAlignment = Enum.TextXAlignment.Center;
			FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			TextSize = theme.textsize;
			TextColor3 = theme.textdark;
			Selectable = true;
			RichText = false;
			Text = "^";
			Position = UDim2.new(1, -12, 0, 2);
			Rotation = -180;
			Size = UDim2.new(0, 7, 0, 13);
			ZIndex = 2;
			Parent = mainframe:Get()
		})

		return setmetatable(
			{
				["isVisible"] = self.isVisible;
				["active"] = self.active;
				["screenGui"] = self.screenGui;
				["containerframe"] = containerframe:Get();
			}, 
			{
				__index = frame
			}
		)
	end

	--[[
	##################### func lib:NewButton #####################

		[+] Creates the button 
		[+] Creates the buttons gradient

	returned table && its metatable:

	return setmetatable(
		{
			["isVisible"] = self.isVisible;
			["active"] = self.active;
		}, 
		
		{
			__index = frame
		}
	)

	TODO: maybe make it so instaed of frame there would be a diff 
	metatable witch is going to have methods for something like get
	or set and so on yk? and make them work on everybutton and the 
	other ui parts :3

	]]--

	function frame:NewButton(option)
		local options = utility:ValidateOptions({
			Text  = 'Test';
			Callback = function() 
				print("test")
			end;
		}, option or {})

		local button = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 1;
			BackgroundTransparency = 0;
			BackgroundColor3 = theme.inline;
			BorderColor3	= theme.outline;
			Size = UDim2.new(1, 0, 0, 22);
			Selectable = true;
			Position = UDim2.new(0, 0, 0, 0);
			Visible = true;
			Parent = self.containerframe
		})

		local frame = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 0;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BorderColor3	= theme.outline;
			Size = UDim2.new(1, -2, 1, -2);
			Selectable = true;
			Position = UDim2.new(0, 1, 0, 1);
			Visible = true;
			Parent = button:Get()
		})

		local uigradient = utility:Create("UIGradient",{
			Name = utility:RandomString(math.random(0,1000));
			Rotation = 90;
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(17, 17, 17)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(13, 13, 13))};
			Parent = frame:Get();
		})

		local textbutton = utility:Create("TextLabel",{
			Name = utility:RandomString(math.random(0,1000));
			TextStrokeTransparency = 0;
			ZIndex = 2;
			BorderSizePixel = 0;
			TextXAlignment = Enum.TextXAlignment.Center;
			FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			TextSize = theme.textsize;
			TextColor3 = theme.textdark;
			BackgroundColor3 = theme.darkcontrast;
			BackgroundTransparency = 1;
			BorderColor3 = theme.outline;
			Text = options.Text;
			Size = UDim2.new(1, -2, 1 , -2);
			Position = UDim2.new(0, 1, 0, 1);
			Parent = frame:Get()
		})


		utility:Connection(textbutton:Get().InputBegan,function(Input)

			if Input.UserInputType == Enum.UserInputType.MouseMovement and utility:IsMouseOver(textbutton:Get()) and self.active then
				utility:TweenObject(textbutton:Get(), {TextColor3 = utility:AdjustColor(theme.accent, 1)}, 0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			end

			if Input.UserInputType == Enum.UserInputType.MouseButton1 and utility:IsMouseOver(textbutton:Get()) and self.active then
				uigradient:Get().Enabled = false
				frame:Get().BackgroundColor3 = theme.inline;
				utility:TweenObject(button:Get(), {BackgroundColor3 = utility:AdjustColor(theme.accent, 0.6)}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				utility:TweenObject(textbutton:Get(), {TextColor3 = utility:AdjustColor(theme.accent, 0.8)}, 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				utility:TweenObject(frame:Get(), {BackgroundColor3 = utility:AdjustColor(theme.accent, 0.6)}, 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				options.Callback()
				wait(0.1)
				utility:TweenObject(frame:Get(), {BackgroundColor3 = theme.inline}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				utility:TweenObject(button:Get(), {BackgroundColor3 = theme.inline}, 0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				utility:TweenObject(frame:Get(), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.01, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				uigradient:Get().Enabled = true
			end
		end)

		utility:Connection(textbutton:Get().InputEnded,function(Input)

			if Input.UserInputType == Enum.UserInputType.MouseMovement and not utility:IsMouseOver(textbutton:Get()) and self.active then
				utility:TweenObject(textbutton:Get(), {TextColor3 = theme.textdark}, 0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			end
		end)

		return setmetatable(
			{
				["isVisible"] = self.isVisible;
				["active"] = self.active;
			}, 
			
			{
				__index = frame
			}
		)
		
	end

	function frame:NewToggle(option)
		local options = utility:ValidateOptions({
			Text  = 'Test';
			Type  = 'Default'; -- Default/Keybind/Colorpicker/Colorpicker_2/Both
			CallBack = function()
				print("no callback")
			end;
		}, option or {})

		local toggle = { 
			frame = self;
			state = false; 
			keybind = false;
			colorpicker = false;
		}

		local sizeX, sizey = utility:GetTextBounds(options.Text, Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),theme.textsize)

		local toggleframe = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 1;
			BackgroundColor3 = theme.inline;
			BorderColor3	= theme.outline;
			Size = UDim2.new(1, 0, 0, 16);
			Selectable = true;
			Position = UDim2.new(0, 0, 0, 0);
			Visible = true;
			Parent = self.containerframe
		})

		local outline = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 1;
			BackgroundTransparency = 0;
			BackgroundColor3 = theme.inline;
			BorderColor3	= theme.outline;
			Size = UDim2.new(0, 13, 0, 13);
			Selectable = true;
			Position = UDim2.new(0, 0, 0, 0);
			Visible = true;
			Parent = toggleframe:Get()
		})

		local inner = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 0;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BorderColor3	= theme.outline;
			Size = UDim2.new(1, -2, 1, -2);
			Selectable = true;
			Position = UDim2.new(0, 1, 0, 1);
			Visible = true;
			Parent = outline:Get()
		})

		local uigradient = utility:Create("UIGradient",{
			Name = utility:RandomString(math.random(0,1000));
			Rotation = 90;
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(17, 17, 17)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(13, 13, 13))};
			Parent = inner:Get()
		})

		local name = utility:Create("TextLabel",{
			Name = utility:RandomString(math.random(0,1000));
			TextStrokeTransparency = 0;
			ZIndex = 2;
			BorderSizePixel = 0;
			TextXAlignment = Enum.TextXAlignment.Left;
			FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			TextSize = theme.textsize;
			TextColor3 = theme.textdark;
			BackgroundColor3 = theme.darkcontrast;
			BackgroundTransparency = 0;
			BorderColor3 = theme.outline;
			Text = options.Text;
			Size = UDim2.new(0, sizeX, 1, 0);
			Position = UDim2.new(0, 19, 0, 0);
			Parent = outline:Get()
		})

		local container = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			Active = true;
			BorderSizePixel = 0;
			BackgroundTransparency = 1;
			Size = UDim2.new(1, 0, 1, 0);
			Selectable = true;
			Position = UDim2.new(0, 0, 0, 0);
			Visible = true;
			Parent = toggleframe:Get()
		})

		local uilistlayout = utility:Create("UIListLayout",{
			Name = utility:RandomString(math.random(0,1000));
			FillDirection = "Horizontal";
			HorizontalAlignment = "Right";
			Padding = UDim.new(0, 4);
			SortOrder = "LayoutOrder";
			VerticalAlignment = "Top";
			Parent = container:Get();
		})

		function toggle:AnimateToggle(state)

			if state then
				utility:TweenObject(outline:Get(), {BackgroundColor3 = theme.accent}, 0.6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				uigradient:Get().Enabled = false
				inner:Get().BackgroundColor3 = theme.lightcontrast
				utility:TweenObject(inner:Get(), {BackgroundColor3 = theme.accent}, 0.6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				utility:TweenObject(inner:Get(), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				utility:TweenObject(name:Get(), {TextColor3 = theme.textcolor}, 0.4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				uigradient:Get().Enabled = true
				uigradient:Get().Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, utility:AdjustColor(theme.accent, 0.8)),ColorSequenceKeypoint.new(1.000, utility:AdjustColor(theme.accent, 0.6))} 

			else 
				utility:TweenObject(outline:Get(), {BackgroundColor3 = theme.inline}, 0.6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				uigradient:Get().Enabled = false
				inner:Get().BackgroundColor3 = theme.accent
				utility:TweenObject(inner:Get(), {BackgroundColor3 = theme.lightcontrast}, 0.6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				utility:TweenObject(inner:Get(), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				utility:TweenObject(name:Get(), {TextColor3 = theme.textdark}, 0.4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
				uigradient:Get().Enabled = true
				uigradient:Get().Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(17, 17, 17)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(13, 13, 13))};
			end

		end

		utility:Connection(name:Get().InputBegan,function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement and utility:IsMouseOver(name:Get()) and self.active then
				utility:TweenObject(name:Get(), {TextColor3 = theme.textcolor}, 0.4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
			end
		end)

		utility:Connection(name:Get().InputEnded,function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement and not utility:IsMouseOver(name:Get()) and self.active and not toggle.state then
				utility:TweenObject(name:Get(), {TextColor3 = theme.textdark}, 0.4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
			end
		end)

		utility:Connection(toggleframe:Get().InputBegan, function(input, gpe)
			if gpe then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 and (utility:IsMouseOver(outline:Get()) or utility:IsMouseOver(name:Get())) and self.active then
				toggle.state = not toggle.state
				toggle:AnimateToggle(toggle.state)
				options.CallBack(toggle.state)
			end
		end)

		return setmetatable(
			{
				["isVisible"] = self.isVisible;
				["active"] = self.active;
				["screenGui"] = self.screenGui;
				["container"] = container:Get()
			}, 

			{
				__index = addons
			}
		)
	end

	function addons:AddColorPicker()

		local colorpicker = {
			Opened = false;
		}

		-- Adding to the toggle or the label we have the colorpicker thing

		local outline = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			BackgroundColor3 = theme.inline;
			BackgroundTransparency = 0;
			BorderColor3 = theme.outline;
			BorderSizePixel = 1;
			Position = UDim2.new(0, 0, 0, 0);
			Size = UDim2.new(0, 24, 0, 14);
			Parent = self.container
		})

		local innercolorpicker, gradientcolorpicker = utility:CreateGradientFrame(outline:Get(), 90,
			ColorSequence.new{ColorSequenceKeypoint.new(0.000, utility:AdjustColor(theme.accent, 0.8)),
			ColorSequenceKeypoint.new(1.000, utility:AdjustColor(theme.accent, 0.6))},
			0,
			UDim2.new(1, -2, 1, -2),
			UDim2.new(0, 1, 0, 1)
		)

		local uistroke = utility:Create("UIStroke",{
			Name = utility:RandomString(math.random(0,1000));
			Color = Color3.fromRGB(255, 255, 255);
			Parent = innercolorpicker:Get();
		})

		local innerimage = utility:Create("ImageLabel", {
			Image = "rbxassetid://101927577839657",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			Parent = outline:Get()
		})

		-- Makeing the over all frame 

		local colorpickerframe = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			BackgroundColor3 = theme.inline;
			BackgroundTransparency = 0;
			BorderColor3 = theme.outline;
			BorderSizePixel = 1;
			Position = UDim2.new(0, 0, 0, 0);
			Size = UDim2.new(0, 212, 0, 200);
			Parent = self.screenGui;
			Visible = false;
		})

		--

		local mainframe = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			BackgroundColor3 = theme.lightcontrast;
			BackgroundTransparency = 0;
			BorderColor3 = theme.outline;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 1, 0, 1);
			Size = UDim2.new(1, -2, 1, -2);
			Parent = colorpickerframe:Get()
		})

		utility:Create("UIPadding",{
			PaddingBottom = UDim.new(0, 8);
			PaddingLeft = UDim.new(0, 8);
			PaddingRight = UDim.new(0, 8);
			PaddingTop = UDim.new(0, 8);
			Parent = mainframe:Get();
		})

		-- The containers

		local containermain = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			BackgroundColor3 = theme.inline;
			BackgroundTransparency = 1;
			BorderColor3 = theme.outline;
			BorderSizePixel = 1;
			Position = UDim2.new(0, 0, 0, 0);
			Size = UDim2.new(1, 0, 0, 126);
			Parent = mainframe:Get()
		})

		utility:Create("UIListLayout",{
			Name = utility:RandomString(math.random(0,1000));
			FillDirection = "Horizontal";
			HorizontalAlignment = "Left";
			Padding = UDim.new(0, 8);
			SortOrder = "LayoutOrder";
			VerticalAlignment = "Top";
			Parent = containermain:Get();
		})

		local containersecondary = utility:Create("Frame",{
			Name = utility:RandomString(math.random(0,1000));
			BackgroundColor3 = theme.inline;
			BackgroundTransparency = 1;
			BorderColor3 = theme.outline;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 0, 0, 136);
			Size = UDim2.new(1, 0, 0, 46);
			Parent = mainframe:Get()
		})

		-- The color pickers 
		do

			local maincolorpickerframe = utility:Create("Frame",{
				Name = utility:RandomString(math.random(0,1000));
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 0;
				BorderColor3 = theme.outline;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 0, 0, 0);
				Size = UDim2.new(0, 126, 0, 126);
				Parent = containermain:Get()
			})

			utility:Create("UIStroke",{
				Name = utility:RandomString(math.random(0,1000));
				Parent = maincolorpickerframe:Get();
			})

			local gradientframe1, uigradient1 = utility:CreateGradientFrame(maincolorpickerframe:Get(), 0, ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
			}, 0, 0, 0)

			local gradientframe2, uigradient2 = utility:CreateGradientFrame(maincolorpickerframe:Get(), 270, ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
			}, NumberSequence.new{
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1)
			}, 0, 0, 0)



			function colorpicker:CreatePicker(parent)
				-- Create the main picker frame
				local pickerframe = utility:Create("Frame", {
					Name = utility:RandomString(math.random(0, 1000)),
					BackgroundColor3 = theme.lightcontrast,
					BackgroundTransparency = 1,
					BorderColor3 = theme.outline,
					BorderSizePixel = 0,
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 0, 5),
					Parent = parent
				})

				-- Function to create labels inside the picker
				local function createLabel(text, position)
					return utility:Create("TextLabel", {
						Name = utility:RandomString(math.random(0, 1000)),
						AnchorPoint = Vector2.new(0.5, 0.5),
						TextStrokeTransparency = 0,
						ZIndex = 2,
						BorderSizePixel = 0,
						TextXAlignment = Enum.TextXAlignment.Center,
						FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),
						TextSize = 8,
						TextColor3 = theme.textcolor,
						BackgroundColor3 = theme.darkcontrast,
						BackgroundTransparency = 1,
						BorderColor3 = theme.outline,
						Text = text,
						Size = UDim2.new(0, 13, 0, 13),
						Position = position,
						Parent = pickerframe:Get()
					})
				end

				-- Create "<" and ">" labels
				createLabel(">", UDim2.new(0, 0, 0, 0))
				createLabel("<", UDim2.new(1, 0, 0, 0))

				return pickerframe
			end

			-- Rainbow picker on the side

			local rainbowcolorpickerframe, uigradient3 = utility:CreateGradientFrame(containermain:Get(), 90, ColorSequence.new
				{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(0.166, Color3.fromRGB(255, 255, 0)),ColorSequenceKeypoint.new(0.330, Color3.fromRGB(0, 255, 0)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(0, 255, 255)),ColorSequenceKeypoint.new(0.660, Color3.fromRGB(0, 0, 255)),ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 0, 0))},
				0,UDim2.new(0, 26, 0, 126), UDim2.new(0, 0, 0, 0)
			)

			utility:Create("UIStroke",{
				Name = utility:RandomString(math.random(0,1000));
				Parent = rainbowcolorpickerframe:Get();
			})

			local picker1 = colorpicker:CreatePicker(rainbowcolorpickerframe:Get())

			-- Transparency picker on the side aswell

			local transparencypickerframe, uigradient4 = utility:CreateGradientImage(containermain:Get(), "rbxassetid://120342797917581", 90, ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))},NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)}, UDim2.new(0, 26, 0, 126), 0)

			utility:Create("UIStroke",{
				Name = utility:RandomString(math.random(0,1000));
				Parent = transparencypickerframe:Get();
			})

			local picker2 = colorpicker:CreatePicker(transparencypickerframe:Get())

			--

		end

		function colorpicker:AddTextBox(callback)

			local textboxframe = utility:Create("Frame",{
				Name = utility:RandomString(math.random(0,1000));
				BackgroundColor3 = theme.inline;
				BackgroundTransparency = 0;
				BorderColor3 = theme.outline;
				BorderSizePixel = 1;
				Position = UDim2.new(0, 0, 0, 0);
				Size = UDim2.new(1, 0, 0, 20);
				Parent = containersecondary:Get()
			})

			local framegradient, gradient = utility:CreateGradientFrame(textboxframe:Get(), 90,
				ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(18, 18, 18)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(14, 14, 14))},
				0, UDim2.new(1, -2, 1, -2), UDim2.new(0, 1, 0, 1)
			)

			local textbox = utility:Create("TextBox",{
				Name = utility:RandomString(math.random(0,1000));
				Active = true;
				BorderSizePixel = 0;
				BackgroundTransparency = 0;
				TextXAlignment = Enum.TextXAlignment.Center;
				FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				TextSize = theme.textsize;
				TextColor3 = theme.textcolor;
				PlaceholderColor3 = theme.textdark;
				BackgroundColor3 = theme.darkcontrast;
				BorderColor3 = theme.outline;
				Size = UDim2.new(1, -2, 1, -2);
				Position = UDim2.new(0, 1, 0, 1);
				Visible = true;
				ZIndex = 2;
				TextStrokeTransparency = 0;
				Parent = textboxframe:Get();
				ClearTextOnFocus = false;
				Text = "";
				PlaceholderText = "#ffffff";
			})

			utility:Connection(textbox:Get().InputBegan,function(Input)



			end)

		end

		function colorpicker:AddButton(position, size, text, callback)

			local button = utility:Create("Frame",{
				Name = utility:RandomString(math.random(0,1000));
				Active = true;
				BorderSizePixel = 1;
				BackgroundTransparency = 0;
				BackgroundColor3 = theme.inline;
				BorderColor3	= theme.outline;
				Size = size;
				Selectable = true;
				Position = position;
				Visible = true;
				Parent = containersecondary:Get()
			})

			local frame = utility:Create("Frame",{
				Name = utility:RandomString(math.random(0,1000));
				Active = true;
				BorderSizePixel = 0;
				BackgroundTransparency = 0;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BorderColor3	= theme.outline;
				Size = UDim2.new(1, -2, 1, -2);
				Selectable = true;
				Position = UDim2.new(0, 1, 0, 1);
				Visible = true;
				Parent = button:Get()
			})

			local uigradient = utility:Create("UIGradient",{
				Name = utility:RandomString(math.random(0,1000));
				Rotation = 90;
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(17, 17, 17)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(13, 13, 13))};
				Parent = frame:Get();
			})

			local textbutton = utility:Create("TextLabel",{
				Name = utility:RandomString(math.random(0,1000));
				TextStrokeTransparency = 0;
				ZIndex = 2;
				BorderSizePixel = 0;
				TextXAlignment = Enum.TextXAlignment.Center;
				FontFace = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				TextSize = theme.textsize;
				TextColor3 = theme.textdark;
				BackgroundColor3 = theme.darkcontrast;
				BackgroundTransparency = 1;
				BorderColor3 = theme.outline;
				Text = text;
				Size = UDim2.new(1, -2, 1 , -2);
				Position = UDim2.new(0, 1, 0, 1);
				Parent = frame:Get()
			})


			utility:Connection(textbutton:Get().InputBegan,function(Input)

				if Input.UserInputType == Enum.UserInputType.MouseMovement and utility:IsMouseOver(textbutton:Get()) then --and self.active then
					utility:TweenObject(textbutton:Get(), {TextColor3 = utility:AdjustColor(theme.accent, 1)}, 0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				end

				if Input.UserInputType == Enum.UserInputType.MouseButton1 and utility:IsMouseOver(textbutton:Get()) then --and self.active then
					uigradient:Get().Enabled = false
					frame:Get().BackgroundColor3 = theme.inline;
					utility:TweenObject(button:Get(), {BackgroundColor3 = utility:AdjustColor(theme.accent, 0.6)}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					utility:TweenObject(textbutton:Get(), {TextColor3 = utility:AdjustColor(theme.accent, 0.8)}, 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					utility:TweenObject(frame:Get(), {BackgroundColor3 = utility:AdjustColor(theme.accent, 0.6)}, 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					callback()
					wait(0.1)
					utility:TweenObject(frame:Get(), {BackgroundColor3 = theme.inline}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					utility:TweenObject(button:Get(), {BackgroundColor3 = theme.inline}, 0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					utility:TweenObject(frame:Get(), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.01, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					uigradient:Get().Enabled = true
				end
			end)

			utility:Connection(textbutton:Get().InputEnded,function(Input)

				if Input.UserInputType == Enum.UserInputType.MouseMovement and not utility:IsMouseOver(textbutton:Get()) then --and self.active then
					utility:TweenObject(textbutton:Get(), {TextColor3 = theme.textdark}, 0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				end
			end)


		end

		colorpicker:AddTextBox(function()
			print("test")
		end)

		colorpicker:AddButton(UDim2.new(0, 0, 0, 28), UDim2.new(0.5, -4, 0, 20), "Copy", function()
		end)
		
		colorpicker:AddButton(UDim2.new(0.5, 4, 0, 28), UDim2.new(0.5, -4, 0, 20), "Paste", function()
			print("pasted")
		end)

		utility:Connection(outline:Get().InputBegan,function(Input)


			if Input.UserInputType == Enum.UserInputType.MouseMovement and utility:IsMouseOver(outline:Get()) and self.active and self.isVisible then

			end

			if Input.UserInputType == Enum.UserInputType.MouseButton1 and utility:IsMouseOver(outline:Get()) and self.active and self.isVisible then
				colorpicker.Opened = true
				colorpickerframe:Get().Visible = true

				while colorpicker.Opened do
					
					task.wait()
					
					local x, y = outline:GetAbsolutePosition()
					local x1, y1 = outline:GetAbsoluteSize()
					colorpickerframe:Get().Position = UDim2.new(0, x+x1/2, 0, y+y1+68)

				end
				
			end

		end)

		utility:Connection(UserInputService.InputBegan,function(Input)

			if Input.UserInputType == Enum.UserInputType.MouseButton1 and not utility:IsMouseOver(outline:Get()) and not utility:IsMouseOver(colorpickerframe:Get()) and self.active and self.isVisible then

				colorpicker.Opened = false

				colorpickerframe:Properties({Visible = false;})

			end

		end)

		return setmetatable(colorpicker, addons)

	end

end

local main = library:New()

local Settings = main:NewTab({
	Text = "Settings"
})

local Settings2 = main:NewTab({
	Text = "Settings2"
})

local frame1 = Settings:NewFrame({
	Name  = 'Configurations';
	SizeY = 250;
	Type  = 1;
	Side  = 1;  -- idk like 1 2 3 ??
})

local button = frame1:NewButton({
	Text = "Test";
	CallBack = function() 
		print("test")
	end;
})

local toggle = frame1:NewToggle({
	Text = "Test";
	Type  = 'Default'; -- Default/Keybind/Colorpicker/Colorpicker_2/Both
	CallBack = function() 
		print("test")
	end;
}):AddColorPicker()

local toggle1 = frame1:NewToggle({
	Text = "Test";
	Type  = 'Default'; -- Default/Keybind/Colorpicker/Colorpicker_2/Both
	CallBack = function() 
		print("test")
	end;
})

local toggle2 = frame1:NewToggle({
	Text = "Test";
	Type  = 'Default'; -- Default/Keybind/Colorpicker/Colorpicker_2/Both
	CallBack = function() 
		print("test")
	end;
})


return library, utility, tab, frame
