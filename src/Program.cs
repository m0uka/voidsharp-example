using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using VoidAccessories.Client;
using VoidAccessories.Handlers;
using VoidAccessories.Localization;
using VoidAccessories.Networking;
using VoidAccessories.Server;
using VoidAccessories.Utilities;
using VoidAccessories.Extensions;
using VoidAccessories.Migrations;
using VoidSharp;
using VoidAccessories.Models;
using VoidAccessories.ORM;
using VoidAccessories.ORM.Attributes;
using VoidSharp.DarkRP;

/*
[[
    VoidAccessoriesAutoRefreshFunc()
]] 
*/

namespace VoidAccessories
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
            Logger.LogInfo("VoidAccessories Loaded!");
            HookHandler.InitializeHooks(this);
            DataSerializer.RegisterSerializers();
            
            if (Globals.VoidLib != null)
            {
                OnVoidLibLoad();
            }

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
        /// Gets called after VoidLib is loaded.
        /// </summary>
        [Hook("VoidLib.Loaded")]
        public void OnVoidLibLoad()
        {
            Logger.LogInfo("VoidLib successfully loaded!");

            if (Realm.IsServer())
            {
                VoidLib.RegisterAddon("VoidAccessories", 0, "{{ DEV_LICENSE }}");
            }
        }

        /// <summary>
        /// Gets called after the VoidAccessories languages are loaded.
        /// </summary>
        [Hook("VoidAccessories.Lang.LanguagesLoaded")]
        public void OnLanguagesLoaded()
        {
            Lang.LoadLanguages("VoidAccessories");
            Logger.LogInfo($"Loaded {Lang.Languages.Count} languages!", "Languages");
        }

    }
}
