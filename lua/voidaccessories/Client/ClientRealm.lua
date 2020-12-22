-- Generated by CSharp.lua Compiler
VoidAccessoriesAutoRefreshFunc()
local System = System
local VoidAccessoriesHandlers
local VoidAccessoriesNetworking
local VoidAccessoriesUtilities
System.import(function (out)
  VoidAccessoriesHandlers = VoidAccessories.Handlers
  VoidAccessoriesNetworking = VoidAccessories.Networking
  VoidAccessoriesUtilities = VoidAccessories.Utilities
end)
System.namespace("VoidAccessories.Client", function (namespace)
  namespace.class("ClientRealm", function (namespace)
    local Main
    Main = function (this)
      return System.async(function (async, this)
        VoidAccessoriesUtilities.Logger.LogInfo("Clientside loaded!")

        VoidAccessoriesHandlers.HookHandler.InitializeHooks(this)
        VoidAccessoriesHandlers.ConCommandHandler.InitializeConCommands(this)
        VoidAccessoriesNetworking.RPC.RegisterInstance(this)
      end, nil, this)
    end
    return {
      Main = Main,
      __metadata__ = function (out)
        return {
          methods = {
            { "Main", 0x86, Main, System.Task }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)