using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementSytem.BusinessLayer
{
    public class Publisher
    {
        [Required]
        public int PublisherId { get; set; }
        [Required]
        public string PublisherName { get; set; }

        public string Address { get; set; }
    }
}
