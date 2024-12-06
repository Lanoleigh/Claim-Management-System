using CMCS_PROG_.Data;

namespace CMCS_PROG_.Models
{
    public class LecturerClaimViewModel
    {
        public Lecturer Lecturer { get; set; }
        public List<Lecturer> Lecturers = new List<Lecturer>();
        public List<Claim> Claims { get; set; }
        public Claim Claim { get; set; }

        private readonly ApplicationDbContext context;
        public LecturerClaimViewModel() { }
        public LecturerClaimViewModel(ApplicationDbContext context)
        {
            this.context = context;
            Lecturers = GetLecturers();
        }
        public List<Lecturer> GetLecturers()
        {
            Lecturers = context.Lecturer.ToList();
            return Lecturers;
        }
    }
}
