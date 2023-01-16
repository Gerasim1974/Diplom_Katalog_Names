using AppNames.Models;
using Microsoft.AspNetCore.Mvc;
using AppNames.Classes;
using AppNames.SqlClass;

namespace AppNames.Controllers
{
    public class NamesToEditController : Controller
    {
        public static string sError = "";
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            NamesToEditModel namesToEditModel = new NamesToEditModel();
            if ( HomeController.Login.Length == 0)
            { namesToEditModel.namesToEdit.Success = false; }
            else 
            { namesToEditModel.namesToEdit.Success = true; }
            namesToEditModel.namesToEdit.sError = sError;
            return View(namesToEditModel);
        }

        [HttpPost]
        public async Task<IActionResult> Index(NamesToEdit namesToEdit)
        {
            Boolean fl = true;
            string sLogin = HomeController.Login; 
            string? sName = namesToEdit.Name;
            if (String.IsNullOrEmpty(sName)) 
             { fl = false; } 
             else 
              { sName = sName.Trim(); }
            string? sUrl = namesToEdit.UrlAdress;
            string? sNotice = namesToEdit.Notice;
            if (String.IsNullOrEmpty(sUrl) && String.IsNullOrEmpty(sNotice))
            {
                fl = false;
            }
            else
            {
                if (!String.IsNullOrEmpty(sUrl)) 
                { sUrl = sUrl.Trim(); }
                if (!String.IsNullOrEmpty(sNotice))
                { sNotice = sNotice.Trim(); }
            }

            NamesToEditSql namesToEditSql = new NamesToEditSql();

            sError = await namesToEditSql.ReadToEdit(sName, sUrl, sNotice, sLogin);

            return RedirectToAction("Index", "NamesToEdit");
        }
    }
}
