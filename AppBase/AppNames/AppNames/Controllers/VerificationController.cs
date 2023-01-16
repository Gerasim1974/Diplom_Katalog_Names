using AppNames.Models;
using Microsoft.AspNetCore.Mvc;
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
            return View(verificationModel);
        }
    }
}
