namespace CMCS_PROG_.Models
{
    public class StaffClaimViewModel
    {
        public Staff Staff { get; set; }    
        public List<Claim> claims { get; set; }
        public List<Lecturer> lecturers { get; set; }
    }
}
