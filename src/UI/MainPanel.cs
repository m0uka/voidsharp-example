using VoidSharp;
using VoidSharp.Enums;
using VoidSharp.Derma;
using VoidSharp.Networking;
using VoidSharpTest.Models;

/*
[[
    VoidSharpTestAutoRefreshFunc()
]]
*/

namespace VoidSharpTest.UI
{
    public class MainPanel : Frame
    {
        public MainPanel()
        {
            Title = "VoidSharp TEST";

            TextEntry textEntry = Add("DTextEntry").Cast<TextEntry>();
            textEntry.Dock(DockType.Top);
            textEntry.DockMargin(50, 50, 50, 10);
            textEntry.Height = 40;

            textEntry.UpdateOnType = true;
            
            textEntry.OnValueChange((self, str) =>
            {
                Title = str;
            });

            ColorMixer mixer = Add("DColorMixer").Cast<ColorMixer>();
            mixer.Dock(DockType.Top);
            mixer.DockMargin(50, 10, 50, 10);
            mixer.Height = 150;

            Button button = Add("DButton").Cast<Button>();
            button.Dock(DockType.Top);
            button.DockMargin(100, 20, 100, 40);
            button.Height = 40;
            button.Text = "Click me!!";

            button.DoClick(() =>
            {
                button.Text = "Data sent to server!";
                
                SendDataToServer(textEntry.Value, mixer.Color);
            });
        }

        void SendDataToServer(string name, Color color)
        {
            var data = new ServerNetworkData
            {
                Color = color,
                Name = name
            };
            
            RPC.Send<ServerNetworkData>("SendDataToServer", data);
        }
    }
}