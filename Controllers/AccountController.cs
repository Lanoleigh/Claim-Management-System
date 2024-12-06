using CMCS_PROG_.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Authentication;
using Newtonsoft.Json;
using CMCS_PROG_.Data;


namespace CMCS_PROG_.Controllers
{
    public class AccountController : Controller
    {
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly UserManager<ApplicationUser> _userManager;
        
            
        public readonly List<Lecturer> lecDetails = new List<Lecturer>();
        public readonly List<Staff> staffDetails = new List<Staff>();
        public Lecturer lecturer = new Lecturer();
        public AccountController(SignInManager<ApplicationUser> signInManager, UserManager<ApplicationUser> userManager)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            
        }

        public List<Lecturer> GetLecturesEmail()
        {
            try
            {
                string connectionString = "Server=ZALANO\\SQLEXPRESS01;Database=CMS;TrustServerCertificate=true;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = "SELECT Id,Lecturer_ID,lecturer_name,lecturer_surname,phone_number_custom,Hourly_Rate,Email,UserName FROM Lecturers";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Lecturer lecturer = new Lecturer();
                                lecturer.Id = reader.GetString(0);
                                lecturer.Lecturer_ID = reader.GetString(1);
                                lecturer.lecturer_name = reader.GetString(2);
                                lecturer.lecturer_surname = reader.GetString(3);
                                lecturer.phone_number_custom = reader.GetString(4);
                                lecturer.Hourly_Rate = reader.GetDouble(5);
                                lecturer.Email = reader.GetString(6);
                                lecturer.UserName = reader.GetString(7);
                                lecDetails.Add(lecturer);
                            }
                        }

                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return lecDetails;
        }
        public List<Staff> GetStaffEmail()
        {
            try
            {
                string connectionString = "Server=ZALANO\\SQLEXPRESS01;Database=CMS;TrustServerCertificate=true;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = "SELECT Id,Staff_ID,Name,Surname,title,Email FROM Staff";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Staff staff = new Staff();
                                staff.Id = reader.GetString(0);
                                staff.Staff_ID = reader.GetString(1);
                                staff.Name = reader.GetString(2);
                                staff.Surname = reader.GetString(3);
                                staff.title = reader.GetString(4);
                                staff.Email = reader.GetString(5);
                                staffDetails.Add(staff);
                            }
                        }

                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return staffDetails;
        }
        List<AspNetUsers> GetAspNetUsers()
        {
            List<AspNetUsers> netUsers = new List<AspNetUsers>();
            try
            {
                string connectionString = "Server=ZALANO\\SQLEXPRESS01;Database=CMS;TrustServerCertificate=true;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = "SELECT Email, PasswordHash from AspNetUsers ";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                AspNetUsers aspNetUsers = new AspNetUsers();
                                aspNetUsers.Email = reader.GetString(0);
                                aspNetUsers.Password = reader.GetString(1);
                                netUsers.Add(aspNetUsers);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine($"Connecition was faulty boy \n\n {e}");
            }

            return netUsers;
        }
        //private async Task HashPasswordAsync()
        //{
        //    var users = GetAspNetUsers();

        //        var identityUser = await _userManager.FindByEmailAsync("admin01@example.com");
                
        //        if (identityUser != null)
        //        {
        //            var hasher = new PasswordHasher<IdentityUser>();
        //            var hashedPass = hasher.HashPassword(identityUser, identityUser.Password);

        //            identityUser.PasswordHash = hashedPass;

        //            await _userManager.UpdateAsync(identityUser);
                  
        //        }

            
        //}

        public IActionResult GetLecturerDetails()
        {
            if (User.Identity.IsAuthenticated)
            {
                var username = User.Identity.Name;
               
                foreach (var item in lecDetails)
                {
                    if (item.UserName == username)// it is comparing the name not the email address.
                    {
                        lecturer.Id = item.Id;
                        lecturer.Lecturer_ID = item.Lecturer_ID;
                        lecturer.lecturer_name = item.lecturer_name;
                        lecturer.lecturer_surname = item.lecturer_surname;
                        lecturer.UserName = item.UserName;
                        lecturer.phone_number_custom = item.phone_number_custom;
                        lecturer.Hourly_Rate = item.Hourly_Rate;
                        lecturer.Email = item.Email;
                        HttpContext.Session.SetString("LecturerDetails", JsonConvert.SerializeObject(lecturer));
                        return RedirectToAction("IC", "Home");
                    }
                }
            }

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Logout() 
        {
            await HttpContext.SignOutAsync();
            HttpContext.Session.Clear();//clears all the sessions.
            return RedirectToAction("Login","Account");
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                GetLecturesEmail();
                GetStaffEmail();
               // await HashPasswordAsync(); //once used, never run this method again



                var user = await _userManager.FindByEmailAsync(model.EmailAddress);
                if (user != null)
                {

                    var result = await _signInManager.PasswordSignInAsync(user, model.Password, false, false);
      
                    if (result.Succeeded)
                    {
                       
                        foreach (var item in lecDetails)
                        {
                            if (item.Email == model.EmailAddress)
                            {
                               return GetLecturerDetails();//in a working env. this would be in the Lecturer Service
                            }
                        }
                        foreach (var item in staffDetails)
                        {
                           
                            if (item.Email == model.EmailAddress)
                            {
                                
                                Staff staff3 = new Staff();
                                staff3.Id = item.Id;
                                staff3.Staff_ID = item.Staff_ID;
                                staff3.Name = item.Name;
                                staff3.Email = item.Email;
                                if (item.Name.Equals("Admin"))
                                {
                                    HttpContext.Session.SetString("HR_Ses", JsonConvert.SerializeObject(staff3));
                                    return RedirectToAction("HR", "Home");
                                }
                                if (item.title.Equals("Programme Coordinator"))
                                {
                                    staff3.title = item.title;
                                    HttpContext.Session.SetString("PC_Details", JsonConvert.SerializeObject(staff3));
                                    return RedirectToAction("Admin", "Home");
                                 
                                }
                                else
                                {
                                    staff3.title = item.title;
                                    HttpContext.Session.SetString("AM_Details", JsonConvert.SerializeObject(staff3));
                                    return RedirectToAction("AM", "Home");

                                }
                                    
                            }
                        }

                    }
                }
            }
            ModelState.AddModelError("", "Invalid login attempt");
            return View(model);
        }

     private class AspNetUsers
     {
            public string Email { get; set; }
            public string Password { get; set; }
     }


    }
}
