using Microsoft.AspNetCore.Mvc;
using AppNames.Classes;
using AppNames.SqlClass;

namespace AppNames.Controllers
{
    public class TodayController : Controller
    {
        
        public TodaySql todaySql = new TodaySql();
        public List<Names> names = new List<Names>();

        [HttpGet]
        public async Task<IActionResult> Index()
        {
           
            names = await todaySql.ReadNames();
            ViewBag.lstToday = names;
            return View();
        }
    }
}
