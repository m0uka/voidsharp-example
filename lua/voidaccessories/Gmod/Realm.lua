-- Generated by CSharp.lua Compiler
local System = System
local VoidSharp
System.import(function (out)
  VoidSharp = out.VoidSharp
end)
System.namespace("VoidSharp", function (namespace)
  namespace.class("Realm", function (namespace)
    local IsServer, IsClient
    -- <summary>
    -- Returns if its a server
    -- </summary>
    IsServer = function ()
      return VoidSharp.Globals.G.SERVER
    end
    -- <summary>
    -- Returns if its a client
    -- </summary>
    IsClient = function ()
      return VoidSharp.Globals.G.CLIENT
    end
    return {
      IsServer = IsServer,
      IsClient = IsClient,
      __metadata__ = function (out)
        return {
          methods = {
            { "IsClient", 0x8E, IsClient, System.Boolean },
            { "IsServer", 0x8E, IsServer, System.Boolean }
          },
          class = { 0xE }
        }
      end
    }
  end)
end)
