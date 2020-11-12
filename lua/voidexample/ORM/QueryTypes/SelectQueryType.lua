-- Generated by CSharp.lua Compiler
local System = System
local ListString = System.List(System.String)
local VoidSharpExampleORM
local Attributes
local Specifiers
local ListWhereSpecifier
System.import(function (out)
  VoidSharpExampleORM = VoidSharpExample.ORM
  Attributes = VoidSharpExample.ORM.Attributes
  Specifiers = VoidSharpExample.ORM.Specifiers
  ListWhereSpecifier = System.List(Specifiers.WhereSpecifier)
end)
System.namespace("VoidSharpExample.ORM.QueryTypes", function (namespace)
  namespace.class("SelectQueryType_1", function (namespace)
    return function (T)
      local Select, Select1, Where, Where1, GenerateQuery, First, getSingle, ToList, 
      __ctor__
      __ctor__ = function (this, database)
        System.base(this).__ctor__(this, database)
        this.WhereSpecifiers = ListWhereSpecifier()
        this.Selects = ListString()
      end
      Select = function (this, column)
        this.Selects:Add(column)
        return this
      end
      Select1 = function (this, columns)
        for _, column in System.each(columns) do
          Select(this, column)
        end

        return this
      end
      Where = function (this, a, comparator, b)
        local specifier = Specifiers.WhereSpecifier(a, comparator, b)
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
        local tableName = Attributes.TableAttribute.GetAttributeTable(type)

        local stringBuilder = System.StringBuilder("SELECT")
        if #this.Selects > 0 then
          stringBuilder:Append(" ")
          stringBuilder:Append(System.String.JoinEnumerable(", ", this.Selects))
        else
          stringBuilder:Append(" *")
        end
        stringBuilder:Append(" FROM ")
        stringBuilder:Append(tableName)

        if #this.WhereSpecifiers > 0 then
          stringBuilder:Append(" WHERE ")

          local wheres = ListString()
          for _, specifier in System.each(this.WhereSpecifiers) do
            local propertyInfo = type:GetProperty(specifier:getKey())
            if propertyInfo == nil then
              System.throw(System.Exception("Tried to select a non-existing column!"))
            end

            local default, serializer = VoidSharpExampleORM.SerializerMap.Serializers:TryGetValue(propertyInfo:getPropertyType())
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
      First = function (this)
        return System.async(function (async, this)
          local query = GenerateQuery(this, System.typeof(T))
          local dbResult = async:await(this.Database:Query(query, T))
          local list = dbResult:ToList()
          local default
          if #list > 0 then
            default = list:get(0)
          else
            default = System.default(T)
          end
          return default
        end, nil, this)
      end
      getSingle = function (this)
        return First(this)
      end
      ToList = function (this)
        return System.async(function (async, this)
          local query = GenerateQuery(this, System.typeof(T))
          local dbResult = async:await(this.Database:Query(query, T))
          return dbResult:ToList()
        end, nil, this)
      end
      return {
        base = function (out)
          return {
            out.VoidSharpExample.ORM.QueryTypes.QueryType
          }
        end,
        Select = Select,
        Select1 = Select1,
        Where = Where,
        Where1 = Where1,
        GenerateQuery = GenerateQuery,
        First = First,
        getSingle = getSingle,
        ToList = ToList,
        __ctor__ = __ctor__
      }
    end
  end)
end)
