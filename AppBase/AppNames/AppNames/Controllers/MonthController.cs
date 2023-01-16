using Microsoft.AspNetCore.Mvc;
using AppNames.Classes;
using AppNames.SqlClass;

namespace AppNames.Controllers
{
    public class MonthController : Controller
    {
        public MonthSql monthSql = new MonthSql();
        public List<NamesOfMonth> namesOfMonth = new List<NamesOfMonth>();

        public NameInfoSql nameInfoSql = new NameInfoSql();
        public Names names = new Names();

        // GET: MonthController
        [HttpGet]
        public async Task<IActionResult> Index(int? NumbMonth)
        {
            namesOfMonth = await monthSql.ReadNamesOfMonth(NumbMonth);
            ViewBag.lstNamesOfMonth = namesOfMonth;
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> UserInfo(string Name)
        {
            names = await nameInfoSql.ReadNames(Name);
            ViewBag.Names = names;
            return View();
        }

    }
}
