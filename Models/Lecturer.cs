using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace CMCS_PROG_.Models
{
    public class Lecturer : IdentityUser
    {
        public string Id { get; set; }
        public string Lecturer_ID { get; set; }
        public string lecturer_name { get; set; }
        public string lecturer_surname { get; set; }
        
        public string phone_number_custom { get; set; }
        public double Hourly_Rate { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
    }
}
