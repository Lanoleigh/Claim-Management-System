using CMCS_PROG_.Data;
using CMCS_PROG_.Models;
using CMCS_PROG_.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using CMCS_PROG_.Extenstion;
using DinkToPdf;
using DinkToPdf.Contracts;

namespace CMCS_PROG_.Controllers
{
    public class InvoiceController : Controller
    {
        private readonly ApplicationDbContext _context;
        
        private readonly ICompositeViewEngine _viewEngine;
        private readonly LecturerClaimViewModel _lecturerClaimView;
        private readonly IConverter _converter;
        public InvoiceController(ApplicationDbContext context,ICompositeViewEngine compositeViewEngine, IConverter converter)
        {
            
            _context = context;
            _viewEngine = compositeViewEngine;
            _converter = converter;
        }
        //this code below was adapted from: https://volosoft.com/blog/Convert-HTML-and-Export-to-PDF-using-DinkToPdf-on-ASP.NET-Boiler
        //(Yekalkan, 2019)
        public async Task<IActionResult> GenerateInvoice(Claim claim)
        {
            try
            {
                string claimID = claim.Claim_ID;
                var activeClaim = GetClaimByID(claimID);
                var htmlContent = await this.RenderViewToStringAsync("Invoice/InvoiceFormat", activeClaim, _viewEngine);

                var pdfBytes = GeneratePDF(htmlContent);
                Response.Headers.Add("Content-Disposition", "inline; filename=ClaimInvoice.pdf");
                return File(pdfBytes, "application/pdf", "ClaimInvoice.pdf");
            }
            catch(Exception e)
            {

                Console.WriteLine(e.ToString());
            }
            var returnUrl = Request.Headers["Referer"].ToString();
            return Redirect(returnUrl);


        }
        private Claim GetClaimByID(string claimID) 
        {
            Claim claim = new Claim();
            claim = _context.Claim.Where(c => c.Claim_ID.Equals(claimID)).FirstOrDefault();
            return claim;
        }
        //(Yekalkan, 2019)
        public byte[] GeneratePDF(string htmlContent)
        {
            var pdfDoc = new HtmlToPdfDocument()
            {
                GlobalSettings = new GlobalSettings()
                {
                    PaperSize = PaperKind.A4,
                    Orientation = Orientation.Portrait,
                    DocumentTitle = "Claim Invoice/Report",
                },
                Objects =
                {
                    new ObjectSettings
                    {
                        HtmlContent = htmlContent,
                        WebSettings = { DefaultEncoding = "utf-8" },
                    }
                }


            };
            return _converter.Convert(pdfDoc);
        }

    }
}
// Reference List: 
//Yekalkan, 2019. Convert HTML & Export to PDF using DinkToPdf. [Online]
//Available at: https://volosoft.com/blog/Convert-HTML-and-Export-to-PDF-using-DinkToPdf-on-ASP.NET-Boiler
//[Accessed 19 November 2024].