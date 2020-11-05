using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementSytem.BusinessLayer
{
    public class IssueBook
    {
        [Key]
        [Required]
        public int IssueId { get; set; }
        [Required]
        [Display(Name = "Select Book")]
        public int BookId { get; set; }
        [Required]
        [Display(Name = "Select Student")]
        public int StudentId { get; set; }

        [ForeignKey("BookId")]
        public virtual Book Books { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime IssueDate { get; set; }

        [ForeignKey("StudentId")]
        public virtual Student Students { get; set; }
    }
}
