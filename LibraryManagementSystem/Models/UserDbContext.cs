using Microsoft.EntityFrameworkCore;

namespace User_JWT_Authorization.Models
{
    public partial class UserDbContext: DbContext
    {
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Id).HasName("PK__Users__3214EC27866087FE");

                entity.Property(e => e.Id).HasColumnName("ID");
                entity.Property(e => e.CreatedAt).HasColumnType("datetime");
                entity.Property(e => e.DateOfBirth).HasColumnType("date");
                entity.Property(e => e.EmailId)
                    .HasMaxLength(75)
                    .HasColumnName("EmailID");
                entity.Property(e => e.FirstName).HasMaxLength(75);
                entity.Property(e => e.Gender).HasMaxLength(50);
                entity.Property(e => e.LastName).HasMaxLength(75);
                entity.Property(e => e.UpdatedAt).HasColumnType("datetime");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) 
            => optionsBuilder.UseSqlServer("Server=localhost\\SQLEXPRESS;Database=User_JWT_Authorization;Trusted_Connection=True;TrustServerCertificate=True");
       

    }
}
