using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementSytem.BusinessLayer
{
    public class Student
    {
        [Required]
        public int StudentId { get; set; }
        [Required]
        public string Name { get; set; }
       
        public string Address { get; set; }
        [Required]
        public string RollNo { get; set; }
        [Required]
        public string Class { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime DOB { get; set; }

       
    }
}
