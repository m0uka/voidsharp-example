-- Generated by CSharp.lua Compiler
local System = System
local VoidAccessoriesLocalization
System.import(function (out)
  VoidAccessoriesLocalization = VoidAccessories.Localization
end)
System.namespace("VoidAccessories.Extensions", function (namespace)
  namespace.class("StringExtensions", function (namespace)
    local GetPhrase
    -- <summary>
    -- Translates the language phrase ID into a phrase.
    -- </summary>
    -- <param name="str"></param>
    -- <returns>Translated string.</returns>
    GetPhrase = function (str)
      return VoidAccessoriesLocalization.Lang.Phrases:get(str)
    end
    return {
      GetPhrase = GetPhrase,
      __metadata__ = function (out)
        return {
          methods = {
            { "GetPhrase", 0x18E, GetPhrase, System.String, System.String }
          },
          class = { 0xE }
        }
      end
    }
  end)
end)