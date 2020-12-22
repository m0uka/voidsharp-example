using System.Collections.Generic;

namespace VoidAccessories.Localization
{
    public class PhraseManager
    {
        /// <summary>
        /// Returns a translated phrase.
        /// </summary>
        /// <param name="key">The phrase ID.</param>
        public new string this[string key]
        {
            get
            {
                string currLang = Lang.CurrentLanguage ?? "english";
                LanguageDict languageDict = Lang.Languages[currLang];

                if (!languageDict.TryGetValue(key, out var phrase))
                {
                    // Try get english
                    LanguageDict englishDict = Lang.Languages["english"];
                    if (!englishDict.TryGetValue(key, out phrase))
                    {
                        phrase = "Unknown";
                    }
                }

                return phrase;
            }
        }
    }
}