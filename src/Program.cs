using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using VoidSharp;
using VoidSharpExample.Models;
using VoidSharpExample.ORM;
using VoidSharpExample.ORM.Attributes;
using VoidSharpExample.Client;
using VoidSharpExample.Handlers;
using VoidSharpExample.Server;
using VoidSharpExample.Utilities;

namespace VoidSharpExample
{
    class Program
    {
        public static void Main(string[] args)
        {
            new Program().Main().ContinueWith(x =>
            {
                if (x.IsFaulted)
                {
                    HandleException(x.Exception);
                }
                
            });
        }

        /// <summary>
        /// Handles an exception in async threads - it's needed because we are calling an async method from a non-async method.
        /// </summary>
        /// <param name="e"></param>
        private static void HandleException(Exception e)
        {
            string exceptionTrace = e.Message + "\n" + e.StackTrace + "\n";
            Logger.LogError(exceptionTrace);
        }
        
        
        private async Task Main()
        {
            Logger.LogInfo("C# Example Loaded!");
            HookHandler.InitializeHooks(this);
            
            if (Realm.IsClient())
            {
                ClientRealm clientRealm = new ClientRealm();
                await clientRealm.Main();
            } else if (Realm.IsServer())
            {
                ServerRealm serverRealm = new ServerRealm();
                await serverRealm.Main();
            }
        }

        

        /// <summary>
        /// Gets called after all the addons are loaded.
        /// </summary>
        [Hook("Initialize")]
        public void OnInitialize()
        {
            Logger.LogInfo("Successfully initialized!");
        }
        

    }
}
