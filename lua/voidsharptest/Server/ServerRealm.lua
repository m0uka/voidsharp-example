-- Generated by CSharp.lua Compiler
VoidSharpTestAutoRefreshFunc()
local System = System
local VoidSharp = VoidSharp
local VoidSharpHandlers = VoidSharp.Handlers
local VoidSharpNetworking = VoidSharp.Networking
local VoidSharpORM = VoidSharp.ORM
local VoidSharpTest
local VoidSharpTestModels
local VoidSharpTestUtilities
System.import(function (out)
  VoidSharpTest = out.VoidSharpTest
  VoidSharpTestModels = VoidSharpTest.Models
  VoidSharpTestUtilities = VoidSharpTest.Utilities
end)
System.namespace("VoidSharpTest.Server", function (namespace)
  namespace.class("ServerRealm", function (namespace)
    local Main, SendUsefulData, SendDataToServer, DatabaseTasks
    Main = function (this)
      return System.async(function (async, this)
        async:await(DatabaseTasks(this))

        VoidSharpHandlers.ConCommandHandler.InitializeConCommands(this)
        VoidSharpNetworking.RPC.RegisterInstance(this)

        VoidSharpNetworking.RPC.AddNetworkString("SendUsefulData")
        VoidSharpNetworking.RPC.AddNetworkString("SendDataToServer")
      end, nil, this)
    end
    SendUsefulData = function (this, ply, s, args, argStr)
      for _, player in System.each(VoidSharp.Players.GetAll()) do
        local default = VoidSharpTestModels.InventoryItem()
        default.CreatedAt = System.DateTime.getNow()
        default.PlayerName = "SMG"
        default.SteamId64 = player:getSteamId64()
        local data = default

        VoidSharpNetworking.RPC.SendToClient(player, "SendUsefulData", data, VoidSharpTestModels.InventoryItem)
        VoidSharpTestUtilities.Logger.LogInfo("Sent some useful data to " .. player:getNick())
      end
    end
    SendDataToServer = function (this, player, networkData)
      VoidSharpTestUtilities.Logger.LogInfo("Received a RPC from " .. player:getNick() .. "!")
      VoidSharpTestUtilities.Logger.LogInfo("Received a name " .. networkData.Name .. " and a color " .. System.toString(networkData.Color) .. "!")

      if System.String.IsNullOrWhiteSpace(networkData.Name) then
        VoidSharpTestUtilities.Logger.LogError(player:getNick() .. " sent data with no name!")
        return
      end

      local default = VoidSharpTestModels.InventoryItem()
      default.PlayerColor = networkData.Color
      default.PlayerName = networkData.Name
      default.CreatedAt = System.DateTime.getNow()
      default.SteamId64 = player:getSteamId64()
      local item = default

      this.Database:Insert(item, VoidSharpTestModels.InventoryItem):Execute()
    end
    DatabaseTasks = function (this)
      return System.async(function (async, this)
        this.Database = VoidSharpORM.Database(VoidSharp.SQLite())
        async:await(this.Database:Connect(System.typeof(VoidSharpTest.Program)))

        -- // Handle migrations
        -- MigrationManager migrationManager = new MigrationManager();
        -- await migrationManager.UpdateMigrations(Database);
      end, nil, this)
    end
    return {
      Main = Main,
      SendUsefulData = SendUsefulData,
      SendDataToServer = SendDataToServer,
      __metadata__ = function (out)
        return {
          properties = {
            { "Database", 0x1, out.VoidSharp.ORM.Database }
          },
          methods = {
            { "DatabaseTasks", 0x81, DatabaseTasks, System.Task },
            { "Main", 0x86, Main, System.Task },
            { "SendDataToServer", 0x206, SendDataToServer, out.VoidSharp.Player, out.VoidSharpTest.Models.ServerNetworkData, out.VoidSharp.Networking.RPCAttribute() },
            { "SendUsefulData", 0x406, SendUsefulData, out.VoidSharp.Player, System.String, System.Array(System.String), System.String, out.VoidSharp.Handlers.ConCommandAttribute("sendusefuldata") }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
