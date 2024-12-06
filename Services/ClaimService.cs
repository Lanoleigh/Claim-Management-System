using CMCS_PROG_.Data;
using CMCS_PROG_.Models;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System.Data.SqlClient;

namespace CMCS_PROG_.Services
{
    public class ClaimService
    {
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly IServiceProvider _serviceProvider;
        public ClaimService(IHttpContextAccessor contextAccessor,IServiceProvider serviceProvider)
        {
            _contextAccessor = contextAccessor;
            _serviceProvider = serviceProvider;
        }
        public Claim GenerateClaimDetails(Claim claim)
        {
            
            // new claim date
            claim.DateOfClaim = DateTime.Today;

            //Lecturer ID needs to be assigned.
            var lecturerJson = _contextAccessor.HttpContext.Session.GetString("LecturerDetails");
            if (string.IsNullOrEmpty(lecturerJson)) 
            {
                Console.WriteLine("Empty Json object");
            }
            var lecObjectt = JsonConvert.DeserializeObject<Lecturer>(lecturerJson);
            claim.fk_lecturer_id = lecObjectt.Id;

            // assigning staff id

            claim.fk_staff_id = GettingStaffId();

            //new claim ID
            if (!string.IsNullOrEmpty(lecturerJson))
            {
                List<string> claimIds = new List<string>();
                try
                {
                    string connectionString = "Server=ZALANO\\SQLEXPRESS01;Database=CMS;TrustServerCertificate=true;Integrated Security=True";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string sql = "SELECT Claim_ID FROM Claims";
                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    claimIds.Add(reader.GetString(0));
                                }
                            }

                        }
                    }
                }
                catch
                {
                    Console.WriteLine("Connection is faulty");
                }
                string lastClaimId = claimIds.Last();
                int number = Int32.Parse(lastClaimId.Substring(1));
                number++;
                string newClaimId = "C" + number.ToString("D4");
                claim.Claim_ID = newClaimId;

            }
            return claim;
        }


        string GettingStaffId()
        {
            List<Staff1> staffIDs = new List<Staff1>();
            try
            {
                string connectionString = "Server=ZALANO\\SQLEXPRESS01;Database=CMS;TrustServerCertificate=true;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = "SELECT Id,Staff_ID FROM Staff";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read()) // next time debug this section to see if the user can access this.
                            {
                                Staff1 sf = new Staff1();
                                sf.Id = reader.GetString(0);
                                sf.Staff_Id = reader.GetString(1);
                                staffIDs.Add(sf);
                            }
                        }

                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("This connection is faulty.\n\n" + e);
            }

            Random random = new Random();
            string prefix = "PC";

            // Filter the staff IDs to only include those that start with the prefix
            List<Staff1> filteredList = staffIDs.Where(item => item.Staff_Id.StartsWith(prefix)).ToList();
            foreach(var item in filteredList)
            {
                Console.WriteLine(item.Id + "---" + item.Staff_Id);
            }
            
            if (filteredList.Count == 2)
            {
                // Generate a random index (0 or 1) to select one of the two staff members
                int randomChoice = random.Next(2);
                string assignedStaffId = filteredList[randomChoice].Id;
                return assignedStaffId;
            }
            else
            {
                // Handle the case where there are not exactly two filtered results
                throw new InvalidOperationException("Expected exactly two staff members, but found: " + filteredList.Count);
            }

        }
        public List<Claim> GettingClaims(string searchID)
        {
            List<Claim> listofClaims = new List<Claim>();
            using (var scope = _serviceProvider.CreateScope())
            {
                var context = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
                //use of LINQ and Lambda expression
                listofClaims = context.Claim.Where(s => s.fk_lecturer_id == searchID).ToList();
            }
            
            return listofClaims;
        }
        //getting all claims
        public List<Claim> GettingClaims()
        {
            List<Claim> listofClaims = new List<Claim>();
            using (var scope = _serviceProvider.CreateScope())
            {
                var context = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
                //use of LINQ 
                listofClaims = context.Claim.ToList();
            }

            return listofClaims;
        }

    }
    internal class Staff1
    {
        public string Id { get; set; }
        public string Staff_Id { get; set; }
    }
    //class for the delegate
    public class ClaimEventArgs : EventArgs
    {
        public string claim_ID { get; set; }
        public string claimStatus { get; set; }
        public string? fk_staff_id { get; set; }
    }
}
