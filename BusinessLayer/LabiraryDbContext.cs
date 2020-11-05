using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementSytem.BusinessLayer
{
    public class LabiraryDbContext:DbContext
    {
        public LabiraryDbContext(DbContextOptions options) : base(options)
        {
        }

       public DbSet<Publisher> Publishers { get; set; }
        public DbSet<Book> Books { get; set; }

        public DbSet<Student> Students { get; set; }

        public DbSet<IssueBook> IssueBooks { get; set; }
    }
}
