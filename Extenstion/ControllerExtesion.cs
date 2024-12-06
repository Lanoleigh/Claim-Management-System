using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http.HttpResults;

namespace CMCS_PROG_.Extenstion
{
    public static class ControllerExtesion
    {
        //this code was adapted from: https://ppolyzos.com/2016/09/09/asp-net-core-render-view-to-string/
        //(Polyzos, 2016)
        public static async Task<string> RenderViewToStringAsync(this Controller controller, string viewName, object model, ICompositeViewEngine viewEngine)
        {
            controller.ViewData.Model = model;
            using var writer = new StringWriter();
            var viewResult = viewEngine.FindView(controller.ControllerContext, "InvoiceFormat", false);
            if (!viewResult.Success)
            {
                throw new InvalidOperationException($"View not found!{string.Join(",",viewResult.SearchedLocations)}");
            }
            var viewContext = new ViewContext(
                controller.ControllerContext,
                viewResult.View,
                controller.ViewData,
                controller.TempData,
                writer,
                new HtmlHelperOptions()
                );
            await viewResult.View.RenderAsync(viewContext);
            return writer.GetStringBuilder().ToString();
        }
    }
}
// reference List:
//Polyzos, P., 2016. ASP.NET Core Render View to String. [Online]
//Available at: https://ppolyzos.com/2016/09/09/asp-net-core-render-view-to-string/
//[Accessed 19 November 2024].

