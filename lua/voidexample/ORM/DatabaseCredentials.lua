-- Generated by CSharp.lua Compiler
-- Resharper is crying because it is being accessed from Lua state, and obviously Rider doesn't know that
-- ReSharper disable UnusedAutoPropertyAccessor.Global
-- ReSharper disable MemberCanBePrivate.Global
local System = System
System.namespace("VoidSharpExample.ORM", function (namespace)
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
      local obj = util.JSONToTable(json)
      return class(obj.host, obj.username, obj.password, obj.database, obj.port)
    end
    class = {
      Port = 0,
      ParseFromJSON = ParseFromJSON,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
