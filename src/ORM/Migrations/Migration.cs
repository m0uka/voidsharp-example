using System.Threading.Tasks;
using VoidAccessories.ORM;

namespace VoidAccessories.Migrations
{
    public abstract class Migration
    {
        public abstract int Version { get; set; }

        public abstract Task Up(Database database);
    }
}