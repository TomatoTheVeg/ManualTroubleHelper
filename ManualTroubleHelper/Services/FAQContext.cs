using ManualTroubleHelper.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;

namespace ManualTroubleHelper.Services
{
    public class FAQContext:DbContext
    {
        DbSet<Problem> Questions { get; init; }
        DbSet<Solution> Solutions { get; init; }

        public FAQContext() {
            Database.Migrate();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Data Source=(localdb)\\MSSQLLocalDB;Database=FAQDatabase");
        }
    }

}
