using VoidAccessories.Localization;

namespace VoidAccessories.Configuration
{
    public static class Config
    {
        public static string Language
        {
            get => Language;
            set
            {
                Lang.CurrentLanguage = value;
                Language = value;
            }
        }

        // This is a static constructor. Initialize all default values here.
        static Config()
        {
            Language = "English";
        }
    }
}