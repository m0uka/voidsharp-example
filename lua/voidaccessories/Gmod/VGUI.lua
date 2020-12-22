-- Generated by CSharp.lua Compiler
local System = System
local VoidSharp
System.import(function (out)
  VoidSharp = out.VoidSharp
end)
System.namespace("VoidSharp", function (namespace)
  -- ReSharper disable once InconsistentNaming
  namespace.class("VGUI", function (namespace)
    local Create, Register, CreateFromTable, GetWorldPanel
    -- <summary>
    -- Creates a panel by the specified classname.
    -- </summary>
    Create = function (className, parent, name)
      local func = VoidSharp.Globals.getVGUI().Create
      return func(className, parent, name)
    end
    -- <summary>
    -- Registers a panel for later creation.
    -- </summary>
    Register = function (className, panelTable, baseName)
      local func = VoidSharp.Globals.getVGUI().Register
      func(className, panelTable, baseName)
    end
    -- <summary>
    -- Creates a panel from table.
    -- </summary>
    CreateFromTable = function (metatable, parent, name)
      local func = VoidSharp.Globals.getVGUI().CreateFromTable
      return func(metatable, parent, name)
    end
    -- <summary>
    -- Returns the global world panel which is the parent to all others, except for the HUD panel.
    -- </summary>
    GetWorldPanel = function ()
      return VoidSharp.Globals.getVGUI():GetWorldPanel()
    end
    return {
      Create = Create,
      Register = Register,
      CreateFromTable = CreateFromTable,
      GetWorldPanel = GetWorldPanel,
      __metadata__ = function (out)
        return {
          methods = {
            { "Create", 0x38E, Create, System.String, out.VoidSharp.Panel, System.String, System.Object },
            { "CreateFromTable", 0x38E, CreateFromTable, System.Object, out.VoidSharp.Panel, System.String, System.Object },
            { "GetWorldPanel", 0x8E, GetWorldPanel, System.Object },
            { "Register", 0x30E, Register, System.String, System.Object, System.String }
          },
          class = { 0xE }
        }
      end
    }
  end)
end)
