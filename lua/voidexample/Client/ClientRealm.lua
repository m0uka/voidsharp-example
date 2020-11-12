-- Generated by CSharp.lua Compiler
local System = System
local VoidSharpVoidUI
local VoidSharpExampleHandlers
local VoidSharpExampleUtilities
System.import(function (out)
  VoidSharpVoidUI = VoidSharp.VoidUI
  VoidSharpExampleHandlers = VoidSharpExample.Handlers
  VoidSharpExampleUtilities = VoidSharpExample.Utilities
end)
System.namespace("VoidSharpExample.Client", function (namespace)
  namespace.class("ClientRealm", function (namespace)
    local Main, CreatePanel
    Main = function (this)
      return System.async(function (async, this)
        VoidSharpExampleUtilities.Logger.LogInfo("Clientside loaded")

        VoidSharpExampleHandlers.HookHandler.InitializeHooks(this)
        VoidSharpExampleHandlers.ConCommandHandler.InitializeConCommands(this)
      end, nil, this)
    end
    CreatePanel = function (this, ply, cmd, args, argStr)
      local panel = VoidSharpVoidUI.Frame()
      panel:SetSize(500, 500)
      panel:Center()
      panel:MakePopup()
      panel:SetTitle("Hello from my panel!")
    end
    return {
      Main = Main,
      CreatePanel = CreatePanel,
      __metadata__ = function (out)
        return {
          methods = {
            { "CreatePanel", 0x406, CreatePanel, out.VoidSharp.Player, System.String, System.Array(System.String), System.String, out.VoidSharpExample.Handlers.ConCommandAttribute("voidsharp_example") }
          }
        }
      end
    }
  end)
end)
