using DinkToPdf;
using DinkToPdf.Contracts;
using Microsoft.AspNetCore.Http.HttpResults;

namespace CMCS_PROG_.Services
{
    public class InvoiceService
    {
        private readonly IConverter _converter;
        private readonly ILogger _logger;

        public InvoiceService(IConverter converter, ILogger logger)
        {
            _converter = converter;
            _logger = logger;
        }
        // this code was adapted from : https://volosoft.com/blog/Convert-HTML-and-Export-to-PDF-using-DinkToPdf-on-ASP.NET-Boiler
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
