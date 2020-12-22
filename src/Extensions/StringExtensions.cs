using VoidAccessories.Localization;

namespace VoidAccessories.Extensions
{
    public static class StringExtensions
    {
        /// <summary>
        /// Translates the language phrase ID into a phrase.
        /// </summary>
        /// <param name="str"></param>
        /// <returns>Translated string.</returns>
        public static string GetPhrase(this string str)
        {
            return Lang.Phrases[str];
        }
    }
}