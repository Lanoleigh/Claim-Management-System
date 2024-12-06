using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CMCS_PROG_.Models
{
    public class Claim  
    {
        public string Claim_ID { get; set; }
        public string fk_lecturer_id { get; set; }
        public string? fk_staff_id { get; set; }
        public double Claim_Amount { get; set; }
        [Required]
        public double Hours_Worked { get; set; }
        public DateTime DateOfClaim { get; set; }
        [Required]
        public string Description { get; set; }
        [NotMapped]
        public IFormFile? SupportingDocs { get; set; }
        public string? FilePath { get; set; }
        public string Status { get; set; }
    }
}
