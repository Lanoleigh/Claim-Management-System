using CMCS_PROG_.Models;
using CMCS_PROG_.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Diagnostics;

namespace CMCS_PROG_.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ClaimService _claimService;
        private readonly LecturerService _lecturerService;
        public HomeController(ILogger<HomeController> logger,ClaimService claimService, LecturerService lecturerService)
        {
            _logger = logger;
            _claimService = claimService;
            _lecturerService = lecturerService;
        }

        public IActionResult Index()
        {
            return View();
        }
       
        //Program Coordinator
        public IActionResult Admin()
        {
            try
            {
                //(Enamno, 2013)
                var programCJson = HttpContext.Session.GetString("PC_Details");
                if (!string.IsNullOrEmpty(programCJson))
                {
                    var staffObj = JsonConvert.DeserializeObject<Staff>(programCJson);
                    var viewModel = new StaffClaimViewModel
                    {
                        Staff = staffObj,
                        claims = _claimService.GettingClaims(),
                        lecturers = _lecturerService.GetLecturers()
                    };
                    return View(viewModel);
                }
            }catch(Exception e)
            {
                Console.WriteLine(e);
            }
            

            return View();
        }
        //HR
        public IActionResult HR()
        {
            try
            {
                var hrJson = HttpContext.Session.GetString("HR_Ses");
                if (!string.IsNullOrEmpty(hrJson))
                {
                    var hrMod = JsonConvert.DeserializeObject<Staff>(hrJson);
                    var viewModel = new StaffClaimViewModel
                    {
                        Staff = hrMod,
                        claims = _claimService.GettingClaims(),
                        lecturers = _lecturerService.GetLecturers()
                    };
                    return View(viewModel);

                }
                else
                    Console.WriteLine("String is empty");
            }catch(Exception e)
            {
                Console.WriteLine(e);
            }
            return View();
        }
        //lecturer
        public IActionResult IC()
        {
            try
            {
                //(Enamno, 2013)
                var lecturerJson = HttpContext.Session.GetString("LecturerDetails");
                if (!string.IsNullOrEmpty(lecturerJson))
                {
                    var lecturer = JsonConvert.DeserializeObject<Lecturer>(lecturerJson);
                    var viewModel = new LecturerClaimViewModel
                    {
                        Lecturer = lecturer,
                        Claims = _claimService.GettingClaims(lecturer.Id)
                    };
                    return View(viewModel);
                }
                else
                    Console.WriteLine("String is empty");
            }
            catch(Exception e)
            {
                Console.WriteLine(e);
            }
          
            return View();
        }
        //set the session in here
        public IActionResult AM()
        {
            try
            {
                //(Enamno, 2013)
                var academic_manJson = HttpContext.Session.GetString("AM_Details");
                var staffObj = JsonConvert.DeserializeObject<Staff>(academic_manJson);
                var viewModel = new StaffClaimViewModel
                {
                    Staff = staffObj,
                    claims = _claimService.GettingClaims(),
                    lecturers = _lecturerService.GetLecturers()
                };
                return View(viewModel);
            }
            catch(Exception e)
            {
                Console.WriteLine(e);
            }
            return View();
            
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
    //Code Attribution:
    //The section based on getting the session and just creating a session was adpated from the example 
    //Jobert Enamno gave on StackOverflow:
    //https://stackoverflow.com/questions/14138872/how-to-use-sessions-in-an-asp-net-mvc-4-application
}
