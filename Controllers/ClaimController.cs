using CMCS_PROG_.Data;

using CMCS_PROG_.Models;
using CMCS_PROG_.Services;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;

namespace CMCS_PROG_.Controllers
{
    public class ClaimController : Controller
    {
        private readonly ApplicationDbContext _dbContext;
        //define the delegate
        public delegate void ClaimStatusEventHandler (object sender, ClaimEventArgs e);
        //define the event that
        public event ClaimStatusEventHandler StatusChanged;
      
        public ClaimController(ApplicationDbContext applicationDbContext)
        {
            _dbContext = applicationDbContext;
            //subscribe to event
            this.StatusChanged += UpdateClaimStatus;
        }
        //method to approve claim
        [HttpPost]
        public IActionResult ApproveClaim(Claim claim)
        {
            try
            {
                string newStatus;
                if (claim.Status.Equals("Pending"))
                {
                    newStatus = "Processing";
                    claim.fk_staff_id = "3";
                }
                else
                    newStatus = "Approved";
                OnClaimStatusChanged(claim.Claim_ID, newStatus, claim.fk_staff_id);//raising the event
            }catch(Exception e)
            {
                Console.WriteLine(e);
            }
          
            var returnUrl = Request.Headers["Referer"].ToString();
            return Redirect(returnUrl);
        }
        [HttpPost]
        public IActionResult RejectClaim(Claim claim)
        {
            try
            {
                string newStatus = claim.Status = "Rejected";
                OnClaimStatusChanged(claim.Claim_ID, newStatus, claim.fk_staff_id);//raising the event
                
            }
            catch (Exception e) 
            
            {
                Console.WriteLine(e);
            }
            var returnUrl = Request.Headers["Referer"].ToString();
            return Redirect(returnUrl);
        }
        //event to be risen (logic to change the status of the claim)
        protected virtual void OnClaimStatusChanged(string claim_id, string claim_status,string staff_id)
        {
            if(StatusChanged != null)
            {
                StatusChanged(this, new ClaimEventArgs { claim_ID = claim_id , claimStatus = claim_status, fk_staff_id = staff_id });
            }
        }
        private void UpdateClaimStatus(object sender, ClaimEventArgs e)
        {
            try
            {
                var claim = _dbContext.Claim.FirstOrDefault(c => c.Claim_ID.Equals(e.claim_ID));
                if (claim != null)
                {
                    claim.Status = e.claimStatus;
                    claim.fk_staff_id = e.fk_staff_id;
                    _dbContext.SaveChanges();
                }
                else
                {
                    Console.WriteLine("Claim not found brooooo");
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
        
        }

       
    }
}
