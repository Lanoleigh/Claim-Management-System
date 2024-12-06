using CMCS_PROG_.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
namespace CMCS_PROG_.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }
        public DbSet<Lecturer> Lecturer { get; set; }
        public DbSet<Staff> Staff { get; set; }
        public DbSet<Claim> Claim { get; set; } 

        protected override void OnModelCreating(ModelBuilder mBuilder)
        {
            base.OnModelCreating(mBuilder);

            mBuilder.Entity<ApplicationUser>()
                .HasKey(u => u.Id);

            mBuilder.Entity<ApplicationUser>().ToTable("AspNetUsers");
            mBuilder.Entity<Lecturer>().ToTable("Lecturers");
            mBuilder.Entity<Staff>().ToTable("Staff");
            mBuilder.Entity<Claim>().ToTable("Claims");

            mBuilder.Entity<Claim>()
            .HasKey(c => c.Claim_ID);
            mBuilder.Entity<Claim>()
                .Ignore(c => c.SupportingDocs);
            mBuilder.Entity<Lecturer>()
                .Ignore(l => l.PhoneNumber);
            //mBuilder.Entity<Lecturer>()
            //    .Property(l => l.phone_number_custom)
                
        }
    }
}
