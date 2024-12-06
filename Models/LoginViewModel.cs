using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CMCS_PROG_.Models
{
    public class LoginViewModel
    {
        [Required]
        [EmailAddress]
        public string EmailAddress { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
