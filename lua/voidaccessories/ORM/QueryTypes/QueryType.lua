-- Generated by CSharp.lua Compiler
local System = System
System.namespace("VoidAccessories.ORM.QueryTypes", function (namespace)
  namespace.class("QueryType", function (namespace)
    local __ctor__
    __ctor__ = function (this, database)
      this.Database = database
    end
    return {
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "Database", 0x3, out.VoidAccessories.ORM.Database }
          },
          methods = {
            { ".ctor", 0x103, nil, out.VoidAccessories.ORM.Database }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)