using System;

namespace VoidSharp
{
    public class Color
    {
        public int R { get; set; }
        public int G { get; set; }
        public int B { get; set; }
        public int A { get; set; }

        public Color(int r, int g, int b, int a = 255)
        {
            R = r;
            G = g;
            B = b;
            A = a;
        }
        
        public override string ToString()
        {
            return $"Color({R}, {G}, {B}, {A})";
        }

        public static Color FromGmodColor(dynamic col)
        {
            return new Color(col.r, col.g, col.b, col.a);
        }

        public object ToGmodColor()
        {
            object obj = null;
            /*
            [[
                obj = Color(this.R, this.G, this.B, this.A)
            ]]
            */
            return obj;
        }
    }
}
