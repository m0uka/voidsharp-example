-- Generated by CSharp.lua Compiler
local System = System
System.namespace("VoidSharp", function (namespace)
  namespace.class("Player", function (namespace)
    local getNick, getSteamId, getSteamId64, getAlive, __ctor__
    __ctor__ = function (this, className)
      System.base(this).__ctor__[2](this, className)
    end
    getNick = function (this)
      return this.GmodEntity:Nick()
    end
    getSteamId = function (this)
      return this.GmodEntity:SteamID()
    end
    getSteamId64 = function (this)
      return this.GmodEntity:SteamID64()
    end
    getAlive = function (this)
      return this.GmodEntity:Alive()
    end
    return {
      base = function (out)
        return {
          out.VoidSharp.Entity
        }
      end,
      getNick = getNick,
      getSteamId = getSteamId,
      getSteamId64 = getSteamId64,
      getAlive = getAlive,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          methods = {
            { ".ctor", 0x103, nil, System.String }
          },
          properties = {
            { "Alive", 0x206, System.Boolean, getAlive },
            { "Nick", 0x206, System.String, getNick },
            { "SteamId", 0x206, System.String, getSteamId },
            { "SteamId64", 0x206, System.String, getSteamId64 }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)