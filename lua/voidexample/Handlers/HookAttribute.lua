-- Generated by CSharp.lua Compiler
local System = System
local Linq = System.Linq.Enumerable
System.namespace("VoidSharpExample.Handlers", function (namespace)
  namespace.class("HookAttribute", function (namespace)
    local GetAllHookAttributes, class, __ctor__
    __ctor__ = function (this, hookName, hookId)
      System.base(this).__ctor__(this)
      this.HookName = hookName
      this.HookId = hookId
    end
    -- <summary>
    -- Gets all methods which have a Hook attribute.
    -- </summary>
    -- <param name="type">The type (preferably Class) to check.</param>
    -- <returns>A list of MethodInfos.</returns>
    GetAllHookAttributes = function (type)
      local methods = Linq.ToList(Linq.Where(Linq.ToList(type:GetMethods()), function (x)
        return #x:GetCustomAttributes(System.typeof(class), false) > 0
      end))

      return methods
    end
    class = {
      base = function (out)
        return {
          System.Attribute
        }
      end,
      GetAllHookAttributes = GetAllHookAttributes,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
