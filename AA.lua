local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local X = Material.Load({
    Title = "Keybrew Hub | Anime Adventures",
    Style = 3,
    SizeX = 300,
    SizeY = 350,
    Theme = "Light",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(0,0,0),
        Toggle = Color3.fromRGB(124,37,255),
        ToggleAccent = Color3.fromRGB(255,255,255), 
        Dropdown = Color3.fromRGB(124,37,255),
		DropdownAccent = Color3.fromRGB(255,255,255),
        Slider = Color3.fromRGB(124,37,255),
		SliderAccent = Color3.fromRGB(255,255,255),
        NavBarAccent = Color3.fromRGB(0,0,0),
        Content = Color3.fromRGB(0,0,0),
    }
})

local Y = X.New({
    Title = "Main"
})



Y.Toggle({
    Text = "Auto Abilities Erwin",
    Callback = function(Value)
        a = Value
        local LocalPlayer = game.Players.LocalPlayer
        local LPlayer = game.Players.LocalPlayer.Name
        local UnitsE = {'erwin','erwin:shiny','erwin_school','erwin_halloween'}
        local Delay = {
            ['erwin'] = 15.5,
            ['erwin:shiny'] = 15.5,
            ['erwin_school'] = 15.5,
            ['erwin_halloween'] = 15.5,
        }
        while a do task.wait()
            pcall(function()
            local erwin1 = {}
          for _,v in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
              if table.find(UnitsE,v.Name) and v:FindFirstChild("_stats"):FindFirstChild("player").Value == LocalPlayer then
                  table.insert(erwin1, v)
              end
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
        if #erwin1 < 4 then
            print("Waiting")
            wait(20)
        end
    end)
        end
    end,
    Enabled = false
})
Y.Toggle({
    Text = "Auto Abilities Wendy",
    Callback = function(Value)
        a = Value
        local LocalPlayer = game.Players.LocalPlayer
        local LPlayer = game.Players.LocalPlayer.Name
        local UnitsW = {'wendy','wendy:shiny'}
        local Delay = {
            ['wendy'] = 15.5,
            ['wendy:shiny'] = 15.5,
        }
        while a do task.wait()
        pcall(function()
          local wendy1 = {}
          for _,v in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
                if table.find(UnitsW,v.Name) and v:FindFirstChild("_stats"):FindFirstChild("player").Value == LocalPlayer then
                    table.insert(wendy1, v)
                end
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
        if #wendy1 < 4 then
            print("Waiting")
            wait(20)
        end
    end)
        end
    end,
    Enabled = false
})
game.Players.LocalPlayer.PlayerGui.MessageGui:Destroy()
