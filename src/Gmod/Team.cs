﻿
using System;
using System.Collections.Generic;

namespace VoidSharp
{
    public class Team
    {
        /// <summary>
        /// The teamIndex (TEAM number) of the team.
        /// </summary>
        public int Index { get; }

        /// <summary>
        /// The team name.
        /// </summary>
        public string Name => GetName(Index);
        
        /// <summary>
        /// The team color.
        /// </summary>
        public Color Color => GetColor(Index);
        
        /// <summary>
        /// The classname of the team.
        /// </summary>
        public string Class => GetClass(Index);
        
        /// <summary>
        /// List of players inside the team.
        /// </summary>
        public Player[] Players => GetPlayers(Index);
        
        /// <summary>
        /// Spawnpoint of the team.
        /// </summary>
        public Vector SpawnPoint => GetSpawnPoint(Index);
        
        /// <summary>
        /// Multiple spawnpoints of the team.
        /// </summary>
        public Vector[] SpawnPoints => GetSpawnPoints(Index);
        
        /// <summary>
        /// Number of players in the team.
        /// </summary>
        public int PlayerCount => NumPlayers(Index);

        public Team(int index)
        {
            Index = index;
        }

        /// <summary>
        /// @CSharpLua.Template = "team.GetName({0})"
        /// </summary>
        private static string GetName(int teamIndex)
        {
            throw new NotImplementedException();
        }

        public static List<Team> GetAllTeams()
        {
            List<Team> returnVal = new List<Team>();
            /*
            [[
                local teams = team.GetAllTeams()
                for k, v in ipairs(teams) do
                    returnVal:Add(VoidSharp.Team(k))
                end
                
            ]]
            */

            return returnVal;
        }

        /// <summary>
        /// @CSharpLua.Template = "team.NumPlayers({0})"
        /// </summary>
        private static int NumPlayers(int teamIndex)
        {
            throw new NotImplementedException();
        }
        
        /// <summary>
        /// @CSharpLua.Template = "team.GetSpawnPoint({0})"
        /// </summary>
        private static Vector GetSpawnPoint(int teamIndex)
        {
            throw new NotImplementedException();
        }
        
        /// <summary>
        /// @CSharpLua.Template = "team.GetSpawnPoints({0})"
        /// </summary>
        private static Vector[] GetSpawnPoints(int teamIndex)
        {
            throw new NotImplementedException();
        }
        
        /// <summary>
        /// @CSharpLua.Template = "team.GetClass({0})"
        /// </summary>
        private static string GetClass(int teamIndex)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// @CSharpLua.Template = "team.GetPlayers({0})"
        /// </summary>
        private static Player[] GetPlayers(int teamIndex)
        {
            throw new NotImplementedException();
        }

        private static Color GetColor(int teamIndex)
        {
            int r = 0;
            int g = 0;
            int b = 0;
            int a = 0;
            /*
            [[
                local col = team.GetColor(teamIndex)
                r = col.r
                g = col.g
                b = col.b
                a = col.a
            ]]
            */
            
            return new Color(r,g,b,a);
        }
    }
}