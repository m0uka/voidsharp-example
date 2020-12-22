-- Generated by CSharp.lua Compiler
local System = System
local ListString = System.List(System.String)
local VoidAccessoriesORM
local VoidAccessoriesAttributes
local VoidAccessoriesSpecifiers
local ListWhereSpecifier
System.import(function (out)
  VoidAccessoriesORM = VoidAccessories.ORM
  VoidAccessoriesAttributes = VoidAccessories.ORM.Attributes
  VoidAccessoriesSpecifiers = VoidAccessories.ORM.Specifiers
  ListWhereSpecifier = System.List(VoidAccessoriesSpecifiers.WhereSpecifier)
end)
System.namespace("VoidAccessories.ORM.QueryTypes", function (namespace)
  namespace.class("DeleteQueryType_1", function (namespace)
    return function (T)
      local Where, Where1, GenerateQuery, Execute, class, __ctor__
      __ctor__ = function (this, database)
        System.base(this).__ctor__(this, database)
        this.WhereSpecifiers = ListWhereSpecifier()
      end
      Where = function (this, a, comparator, b)
        local specifier = VoidAccessoriesSpecifiers.WhereSpecifier(a, comparator, b)
        this.WhereSpecifiers:Add(specifier)

        return this
      end
      Where1 = function (this, type, comparator, b)
        local propertyInfo = System.typeof(T):GetProperty(type:getName())
        if propertyInfo == nil then
          System.throw(System.Exception(type:getName() .. " is not a member of " .. System.typeof(T):getName() .. "!"))
        end

        Where(this, type:getName(), comparator, b)

        return this
      end
      GenerateQuery = function (this, type)
        local tableName = VoidAccessoriesAttributes.TableAttribute.GetAttributeTable(type)

        local stringBuilder = System.StringBuilder("DELETE FROM " .. tableName)
        if #this.WhereSpecifiers > 0 then
          stringBuilder:Append(" WHERE ")
          local wheres = ListString()
          for _, specifier in System.each(this.WhereSpecifiers) do
            local propertyInfo = type:GetProperty(specifier:getKey())
            if propertyInfo == nil then
              System.throw(System.Exception("Tried to select a non-existing column!"))
            end

            local default, serializer = VoidAccessoriesORM.SerializerMap.Serializers:TryGetValue(propertyInfo:getPropertyType())
            if not default then
              System.throw(System.Exception("VoidORM can't serialize the type " .. propertyInfo:getPropertyType():getName() .. "!"))
            end

            local strValue = serializer:Serialize(specifier:getValue(), this.Database.DatabaseDriver)
            wheres:Add("`" .. specifier:getKey() .. "` " .. specifier:getComparator() .. " " .. strValue)
          end

          stringBuilder:Append(System.String.JoinEnumerable(" AND ", wheres))
        end

        stringBuilder:Append(";")
        return stringBuilder:ToString()
      end
      Execute = function (this)
        return System.async(function (async, this)
          local query = GenerateQuery(this, System.typeof(T))
          async:await(this.Database:Query(query, T))
        end, nil, this)
      end
      class = {
        base = function (out)
          return {
            out.VoidAccessories.ORM.QueryTypes.QueryType
          }
        end,
        Where = Where,
        Where1 = Where1,
        GenerateQuery = GenerateQuery,
        Execute = Execute,
        __ctor__ = __ctor__,
        __metadata__ = function (out)
          return {
            properties = {
              { "WhereSpecifiers", 0x1, System.List(out.VoidAccessories.ORM.Specifiers.WhereSpecifier) }
            },
            methods = {
              { ".ctor", 0x106, nil, out.VoidAccessories.ORM.Database },
              { "Execute", 0x86, Execute, System.Task },
              { "GenerateQuery", 0x186, GenerateQuery, System.Type, System.String },
              { "Where", 0x386, Where, System.String, System.String, System.Object, class },
              { "Where", 0x386, Where1, System.Reflection.PropertyInfo, System.String, System.Object, class }
            },
            class = { 0x106, T }
          }
        end
      }
      return class
    end
  end)
end)
