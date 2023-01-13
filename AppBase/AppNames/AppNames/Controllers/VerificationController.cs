using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;
using AppNames.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using AppNames.Classes;
using AppNames.SqlClass;

namespace AppNames.Controllers
{
    public class VerificationController : Controller
    {
        public async Task<IActionResult> Index()
        {
            VerificationModel verificationModel = new VerificationModel();
            VerificationSql verificationSql = new VerificationSql();
            verificationModel.verification = await verificationSql.ReadNames();
            //ViewBag.verification = verificationModel.verification;
            return View(verificationModel);
        }
    }
}
