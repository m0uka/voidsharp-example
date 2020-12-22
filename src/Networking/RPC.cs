﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using VoidSharp;
// ReSharper disable InconsistentNaming

namespace VoidAccessories.Networking
{
    // ReSharper disable once InconsistentNaming
    public static class RPC
    {
        private static bool ShouldReadAsSingle(Type type)
        {
            var isClass = type.IsClass;
            var hasASerializer = SerializerMap.Serializers.TryGetValue(type, out _);

            return !isClass || hasASerializer;
        }
        
        public static void RegisterInstance(object instance)
        {
            var methods = RPCAttribute.GetAllRPCAttributes(instance.GetType());
            foreach (var method in methods)
            {
                var attribute = (RPCAttribute) method.GetCustomAttributes(typeof(RPCAttribute), false).SingleOrDefault();

                if (attribute == null)
                {
                    continue;
                }

                var paramInfos = method.GetParameters();
                var attrTypes = paramInfos.Select(x => x.ParameterType).ToList();

                if (Realm.IsServer())
                {
                    attrTypes.RemoveAt(0); // Remove the player parameter
                    
                    Net.Receive("voidaccessories_" + method.Name, (i, player) =>
                    {
                        var serializer = new DataSerializer();
                        
                        var reader = new NetworkReader();
                        List<object> objData = new List<object> {player};
                        foreach (var attrType in attrTypes)
                        {
                            var isClass = !ShouldReadAsSingle(attrType);
                            objData.Add(isClass ? serializer.Read(attrType) : serializer.ReadSingle(reader, attrType));
                        }
                        
                        method.Invoke(instance, objData.ToArray());
                    });
                }
                else
                {
                    Net.Receive("voidaccessories_" + method.Name, (i) =>
                    {
                        var serializer = new DataSerializer();

                        var reader = new NetworkReader();
                        List<object> objData = new List<object>();
                        foreach (var attrType in attrTypes)
                        {
                            var isClass = !ShouldReadAsSingle(attrType);
                            objData.Add(isClass ? serializer.Read(attrType) : serializer.ReadSingle(reader, attrType));
                        }

                        method.Invoke(instance, objData.ToArray());
                    });
                }
            }
        }

        public static void AddNetworkString(string name)
        {
            Net.AddNetworkString("voidaccessories_" + name);
        }
        
        private static void WriteData<TClass>(TClass T) where TClass : class, new()
        {
            var serializer = new DataSerializer();
            serializer.Write(T);
        }

        
        /// <summary>
        /// @CSharpLua.Template = "System.getClassFromObj({0})"
        /// </summary>
        private static object ClassFromObj(object obj)
        {
            throw new NotImplementedException();
        }

        private static void WriteSingle(NetworkWriter writer, object obj)
        {
            var serializer = new DataSerializer();
            Type type = obj.GetType();

            if (obj is string)
            {
                type = typeof(string);
            }

            if (obj is int)
            {
                type = typeof(int);
            }
            
            serializer.WriteSingle(writer, type, obj);
        }
        
        
        
        /// <summary>
        /// This sends a RPC to all players or if called clientside sends to the server.
        /// </summary>
        public static void Send<TClass>(string methodName, TClass T) where TClass : class, new()
        {
            Net.Start("voidaccessories_" + methodName);
            WriteData(T);
            if (Realm.IsClient())
            {
                Net.SendToServer();
            }
            else
            {
                Net.Broadcast();
            }
        }
        
        /// <summary>
        /// Sends a RPC with the passed objects to everyone/server.
        /// </summary>
        public static void Send(string methodName, params object[] objs)
        {
            Net.Start("voidaccessories_" + methodName);

            var writer = new NetworkWriter();
            
            foreach (var obj in objs)
            {
                WriteSingle(writer, obj);
            }
            
            if (Realm.IsClient())
            {
                Net.SendToServer();
            }
            else
            {
                Net.Broadcast();
            }
        }
        
        /// <summary>
        /// Sends a RPC to a specified target with passed objects.
        /// </summary>
        public static void Send(Player target, string methodName, params object[] objs)
        {
            Net.Start("voidaccessories_" + methodName);

            var writer = new NetworkWriter();
            
            foreach (var obj in objs)
            {
                WriteSingle(writer, obj);
            }
            
            Net.Send(target);
        }
        
        public static void Send(Player[] targets, string methodName, params object[] objs)
        {
            Net.Start("voidaccessories_" + methodName);

            var writer = new NetworkWriter();
            
            foreach (var obj in objs)
            {
                WriteSingle(writer, obj);
            }
            
            Net.Send(targets);
        }
        
        /// <summary>
        /// This sends a RPC to a specific player.
        /// </summary>
        public static void Send<TClass>(Player target, string methodName, TClass T) where TClass : class, new()
        {
            if (Realm.IsClient())
            {
                throw new Exception("Trying to call serverside operation from clientside!!");
            }
            
            Net.Start("voidaccessories_" + methodName);
            WriteData(T);
            Net.Send(target);
        }
        
        /// <summary>
        /// This sends a RPC to specific players.
        /// </summary>
        public static void Send<TClass>(Player[] targets, string methodName, TClass T) where TClass : class, new()
        {
            if (Realm.IsClient())
            {
                throw new Exception("Trying to call serverside operation from clientside!!");
            }
            
            Net.Start("voidaccessories_" + methodName);
            WriteData(T);
            Net.Send(targets);
        }
    }
}