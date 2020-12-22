-- Generated by CSharp.lua Compiler
return function (path, loaderF)
  return System.init({
    path = path,
    files = {
      "Client.ClientRealm",
      "Configuration.Config",
      "Configuration.ConfigManager",
      "CustomSerializers.AccessoryModelBlacklistSerializer",
      "CustomSerializers.AccessorySlotsSerializer",
      "CustomSerializers.ItemPricesSerializer",
      "Extensions.StringExtensions",
      "Gmod.Color",
      "Gmod.DarkRP.DarkRP",
      "Gmod.DarkRP.Job",
      "Gmod.Entities",
      "Gmod.Entity",
      "Gmod.File",
      "Gmod.Game",
      "Gmod.Globals",
      "Gmod.Hook",
      "Gmod.JSON",
      "Gmod.Net",
      "Gmod.Panel",
      "Gmod.Player",
      "Gmod.Players",
      "Gmod.Realm",
      "Gmod.SQL",
      "Gmod.Surface",
      "Gmod.Team",
      "Gmod.Vector",
      "Gmod.VGUI",
      "Gmod.VoidLib",
      "Gmod.VoidUI.Frame",
      "Gmod.VoidUI.Sidebar",
      "Gmod.VoidUI.Tabs",
      "Handlers.ConCommandAttribute",
      "Handlers.ConCommandHandler",
      "Handlers.HookAttribute",
      "Handlers.HookHandler",
      "Localization.Lang",
      "Localization.LanguageDict",
      "Localization.PhraseManager",
      "Models.AccessoryItem",
      "Models.ConfigEntry",
      "Models.EquippedAccessory",
      "Models.InventoryItem",
      "Models.MigrationVersion",
      "Models.VoidAccessory",
      "Networking.DataSerializer",
      "Networking.INetworkSerializer",
      "Networking.NetworkReader",
      "Networking.NetworkWriter",
      "Networking.RPC",
      "Networking.RPCAttribute",
      "Networking.SerializerMap",
      "Networking.Serializers.BoolSerializer",
      "Networking.Serializers.ColorSerializer",
      "Networking.Serializers.DateTimeSerializer",
      "Networking.Serializers.IntegerSerializer",
      "Networking.Serializers.JobSerializer",
      "Networking.Serializers.StringSerializer",
      "Networking.Serializers.UIntegerSerializer",
      "Objects.AccessoryModelBlacklist",
      "Objects.AccessorySlots",
      "Objects.ItemPrices",
      "ORM.Attributes.AutoIncrementAttribute",
      "ORM.Attributes.ColumnLengthAttribute",
      "ORM.Attributes.PrimaryKeyAttribute",
      "ORM.Attributes.TableAttribute",
      "ORM.Database",
      "ORM.DatabaseConnectionResult",
      "ORM.DatabaseCredentials",
      "ORM.DatabaseMapper",
      "ORM.DatabaseResult",
      "ORM.Migrations.Migration",
      "ORM.Migrations.MigrationManager",
      "ORM.ObjectMapper",
      "ORM.QueryTypes.AlterQueryType",
      "ORM.QueryTypes.CreateQueryType",
      "ORM.QueryTypes.DeleteQueryType",
      "ORM.QueryTypes.DropQueryType",
      "ORM.QueryTypes.InsertQueryType",
      "ORM.QueryTypes.QueryType",
      "ORM.QueryTypes.SelectQueryType",
      "ORM.QueryTypes.UpdateQueryType",
      "ORM.SerializerBase",
      "ORM.SerializerMap",
      "ORM.Serializers.BoolSerializer",
      "ORM.Serializers.ColorSerializer",
      "ORM.Serializers.DateTimeSerializer",
      "ORM.Serializers.DynamicSerializer",
      "ORM.Serializers.IntegerSerializer",
      "ORM.Serializers.JobSerializer",
      "ORM.Serializers.StringSerializer",
      "ORM.Specifiers.AlterSpecifier",
      "ORM.Specifiers.InsertSpecifier",
      "ORM.Specifiers.WhereSpecifier",
      "Program",
      "Server.ServerRealm",
      "Utilities.Logger"
    },
    types = {
      "VoidAccessories.ORM.ISerializerBase",
      "VoidAccessories.Networking.INetworkSerializer",
      "VoidAccessories.ORM.QueryTypes.QueryType",
      "VoidSharp.Entity",
      "VoidSharp.Panel",
      "VoidAccessories.Client.ClientRealm",
      "VoidAccessories.Configuration.Config",
      "VoidAccessories.Configuration.ConfigManager",
      "VoidAccessories.CustomSerializers.AccessoryModelBlacklistSerializer",
      "VoidAccessories.CustomSerializers.AccessorySlotsSerializer",
      "VoidAccessories.CustomSerializers.ItemPricesSerializer",
      "VoidAccessories.Extensions.StringExtensions",
      "VoidAccessories.Handlers.ConCommandAttribute",
      "VoidAccessories.Handlers.ConCommandHandler",
      "VoidAccessories.Handlers.HookAttribute",
      "VoidAccessories.Handlers.HookHandler",
      "VoidAccessories.Localization.Lang",
      "VoidAccessories.Localization.LanguageDict",
      "VoidAccessories.Localization.PhraseManager",
      "VoidAccessories.Migrations.Migration",
      "VoidAccessories.Migrations.MigrationManager",
      "VoidAccessories.Models.AccessoryItem",
      "VoidAccessories.Models.ConfigEntry",
      "VoidAccessories.Models.EquippedAccessory",
      "VoidAccessories.Models.InventoryItem",
      "VoidAccessories.Models.MigrationVersion",
      "VoidAccessories.Models.VoidAccessory",
      "VoidAccessories.Networking.DataSerializer",
      "VoidAccessories.Networking.NetworkReader",
      "VoidAccessories.Networking.NetworkWriter",
      "VoidAccessories.Networking.RPC",
      "VoidAccessories.Networking.RPCAttribute",
      "VoidAccessories.Networking.SerializerMap",
      "VoidAccessories.Networking.Serializers.BoolSerializer",
      "VoidAccessories.Networking.Serializers.ColorSerializer",
      "VoidAccessories.Networking.Serializers.DateTimeSerializer",
      "VoidAccessories.Networking.Serializers.IntegerSerializer",
      "VoidAccessories.Networking.Serializers.JobSerializer",
      "VoidAccessories.Networking.Serializers.StringSerializer",
      "VoidAccessories.Networking.Serializers.UIntegerSerializer",
      "VoidAccessories.Objects.AccessoryModelBlacklist",
      "VoidAccessories.Objects.AccessorySlots",
      "VoidAccessories.Objects.ItemPrices",
      "VoidAccessories.ORM.Attributes.AutoIncrementAttribute",
      "VoidAccessories.ORM.Attributes.ColumnLengthAttribute",
      "VoidAccessories.ORM.Attributes.PrimaryKeyAttribute",
      "VoidAccessories.ORM.Attributes.TableAttribute",
      "VoidAccessories.ORM.Database",
      "VoidAccessories.ORM.DatabaseConnectionResult",
      "VoidAccessories.ORM.DatabaseCredentials",
      "VoidAccessories.ORM.DatabaseMapper_1",
      "VoidAccessories.ORM.DatabaseResult_1",
      "VoidAccessories.ORM.ObjectMapper",
      "VoidAccessories.ORM.QueryTypes.AlterQueryType_1",
      "VoidAccessories.ORM.QueryTypes.CreateQueryType",
      "VoidAccessories.ORM.QueryTypes.DeleteQueryType_1",
      "VoidAccessories.ORM.QueryTypes.DropQueryType_1",
      "VoidAccessories.ORM.QueryTypes.InsertQueryType_1",
      "VoidAccessories.ORM.QueryTypes.SelectQueryType_1",
      "VoidAccessories.ORM.QueryTypes.UpdateQueryType_1",
      "VoidAccessories.ORM.SerializerMap",
      "VoidAccessories.ORM.Serializers.BoolSerializer",
      "VoidAccessories.ORM.Serializers.ColorSerializer",
      "VoidAccessories.ORM.Serializers.DateTimeSerializer",
      "VoidAccessories.ORM.Serializers.DynamicSerializer",
      "VoidAccessories.ORM.Serializers.IntegerSerializer",
      "VoidAccessories.ORM.Serializers.JobSerializer",
      "VoidAccessories.ORM.Serializers.StringSerializer",
      "VoidAccessories.ORM.Specifiers.AlterSpecifier",
      "VoidAccessories.ORM.Specifiers.InsertSpecifier",
      "VoidAccessories.ORM.Specifiers.WhereSpecifier",
      "VoidAccessories.Program",
      "VoidAccessories.Server.ServerRealm",
      "VoidAccessories.Utilities.Logger",
      "VoidSharp.Color",
      "VoidSharp.DarkRP.DarkRP",
      "VoidSharp.DarkRP.Job",
      "VoidSharp.Entities",
      "VoidSharp.Game",
      "VoidSharp.Globals",
      "VoidSharp.Hook",
      "VoidSharp.JSON",
      "VoidSharp.Net",
      "VoidSharp.Player",
      "VoidSharp.Players",
      "VoidSharp.Realm",
      "VoidSharp.Surface",
      "VoidSharp.Team",
      "VoidSharp.VGUI",
      "VoidSharp.VoidLib",
      "VoidSharp.VoidUI.Frame",
      "VoidSharp.VoidUI.Sidebar",
      "VoidSharp.VoidUI.Tabs"
    },
    loaderF = loaderF,
    Main = "VoidAccessories.Program.Main"
  })
end
