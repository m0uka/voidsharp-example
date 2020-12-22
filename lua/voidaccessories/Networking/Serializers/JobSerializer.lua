-- Generated by CSharp.lua Compiler
local System = System
local VoidSharp
local VoidSharpDarkRP
System.import(function (out)
  VoidSharp = out.VoidSharp
  VoidSharpDarkRP = VoidSharp.DarkRP
end)
System.namespace("VoidAccessories.Networking.Serializers", function (namespace)
  namespace.class("JobSerializer", function (namespace)
    local Write, Read
    Write = function (this, writer, val)
      if val == nil then
        net.WriteUInt(0, 16)
      else
        local job = System.cast(VoidSharpDarkRP.Job, val)
        net.WriteUInt(job.Team.Index, 16)
      end
    end
    Read = function (this, reader)
      local sn = System.cast(System.Int32, net.ReadUInt(16))
      if sn == 0 then
        return nil
      end

      return VoidSharpDarkRP.Job(VoidSharp.Team(sn))
    end
    return {
      base = function (out)
        return {
          out.VoidAccessories.Networking.INetworkSerializer
        }
      end,
      Write = Write,
      Read = Read,
      __metadata__ = function (out)
        return {
          methods = {
            { "Read", 0x186, Read, out.VoidAccessories.Networking.NetworkReader, System.Object },
            { "Write", 0x206, Write, out.VoidAccessories.Networking.NetworkWriter, System.Object }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)