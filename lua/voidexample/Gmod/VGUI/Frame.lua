-- Generated by CSharp.lua Compiler
local System = System
System.namespace("VoidSharp.VoidUI", function (namespace)
  namespace.class("Frame", function (namespace)
    local SetTitle, __ctor__
    __ctor__ = function (this)
      System.base(this).__ctor__(this, "DFrame")
    end
    SetTitle = function (this, description)
      this.VGUIPanel:SetTitle(description)
    end
    return {
      base = function (out)
        return {
          out.VoidSharp.Panel
        }
      end,
      SetTitle = SetTitle,
      __ctor__ = __ctor__
    }
  end)
end)