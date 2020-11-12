-- Generated by CSharp.lua Compiler
local System = System
local VoidSharp
local VoidSharpExampleHandlers
local VoidSharpExampleModels
local VoidSharpExampleORM
local VoidSharpExampleUtilities
System.import(function (out)
  VoidSharp = out.VoidSharp
  VoidSharpExampleHandlers = VoidSharpExample.Handlers
  VoidSharpExampleModels = VoidSharpExample.Models
  VoidSharpExampleORM = VoidSharpExample.ORM
  VoidSharpExampleUtilities = VoidSharpExample.Utilities
end)
System.namespace("VoidSharpExample.Server", function (namespace)
  namespace.class("ServerRealm", function (namespace)
    local Main, TestingConcommand, PlayerInitialSpawn
    Main = function (this)
      return System.async(function (async, this)
        VoidSharpExampleHandlers.HookHandler.InitializeHooks(this)

        -- Use SQLite for the database connection
        local database = VoidSharpExampleORM.Database(VoidSharp.SQLite())
        async:await(database:Connect())

        this.Database = database
      end, nil, this)
    end
    TestingConcommand = function (this, ply, cmd, args, argStr)
      System.Console.WriteLine("This is a testing console command! Yay")
    end
    PlayerInitialSpawn = function (this, ply)
      System.Task.Run(function ()
        return System.async(function (async)
          local character = async:await(this.Database:Select(VoidSharpExampleModels.Character):Where("SteamId", "=", ply:SteamID64()):getSingle())

          if character ~= nil then
            VoidSharpExampleUtilities.Logger.LogInfo("Hello " .. character.Name .. ", you just connected! Your favorite color is: " .. System.toString(character.FavoriteColor))
          else
            VoidSharpExampleUtilities.Logger.LogInfo(ply:Nick() .. " doesn't have a character :( Creating one for him!")

            local default = VoidSharpExampleModels.Character()
            default.SteamId = ply:SteamID64()
            default.Name = ply:Nick() .. "'s character"
            default.FavoriteColor = VoidSharp.Color(255, 255, 255, 255)
            default.Time = System.DateTime.getNow()
            local newCharacter = default

            async:await(this.Database:Insert(newCharacter, VoidSharpExampleModels.Character):Execute())

            VoidSharpExampleUtilities.Logger.LogInfo("Now " .. ply:Nick() .. " has a character with the name " .. newCharacter.Name .. "!")
          end
        end, nil)
      end)
    end
    return {
      Main = Main,
      TestingConcommand = TestingConcommand,
      PlayerInitialSpawn = PlayerInitialSpawn,
      __metadata__ = function (out)
        return {
          methods = {
            { "PlayerInitialSpawn", 0x106, PlayerInitialSpawn, out.VoidSharp.Player, out.VoidSharpExample.Handlers.HookAttribute("PlayerInitialSpawn", nil) },
            { "TestingConcommand", 0x406, TestingConcommand, out.VoidSharp.Player, System.String, System.Array(System.String), System.String, out.VoidSharpExample.Handlers.ConCommandAttribute("testing_concommand") }
          }
        }
      end
    }
  end)
end)
