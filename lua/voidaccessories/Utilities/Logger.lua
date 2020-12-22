-- Generated by CSharp.lua Compiler
local System = System
local ListObject = System.List(System.Object)
local VoidSharp
System.import(function (out)
  VoidSharp = out.VoidSharp
end)
System.namespace("VoidAccessories.Utilities", function (namespace)
  namespace.class("Logger", function (namespace)
    local CreatePrefix, LogInfo, LogError, LogDebug
    CreatePrefix = function (type, color)
      local default = ListObject()
      default:Add(VoidSharp.Color(87, 180, 242, 255):ToGmodColor())
      default:Add("[VoidAccessories] ")
      local extern
      if color ~= nil then
        extern = color:ToGmodColor()
      else
        extern = VoidSharp.Color(87, 180, 242, 255):ToGmodColor()
      end
      default:Add(extern)
      default:Add("[" .. type .. "] ")
      default:Add(VoidSharp.Color(255, 255, 255, 255):ToGmodColor())
      local args = default

      return args
    end
    -- <summary>
    -- Logs an info message to the console.
    -- </summary>
    -- <param name="message">The message.</param>
    -- <param name="customPrefix">Custom prefix, if applicable.</param>
    LogInfo = function (message, customPrefix)
      local msg = CreatePrefix("INFO")
      if customPrefix ~= nil then
        msg = CreatePrefix(customPrefix)
        msg:Add(VoidSharp.Color(87, 180, 242, 255):ToGmodColor())
        msg:Add("[INFO] ")
        msg:Add(VoidSharp.Color(255, 255, 255, 255):ToGmodColor())
      end

      msg:Add(message)
      msg:Add("\n")
      VoidSharp.Globals.ConsoleLog(msg:ToArray())
    end
    -- <summary>
    -- Logs an error message to the console.
    -- </summary>
    -- <param name="message">The error message.</param>
    LogError = function (message)
      local msg = CreatePrefix("ERROR", VoidSharp.Color(255, 0, 0, 255))
      msg:Add(VoidSharp.Color(255, 0, 0, 255):ToGmodColor())
      msg:Add(message)
      msg:Add("\n")
      VoidSharp.Globals.ConsoleLog(msg:ToArray())
    end
    -- <summary>
    -- Logs a debug message to the console. Only does something if DEBUG symbol is defined.
    -- </summary>
    -- <param name="message"></param>
    -- <param name="customPrefix"></param>
    LogDebug = function (message, customPrefix)
      local msg = CreatePrefix("DEBUG")
      if customPrefix ~= nil then
        msg = CreatePrefix(customPrefix)
        msg:Add(VoidSharp.Color(252, 186, 3, 255):ToGmodColor())
        msg:Add("[INFO] ")
        msg:Add(VoidSharp.Color(255, 255, 255, 255):ToGmodColor())
      end

      msg:Add(message)
      msg:Add("\n")
      VoidSharp.Globals.ConsoleLog(msg:ToArray())
    end
    return {
      LogInfo = LogInfo,
      LogError = LogError,
      LogDebug = LogDebug,
      __metadata__ = function (out)
        return {
          methods = {
            { "CreatePrefix", 0x289, CreatePrefix, System.String, out.VoidSharp.Color, System.List(System.Object) },
            { "LogDebug", 0x20E, LogDebug, System.Object, System.String },
            { "LogError", 0x10E, LogError, System.Object },
            { "LogInfo", 0x20E, LogInfo, System.Object, System.String }
          },
          class = { 0xE }
        }
      end
    }
  end)
end)
