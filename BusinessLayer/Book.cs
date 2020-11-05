using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementSytem.BusinessLayer
{
    public class Book
    {
        [Required]
        public int BookId { get; set; }
        [Required]
        public string Title { get; set; }
        [Required]
        public int PublisherId { get; set; }

        public string Author { get; set; }

        [ForeignKey("PublisherId")]
        public virtual Publisher Publisher { get; set; }

    }
}
