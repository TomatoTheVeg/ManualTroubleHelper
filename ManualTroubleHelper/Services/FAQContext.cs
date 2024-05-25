﻿using ManualTroubleHelper.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;

namespace ManualTroubleHelper.Services
{
    public class FAQContext:DbContext
    {
        public DbSet<Problem> Problems { get; init; }
        public DbSet<Solution> Solutions { get; init; }
        public DbSet<Step> Steps { get; init; }
        public DbSet<Tag> Tags {get; init;}

        public FAQContext() {
            Database.Migrate();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
#if DEBUG
            optionsBuilder.UseSqlServer("Data Source=(localdb)\\MSSQLLocalDB;Database=FAQDatabase");
#else
            optionsBuilder.UseSqlServer("Server=tcp:localhost,1433;UID=sa;PWD=zhenyasenkoSql72;TrustServerCertificate=True");
#endif
        }
    }

}
