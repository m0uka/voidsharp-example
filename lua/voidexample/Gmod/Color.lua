-- Generated by CSharp.lua Compiler
local System = System
System.namespace("VoidSharp", function (namespace)
  namespace.class("Color", function (namespace)
    local ToString, FromGmodColor, ToGmodColor, class, __ctor__
    __ctor__ = function (this, r, g, b, a)
      this.R = r
      this.G = g
      this.B = b
      this.A = a
    end
    ToString = function (this)
      return "Color(" .. this.R .. ", " .. this.G .. ", " .. this.B .. ", " .. this.A .. ")"
    end
    FromGmodColor = function (col)
      return class(col.r, col.g, col.b, col.a)
    end
    ToGmodColor = function (this)
      local obj = nil
      obj = Color(this.R, this.G, this.B, this.A)
      return obj
    end
    class = {
      R = 0,
      G = 0,
      B = 0,
      A = 0,
      ToString = ToString,
      FromGmodColor = FromGmodColor,
      ToGmodColor = ToGmodColor,
      __ctor__ = __ctor__
    }
    return class
  end)
end)