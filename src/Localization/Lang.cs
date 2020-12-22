using System;
using System.Collections.Generic;
using VoidSharp;

namespace VoidAccessories.Localization
{
    public static class Lang
    {
        private static string _currentLanguage;
        
        /// <summary>
        /// The currently used language for translation.
        /// </summary>
        /// <exception cref="Exception">Thrown when the language is invalid.</exception>
        public static string CurrentLanguage
        {
            get => _currentLanguage;
            set
            {
                if (!Languages.TryGetValue(value, out _))
                {
                    throw new Exception($"Language {value} does not exist!");
                }

                _currentLanguage = value;
            }
        }
        /// <summary>
        /// PhraseManager responsible for translating the phrases.
        /// </summary>
        public static PhraseManager Phrases { get; set; }
        
        /// <summary>
        /// The list of all languages and their phrases.
        /// </summary>
        public static Dictionary<string, LanguageDict> Languages { get; set; }

        /// <summary>
        /// Loads the languages for the supplied addon.
        /// </summary>
        /// <param name="addonName">The name of the addon (global table has to match)</param>
        public static void LoadLanguages(string addonName)
        {
            Languages = new Dictionary<string, LanguageDict>();
            
            /*
            [[
                local gTable = _G[addonName]
                for lang, phrases in pairs(gTable.Lang.Langs) do
                    local languageDict = VoidAccessoriesLocalization.LanguageDict()
                    for key, value in pairs(phrases) do
                        languageDict:Add(key, value)
                    end
                    
                    class.Languages:Add(lang, languageDict)
                end
            ]]
            */
            
            PhraseManager phraseManager = new PhraseManager();
            Phrases = phraseManager;
        }
    }
}