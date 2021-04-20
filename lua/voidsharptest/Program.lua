-- Generated by CSharp.lua Compiler
VoidSharpTestAutoRefreshFunc()
local System = System
local VoidSharp = VoidSharp
local VoidSharpHandlers = VoidSharp.Handlers
local VoidSharpNetworking = VoidSharp.Networking
local VoidSharpTestClient
local VoidSharpTestServer
local VoidSharpTestUtilities
System.import(function (out)
  VoidSharpTestClient = VoidSharpTest.Client
  VoidSharpTestServer = VoidSharpTest.Server
  VoidSharpTestUtilities = VoidSharpTest.Utilities
end)
System.namespace("VoidSharpTest", function (namespace)
  namespace.class("Program", function (namespace)
    local Instance, Main, HandleException, Main1, LoadRealms, HandleAutoRefresh, OnPlayerDeath, class
    Main = function (args)
      Instance = class()
      Main1(Instance):ContinueWith(function (x)
        if x:getIsFaulted() then
          HandleException(x:getException())
        end
      end)
    end
    -- <summary>
    -- Handles an exception in async threads - it's needed because we are calling an async method from a non-async method.
    -- </summary>
    -- <param name="e"></param>
    HandleException = function (e)
      local exceptionTrace = e:getMessage() .. "\n" .. e:getStackTrace() .. "\n"
      VoidSharpTestUtilities.Logger.LogError(exceptionTrace)
    end
    Main1 = function (this)
      return System.async(function (async, this)
        VoidSharpTestUtilities.Logger.LogInfo("VoidSharp Test Script Loaded!")
        VoidSharpHandlers.HookHandler.InitializeHooks(this)
        VoidSharpNetworking.DataSerializer.RegisterSerializers()

        async:await(LoadRealms(this))
      end, nil, this)
    end
    LoadRealms = function (this)
      return System.async(function (async, this)
        if VoidSharp.Realm.IsServer() then
          local serverRealm = VoidSharpTestServer.ServerRealm()
          async:await(serverRealm:Main())
        elseif VoidSharp.Realm.IsClient() then
          local clientRealm = VoidSharpTestClient.ClientRealm()
          async:await(clientRealm:Main())
        end
      end, nil, this)
    end
    -- <summary>
    -- Handles the autorefresh.
    -- </summary>
    HandleAutoRefresh = function ()
      VoidSharpTestUtilities.Logger.LogInfo("Handling autorefresh!", "Autorefresh")

      LoadRealms(Instance):ContinueWith(function (x)
        if x:getIsFaulted() then
          HandleException(x:getException())
        end
      end)
    end
    -- <summary>
    -- Gets called after a player dies.
    -- </summary>
    OnPlayerDeath = function (this, gVictim, gInflictor, gAttacker)
      -- The hook gets called with gmod entities, we need to make them VoidSharp entities
      local victim = System.cast(VoidSharp.Player, VoidSharp.Entity())

      VoidSharpTestUtilities.Logger.LogInfo("Player " .. victim:getNick() .. " was killed!")
    end
    class = {
      Main = Main,
      HandleAutoRefresh = HandleAutoRefresh,
      OnPlayerDeath = OnPlayerDeath,
      __metadata__ = function (out)
        return {
          properties = {
            { "Instance", 0x9, class }
          },
          methods = {
            { "HandleAutoRefresh", 0xE, HandleAutoRefresh },
            { "HandleException", 0x109, HandleException, System.Exception },
            { "LoadRealms", 0x81, LoadRealms, System.Task },
            { "Main", 0x10E, Main, System.Array(System.String) },
            { "Main", 0x81, Main1, System.Task },
            { "OnPlayerDeath", 0x306, OnPlayerDeath, System.Object, System.Object, System.Object, out.VoidSharp.Handlers.HookAttribute("PlayerDeath", nil) }
          },
          class = { 0x4 }
        }
      end
    }
    return class
  end)
end)