using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace CMCS_PROG_.Models
{
    [Table("AspNetUsers")]
    public class ApplicationUser : IdentityUser
    {
        public string EmailAddress { get; set; }
        public string Password { get; set; }
    }
}
