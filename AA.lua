local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

----------WAIT FOR THE GAME TO LOAD----------
repeat  task.wait() until game:IsLoaded()
if game.PlaceId == 8304191830 then
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("collection"):FindFirstChild("grid"):FindFirstChild("List"):FindFirstChild("Outer"):FindFirstChild("UnitFrames")
    repeat task.wait() until game.ReplicatedStorage.packages:FindFirstChild("assets")
    repeat task.wait() until game.ReplicatedStorage.packages:FindFirstChild("StarterGui")
else
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
    repeat task.wait() until game:GetService("Workspace")["_waves_started"].Value == true
end
----------GUI SETTINGS AND COLLORS----------
local X = Material.Load({
    Title = "CodeAC Hub | Anime Adventures",
    Style = 3,
    SizeX = 300,
    SizeY = 350,
    Theme = "Light",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(0,0,0),
        Toggle = Color3.fromRGB(124,37,255),
        ToggleAccent = Color3.fromRGB(255,255,255),
        Slider = Color3.fromRGB(124,37,255),
		SliderAccent = Color3.fromRGB(255,255,255),
        NavBarAccent = Color3.fromRGB(0,0,0),
        Content = Color3.fromRGB(0,0,0),
    }
})

----------Save Work on Folder----------
local a = 'V2_Anime_Adventures_AutoAbility' -- 
local b = game:GetService('Players').LocalPlayer.Name .. '_AnimeAdventures2.json' 
Settings = {}
function saveSettings()
    local HttpService = game:GetService('HttpService')
    if not isfolder(a) then
        makefolder(a)
    end
    writefile(a .. '/' .. b, HttpService:JSONEncode(Settings))
    Settings = ReadSetting()
    warn("Settings Saved!")
end
function ReadSetting()
    local s, e = pcall(function()
        local HttpService = game:GetService('HttpService')
        if not isfolder(a) then
            makefolder(a)
        end
        return HttpService:JSONDecode(readfile(a .. '/' .. b))
    end)
    if s then
        return e
    else
        saveSettings()
        return ReadSetting()
    end
end
Settings = ReadSetting()

----------AUTO LOAD FUNCTION----------
function autoload2()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CodersAC/Script/main/AA.lua'))()
end

----------MAIN FRAME----------
local Y = X.New({
    Title = "Main Menu"
})
local Z = X.New({
    Title = "Misc"
})
----------AUTO ABILITIES----------
Y.Toggle({
    Text = "Auto Abilities Erwin",
    Callback = function(Value)
	pcall(function()
	print(Settings.EnableBufferwinLoop)
        Settings.EnableBufferwinLoop = Value
        saveSettings()
        autoabilityerwin()end)
    end,
    Enabled = Settings.EnableBufferwinLoop
})

Y.Toggle({
    Text = "Auto Abilities Wendy",
    Callback = function(Value)
	pcall(function()
	print(Settings.EnableBuffwendyLoop)
        Settings.EnableBuffwendyLoop = Value
        saveSettings()
        autoabilitywendy()end)
    end,
    Enabled = Settings.EnableBuffwendyLoop
})
----------REFRESH SCRIPT----------
Z.Button(
    {
        Text = "Refresh Script",
        Callback = function()
            autoload2()
        end
    }
)
Z.Button(
    {
        Text = "EnableBufferwinLoop" ,
        Callback = function()
	print(Settings.EnableBufferwinLoop)
        end
    }
)
Z.Button(
    {
        Text = "EnableBuffwendyLoop",
        Callback = function()
	print(Settings.EnableBuffwendyLoop)
        end
    }
)
function autoabilityerwin()
	if Settings.EnableBufferwinLoop then
        local LocalPlayer = game.Players.LocalPlayer
        local LPlayer = game.Players.LocalPlayer.Name
        local UnitsE = {'erwin','erwin:shiny','erwin_school','erwin_halloween'}
        local Delay = {
            ['erwin'] = 15.6,
            ['erwin:shiny'] = 15.6,
            ['erwin_school'] = 15.6,
            ['erwin_halloween'] = 15.6,
        }
        while Settings.EnableBufferwinLoop do
          local erwin1 = {}
          for _,v in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
              if table.find(UnitsE,v.Name) and v:FindFirstChild("_stats"):FindFirstChild("player").Value == LocalPlayer then
                  table.insert(erwin1, v)
              end
          end
          if #erwin1 < 4 then
            print("Waiting")
            wait(20)
          end
          if #erwin1 == 4 then
            game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("use_active_attack"):InvokeServer(erwin1[1])
            warn("Use Skill " ..erwin1[1].Name .." 1 " )
            wait(Delay[erwin1[1].Name])
            game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("use_active_attack"):InvokeServer(erwin1[3])
            warn("Use Skill " ..erwin1[1].Name .." 2 " )
            wait(Delay[erwin1[1].Name])
            game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("use_active_attack"):InvokeServer(erwin1[2])
            warn("Use Skill " ..erwin1[1].Name .." 3 " )
            wait(Delay[erwin1[1].Name])
            game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("use_active_attack"):InvokeServer(erwin1[4])
            warn("Use Skill " ..erwin1[1].Name .." 4 " )
            wait(Delay[erwin1[1].Name])
          end
	  if not Settings.EnableBufferwinLoop then 
          	break
	  end
        end
    end
end

if Settings.EnableBufferwinLoop then
    autoabilityerwin()
end

function autoabilitywendy()
	if Settings.EnableBuffwendyLoop then
        local LocalPlayer = game.Players.LocalPlayer
        local LPlayer = game.Players.LocalPlayer.Name
        local UnitsW = {'wendy','wendy:shiny'}
        local Delay = {
            ['wendy'] = 15.6,
            ['wendy:shiny'] = 15.6,
        }
        while Settings.EnableBuffwendyLoop do
            local wendy1 = {}
            for _,v in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
                if table.find(UnitsW,v.Name) and v:FindFirstChild("_stats"):FindFirstChild("player").Value == LocalPlayer then
                    table.insert(wendy1, v)
                end
            end
            if #wendy1 < 4 then
                print("Waiting")
                wait(20)
              end
            if #wendy1 == 4 then
                game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("use_active_attack"):InvokeServer(wendy1[1])
                warn("Use Skill " ..wendy1[1].Name .." 1 " )
                wait(Delay[wendy1[1].Name])
                game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("use_active_attack"):InvokeServer(wendy1[3])
                warn("Use Skill " ..wendy1[1].Name .." 2 " )
                wait(Delay[wendy1[1].Name])
                game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("use_active_attack"):InvokeServer(wendy1[2])
                warn("Use Skill " ..wendy1[1].Name .." 3 " )
                wait(Delay[wendy1[1].Name])
                game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("use_active_attack"):InvokeServer(wendy1[4])
                warn("Use Skill " ..wendy1[1].Name .." 4 " )
                wait(Delay[wendy1[1].Name])
            end
	    if not Settings.EnableBuffwendyLoop then 
             break
	  end
        end
    end
end

if Settings.EnableBuffwendyLoop then
    autoabilitywendy()
end

game.Players.LocalPlayer.PlayerGui.MessageGui:Destroy()
