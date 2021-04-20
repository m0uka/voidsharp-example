-- Generated by CSharp.lua Compiler
local System = System
System.namespace("VoidSharpTest.Models", function (namespace)
  namespace.class("InventoryItem", function (namespace)
    local __ctor__
    __ctor__ = function (this)
      this.CreatedAt = System.default(System.DateTime)
    end
    return {
      Id = 0,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "CreatedAt", 0x6, System.DateTime },
            { "Id", 0x6, System.Int32, out.VoidSharp.ORM.Attributes.PrimaryKeyAttribute(), out.VoidSharp.ORM.Attributes.AutoIncrementAttribute() },
            { "PlayerColor", 0x6, out.VoidSharp.Color },
            { "PlayerName", 0x6, System.String },
            { "SteamId64", 0x6, System.String }
          },
          class = { 0x6, out.VoidSharp.ORM.Attributes.TableAttribute("voidsharptest_inventories") }
        }
      end
    }
  end)
end)