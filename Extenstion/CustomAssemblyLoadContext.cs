using Microsoft.AspNetCore.Http.HttpResults;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Runtime.Loader;

namespace CMCS_PROG_.Extenstion
{
    //this code was adpated from : https://volosoft.com/blog/Convert-HTML-and-Export-to-PDF-using-DinkToPdf-on-ASP.NET-Boiler
    //(Yekalkan, 2019)
    public class CustomAssemblyLoadContext : AssemblyLoadContext
    {

        public IntPtr LoadUnmanagedLibrary(string absolutePath)
        {
            return LoadUnmanagedDll(absolutePath);
        }

        protected override IntPtr LoadUnmanagedDll(string unmanagedDllPath)
        {
            return NativeLibrary.Load(unmanagedDllPath);
        }

        protected override Assembly Load(AssemblyName assemblyName)
        {
            return null;
        }
    }

}
// reference List:
//Yekalkan, 2019. Convert HTML & Export to PDF using DinkToPdf. [Online]
//Available at: https://volosoft.com/blog/Convert-HTML-and-Export-to-PDF-using-DinkToPdf-on-ASP.NET-Boiler
//[Accessed 19 November 2024].

