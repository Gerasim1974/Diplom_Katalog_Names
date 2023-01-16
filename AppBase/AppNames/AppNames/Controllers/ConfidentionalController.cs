using Microsoft.AspNetCore.Mvc;
using AppNames.Classes;
using AppNames.SqlClass;
using AppNames.Models;

namespace AppNames.Controllers
{
    
    public class ConfidentionalController : Controller
    {
        public static ConfidentionalToView _confidentionalToView = new ConfidentionalToView();
        public ConfidentionalToView confidentionalToView = new ConfidentionalToView();

        public static ConfidentionalModel confidentionalModel = new ConfidentionalModel();
        public ConfidentionalSql confidentionalSql = new ConfidentionalSql();

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            confidentionalToView = _confidentionalToView;
            if (string.IsNullOrEmpty(confidentionalToView.StrStatusFooter))
            {
                confidentionalToView.StrStatusFooter = "НЕ АВТОРИЗОВАН";
            }
            confidentionalModel.confidentionalToView = confidentionalToView;
            ViewBag.confidentionalToView = confidentionalToView;
            return View(confidentionalModel);
        }

        [HttpPost]
        public async Task<IActionResult> Index(ConfidentionalToView confidentionalToView)
        {
           if (confidentionalToView.RegForm)
            {
                //создаем новыйй аккаут
                confidentionalToView = await confidentionalSql.CreateNewAccount(confidentionalToView);
                _confidentionalToView = confidentionalToView;
            }
           else
            {
                //пытаемся приконектится к сущесвующему
                confidentionalToView = await confidentionalSql.AutorizNewAccount(confidentionalToView);
                _confidentionalToView = confidentionalToView;
            }
            if (_confidentionalToView.Success) 
               { HomeController.Login = _confidentionalToView.login; }
              else
               { HomeController.Login = ""; } 
            return RedirectToAction("Index", "Confidentional");
        }
    }
}
