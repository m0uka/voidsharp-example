using System;

namespace VoidSharp {
    /// <summary>
    /// @CSharpLua.Ignore
    /// </summary>
    public abstract class Player : Entity {
        
        /// <summary>
        /// Returns the nickname of the player.
        /// </summary>
        /// <returns>Nickname of the player.</returns>
        public string Nick() {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Returns the SteamID64 of the player.
        /// </summary>
        /// <returns>The SteamID64 of the player.</returns>
        public string SteamID64()
        {
            throw new NotImplementedException();
        }
    }

    /// <summary>
    /// @CSharpLua.Ignore
    /// </summary>
    public static class Players {
        public static Player[] GetAll() {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Gets a player by SteamID64.
        /// </summary>
        /// <param name="sid64"></param>
        /// <returns></returns>
        // ReSharper disable once InconsistentNaming
        public static Player GetBySteamID64(string sid64)
        {
            throw new NotImplementedException();
        }
    }
}