-- Generated by CSharp.lua Compiler
local System = System
System.namespace("VoidSharp", function (namespace)
  namespace.class("Globals", function (namespace)
    local getGame, getEnts, getPlayers, getHook, getUtil, getSurface, getVGUI, getDarkRP, 
    getConCommand, getTeam, getVoidLib, ConsoleLog, AddConCommand, Error
    getGame = function ()
      return _G.game
    end
    getEnts = function ()
      return _G.ents
    end
    getPlayers = function ()
      return _G.player
    end
    getHook = function ()
      return _G.hook
    end
    getUtil = function ()
      return _G.util
    end
    getSurface = function ()
      return _G.surface
    end
    getVGUI = function ()
      return _G.vgui
    end
    getDarkRP = function ()
      return _G.DarkRP
    end
    getConCommand = function ()
      return _G.concommand
    end
    getTeam = function ()
      return _G.team
    end
    getVoidLib = function ()
      return _G.VoidLib
    end
    ConsoleLog = function (args)
      MsgC(unpack(args))
    end
    AddConCommand = function (name, callback, autoComplete, helpText, flags)
      getConCommand():Add(name, callback, autoComplete, helpText, flags)
    end
    Error = function (err)
      _G:error(err)
    end
    return {
      getGame = getGame,
      getEnts = getEnts,
      getPlayers = getPlayers,
      getHook = getHook,
      getUtil = getUtil,
      getSurface = getSurface,
      getVGUI = getVGUI,
      getDarkRP = getDarkRP,
      getConCommand = getConCommand,
      getTeam = getTeam,
      getVoidLib = getVoidLib,
      ConsoleLog = ConsoleLog,
      AddConCommand = AddConCommand,
      Error = Error,
      __metadata__ = function (out)
        return {
          fields = {
            { "G", 0xE, System.Object }
          },
          properties = {
            { "ConCommand", 0x20E, System.Object, getConCommand },
            { "DarkRP", 0x20E, System.Object, getDarkRP },
            { "Ents", 0x20E, System.Object, getEnts },
            { "Game", 0x20E, System.Object, getGame },
            { "Hook", 0x20E, System.Object, getHook },
            { "Players", 0x20E, System.Object, getPlayers },
            { "Surface", 0x20E, System.Object, getSurface },
            { "Team", 0x20E, System.Object, getTeam },
            { "Util", 0x20E, System.Object, getUtil },
            { "VGUI", 0x20E, System.Object, getVGUI },
            { "VoidLib", 0x20E, System.Object, getVoidLib }
          },
          methods = {
            { "AddConCommand", 0x50E, AddConCommand, System.String, System.Delegate(out.VoidSharp.Player, System.String, System.Array(System.String), System.String, System.Void), System.Delegate(System.String, System.String, System.Void), System.String, System.Int32 },
            { "ConsoleLog", 0x10E, ConsoleLog, System.Array(System.Object) },
            { "Error", 0x10E, Error, System.String }
          },
          class = { 0xE }
        }
      end
    }
  end)
end)
