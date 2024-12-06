using Microsoft.AspNetCore.Identity;

namespace CMCS_PROG_.Models
{
    public class Staff  : IdentityUser
    {
        public string Id { get; set; }
        public string Staff_ID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string title { get; set; }
        public string? Email { get; set; }

    }
}
