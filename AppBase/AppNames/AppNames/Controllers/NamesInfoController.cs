using AppNames.Models;
using Microsoft.AspNetCore.Mvc;
using AppNames.Classes;
using AppNames.SqlClass;

namespace AppNames.Controllers
{
    public class NamesInfoController : Controller
    {
        public static string _name = "";

        public async Task<IActionResult> Index(string? Name)
        {
            string _Name;
            if (Name == null && _name != null)
            { _Name = _name; }
            else
            {
                _name = Name;
                _Name = Name;
            }
            NameInfoSql namesInfoSql = new NameInfoSql();
            NamesInfoModel namesInfoModel = new NamesInfoModel();
            Names namesInfo = new Names();
            namesInfo = await namesInfoSql.ReadNames(_Name);
            string sAngelDays = "";
            sAngelDays = await namesInfoSql.ReadAngelDays(namesInfo.name, "#");
            if (sAngelDays.Length > 0)
            { 
                string[] arAngelDays = sAngelDays.Split('#'); 
                foreach (var Item in arAngelDays)
                {
                    string s = Item;
                    namesInfo.angelDay.Add(s);
                }
            }
            else
            {
         
            }

            ViewBag.namesInfo = namesInfo;

            return View();
        }

      
    }
}
