using CMCS_PROG_.Data;
using CMCS_PROG_.Models;
using CMCS_PROG_.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.EntityFrameworkCore;

namespace CMCS_PROG_.Controllers
{
    public class LecturerController : Controller
    {
        public List<Lecturer> listOfLecturers = new List<Lecturer>();
        public Lecturer lecturer = new Lecturer();

        private readonly ApplicationDbContext _dbContext;
        private readonly ClaimService _claimService;

        public LecturerController(ApplicationDbContext dbContext,ClaimService claimService)
        {
            _dbContext = dbContext;
            _claimService = claimService;
        }
        [HttpPost]
        public async Task<RedirectResult> SubmitClaim(Claim claimModel)
        {
            //try catch for error handling
            try
            {
                claimModel = _claimService.GenerateClaimDetails(claimModel); //generating claim details
                //automating the claim process against the claim amount criteria
                if(claimModel.Claim_Amount < 80000)
                {
                    claimModel.Status = "Processing";
                    claimModel.fk_staff_id = "AM789";
                }else
                claimModel.Status = "Pending";
                string returnUrl1;
                
                //retrieving the file and storing it in the solutions directory
                if (claimModel.SupportingDocs != null)
                {
                    long maxFileSize = 5 * 1024 * 1024;//max limit of 5mb
                    var fileSize = claimModel.SupportingDocs.Length;
                    var allowedExtenstion = new[] { ".pdf", ".docx", ".doc" };
                    var fileExtension = Path.GetExtension(claimModel.SupportingDocs.FileName).ToLower();
                    var uploadFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/FileUpload");
                    if(fileSize > maxFileSize)
                    {
                        ModelState.AddModelError("SupportingDocs","File limit Exceeded. Max 5mb");
                        returnUrl1 = Request.Headers["Referer"].ToString();
                        return Redirect(returnUrl1);
                    }
                    if (!allowedExtenstion.Contains(fileExtension))
                    {
                        ModelState.AddModelError("SupportingDocs", "We only accept Word documents and PDF");
                        returnUrl1 = Request.Headers["Referer"].ToString();
                        return Redirect(returnUrl1);
                    }
                    if (!Directory.Exists(uploadFolder))
                    {
                        Directory.CreateDirectory(uploadFolder);
                    }
                    var fileName = Path.GetFileName(claimModel.SupportingDocs.FileName);
                    var filePath = Path.Combine(uploadFolder, fileName);

                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                       
                        await claimModel.SupportingDocs.CopyToAsync(fileStream);
                    }
                    claimModel.FilePath = "/FileUpload/" + fileName;

                }
                _dbContext.Claim.Add(claimModel);
                await _dbContext.SaveChangesAsync();
                TempData["SuccessMessage"] = "Claim Submitted Successfully!";

            }
            catch(Exception e)
            {
                Console.WriteLine(e.ToString());
            }

            var returnUrl = Request.Headers["Referer"].ToString();
            return Redirect(returnUrl);
        }
        public async Task<RedirectResult> UpdateLecDetails(Lecturer lecturer)
        {
            var returnUrl = Request.Headers["Referer"].ToString();
            try
            {
                var existingLecturer = _dbContext.Lecturer.Where(l => l.Lecturer_ID == lecturer.Lecturer_ID).FirstOrDefault();
                if (existingLecturer != null)
                {
                    existingLecturer.lecturer_surname = lecturer.lecturer_surname;
                    existingLecturer.Email = lecturer.Email;
                    existingLecturer.phone_number_custom = lecturer.phone_number_custom;
                    await _dbContext.SaveChangesAsync();
                }
            }
            catch(Exception e)
            {
                Console.WriteLine(e.ToString());
            }    
            
            return Redirect(returnUrl);
        }



    }

    //Code Attribution:
    //This method is for submission of a claim, I attribute the section of file upload and checking the file size
    // the logic is based on examples and explanantion from Microsoft ASP.NET Core documentation:
    //https://learn.microsoft.com/en-us/aspnet/core/mvc/models/file-uploads?view=aspnetcore-7.0
}
