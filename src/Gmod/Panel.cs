﻿using System;

namespace VoidSharp
{
    public class Panel
    {
        // ReSharper disable once InconsistentNaming
        protected dynamic VGUIPanel { get; }
        
        public Panel(string name)
        {
            VGUIPanel = VGUI.Create(name);
        }
        
        public void Add(Panel panel)
        {
            VGUIPanel.Add(panel);
        }

        public void SetSize(int w, int h)
        {
            VGUIPanel.SetSize(w, h);
        }
        
        public void Center()
        {
            VGUIPanel.Center();
        }

        public void MakePopup()
        {
            VGUIPanel.MakePopup();
        }
    }
}