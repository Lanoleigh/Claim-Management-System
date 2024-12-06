using CMCS_PROG_.Data;
using CMCS_PROG_.Models;

namespace CMCS_PROG_.Services
{
    public class LecturerService
    {
        private readonly IServiceProvider _serviceProvider;
        public LecturerService(IServiceProvider serviceProvider) 
        {
            _serviceProvider = serviceProvider;
        }
        public List<Lecturer> GetLecturers()
        {
            List<Lecturer> lecturers = new List<Lecturer>();
            using( var scope =  _serviceProvider.CreateScope())
            {
                var context = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
                lecturers = context.Lecturer.ToList();
            }
            return lecturers;
         }
    }
}
