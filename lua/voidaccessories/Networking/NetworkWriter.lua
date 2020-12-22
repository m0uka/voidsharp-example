-- Generated by CSharp.lua Compiler
local System = System
System.namespace("VoidAccessories.Networking", function (namespace)
  namespace.class("NetworkWriter", function (namespace)
    local WriteString, WriteInt, WriteUInt, WriteBool, WriteDouble, WriteFloat, WriteEntity, WriteVector, 
    WriteColor, Send, Send1, Broadcast, SendToServer
    -- <summary>
    -- </summary>
    WriteString = function (this, str)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- </summary>
    WriteInt = function (this, num, bitCount)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- </summary>
    WriteUInt = function (this, num, bitCount)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- </summary>
    WriteBool = function (this, boolean)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- </summary>
    WriteDouble = function (this, num)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- </summary>
    WriteFloat = function (this, num)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- </summary>
    WriteEntity = function (this, entity)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- </summary>
    WriteVector = function (this, vector)
      System.throw(System.NotImplementedException())
    end
    WriteColor = function (this, color)
      local gmodColor = color:ToGmodColor()
      net.WriteColor(gmodColor)
    end
    -- <summary>
    -- </summary>
    Send = function (this, player)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- </summary>
    Send1 = function (this, players)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- </summary>
    Broadcast = function (this)
      System.throw(System.NotImplementedException())
    end
    -- <summary>
    -- CLIENTSIDE ONLY
    -- </summary>
    SendToServer = function (this)
      System.throw(System.NotImplementedException())
    end
    return {
      WriteString = WriteString,
      WriteInt = WriteInt,
      WriteUInt = WriteUInt,
      WriteBool = WriteBool,
      WriteDouble = WriteDouble,
      WriteFloat = WriteFloat,
      WriteEntity = WriteEntity,
      WriteVector = WriteVector,
      WriteColor = WriteColor,
      Send = Send,
      Send1 = Send1,
      Broadcast = Broadcast,
      SendToServer = SendToServer,
      __metadata__ = function (out)
        return {
          methods = {
            { "Broadcast", 0x6, Broadcast },
            { "Send", 0x106, Send, out.VoidSharp.Player },
            { "Send", 0x106, Send1, System.Array(out.VoidSharp.Player) },
            { "SendToServer", 0x6, SendToServer },
            { "WriteBool", 0x106, WriteBool, System.Boolean },
            { "WriteColor", 0x106, WriteColor, out.VoidSharp.Color },
            { "WriteDouble", 0x106, WriteDouble, System.Double },
            { "WriteEntity", 0x106, WriteEntity, out.VoidSharp.Entity },
            { "WriteFloat", 0x106, WriteFloat, System.Single },
            { "WriteInt", 0x206, WriteInt, System.Int32, System.Int32 },
            { "WriteString", 0x106, WriteString, System.String },
            { "WriteUInt", 0x206, WriteUInt, System.Int32, System.Int32 },
            { "WriteVector", 0x106, WriteVector, out.Vector }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
