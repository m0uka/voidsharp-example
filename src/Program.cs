using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using VoidSharp.Handlers;
using VoidSharp.Networking;
using VoidSharp;
using VoidSharpTest.Models;
using VoidSharp.ORM;
using VoidSharp.ORM.Attributes;
using VoidSharp.DarkRP;
using VoidSharpTest.Client;
using VoidSharpTest.Server;
using VoidSharpTest.Utilities;

/*
[[
    VoidSharpTestAutoRefreshFunc()
]] 
*/

namespace VoidSharpTest
{
    class Program
    {
        private static Program Instance { get; set; }
        
        public static void Main(string[] args)
        {
            Instance = new Program();
            Instance.Main().ContinueWith(x =>
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
            Logger.LogInfo("VoidSharp Test Script Loaded!");
            HookHandler.InitializeHooks(this);
            DataSerializer.RegisterSerializers();

            await LoadRealms();
        }

        private async Task LoadRealms()
        {
            if (Realm.IsServer())
            {
                ServerRealm serverRealm = new ServerRealm();
                await serverRealm.Main();
            } 
            else if (Realm.IsClient())
            {
                ClientRealm clientRealm = new ClientRealm();
                await clientRealm.Main();
            }
        }

        /// <summary>
        /// Handles the autorefresh.
        /// </summary>
        public static void HandleAutoRefresh()
        {
            Logger.LogInfo("Handling autorefresh!", "Autorefresh");

            Instance.LoadRealms().ContinueWith(x =>
            {
                if (x.IsFaulted)
                {
                    HandleException(x.Exception);
                }
            });
        }

        /// <summary>
        /// Gets called after a player dies.
        /// </summary>
        [Hook("PlayerDeath")]
        public void OnPlayerDeath(dynamic gVictim, dynamic gInflictor, dynamic gAttacker)
        {
            // The hook gets called with gmod entities, we need to make them VoidSharp entities
            Player victim = (Player) new Entity(gVictim);

            Logger.LogInfo($"Player {victim.Nick} was killed!");
        }

    }
}
