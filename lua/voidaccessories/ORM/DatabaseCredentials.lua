-- Generated by CSharp.lua Compiler
-- Resharper is crying because it is being accessed from Lua state, and obviously Rider doesn't know that
-- ReSharper disable UnusedAutoPropertyAccessor.Global
-- ReSharper disable MemberCanBePrivate.Global
local System = System
local VoidSharp
System.import(function (out)
  VoidSharp = out.VoidSharp
end)
System.namespace("VoidAccessories.ORM", function (namespace)
  namespace.struct("DatabaseCredentials", function (namespace)
    local ParseFromJSON, class, __ctor__
    __ctor__ = function (this, host, username, password, database, port)
      if port == nil then
        return
      end
      this.Host = host
      this.Username = username
      this.Password = password
      this.Database = database
      this.Port = port
    end
    ParseFromJSON = function (json)
      local obj = VoidSharp.JSON.Parse(json)
      return class(obj.host, obj.username, obj.password, obj.database, obj.port)
    end
    class = {
      Port = 0,
      ParseFromJSON = ParseFromJSON,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "Database", 0x6, System.String },
            { "Host", 0x6, System.String },
            { "Password", 0x6, System.String },
            { "Port", 0x6, System.Int32 },
            { "Username", 0x6, System.String }
          },
          methods = {
            { ".ctor", 0x506, __ctor__, System.String, System.String, System.String, System.String, System.Int32 },
            { "ParseFromJSON", 0x18E, ParseFromJSON, System.String, class }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)
end)
