-- Generated by CSharp.lua Compiler
local System = System
local VoidSharp
local VoidSharpExampleHandlers
System.import(function (out)
  VoidSharp = out.VoidSharp
  VoidSharpExampleHandlers = VoidSharpExample.Handlers
end)
System.namespace("VoidSharpExample.Handlers", function (namespace)
  namespace.class("HookHandler", function (namespace)
    local InitializeHooks
    -- <summary>
    -- Initializes hooks for usage in passed instance.
    -- </summary>
    -- <param name="instance">The instance of the class.</param>
    InitializeHooks = function (instance)
      local methods = VoidSharpExampleHandlers.HookAttribute.GetAllHookAttributes(instance:GetType())
      for _, method in System.each(methods) do
        local hookAttribute = System.cast(VoidSharpExampleHandlers.HookAttribute, method:GetCustomAttributes(System.typeof(VoidSharpExampleHandlers.HookAttribute), true):get(0))

        local hookName = hookAttribute.HookName
        local hookId = hookAttribute.HookId

        VoidSharp.Hook.Add(hookName, hookId or hookName .. ".Listener." .. method:getName(), function (objects)
          method:Invoke(instance, objects)
        end)
      end
    end
    return {
      InitializeHooks = InitializeHooks
    }
  end)
end)