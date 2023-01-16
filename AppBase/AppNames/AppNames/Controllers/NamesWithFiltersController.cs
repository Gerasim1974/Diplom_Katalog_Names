using Microsoft.AspNetCore.Mvc;
using AppNames.Classes;
using AppNames.SqlClass;
using AppNames.Models;

namespace AppNames.Controllers
{
    public class NamesWithFiltersController : Controller
    {
        public static NamesWithFiltersModel _namesFiltersModel = new NamesWithFiltersModel();

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            NamesWithFiltersSql namesWithFiltersSql = new NamesWithFiltersSql();
            NamesWithFiltersModel namesWithFiltersModel = new NamesWithFiltersModel();
            namesWithFiltersModel.namesWithFilters.sex = _namesFiltersModel.namesWithFilters.sex;
            namesWithFiltersModel.namesWithFilters.name = _namesFiltersModel.namesWithFilters.name;
            namesWithFiltersModel.namesWithFilters.NameList = await namesWithFiltersSql.ReadNames();
            namesWithFiltersModel.namesWithFilters.NameList.Insert(0, "");
            namesWithFiltersModel.namesWithFilters.origin = _namesFiltersModel.namesWithFilters.origin;
            namesWithFiltersModel.namesWithFilters.OriginList = await namesWithFiltersSql.ReadOrigin();
            namesWithFiltersModel.namesWithFilters.OriginList.Insert(0, "");
            namesWithFiltersModel.namesWithFilters.denotation = _namesFiltersModel.namesWithFilters.denotation;
            namesWithFiltersModel.namesWithFilters.DenotationList = await namesWithFiltersSql.ReadDenotation();
            namesWithFiltersModel.namesWithFilters.DenotationList.Insert(0, "");
            namesWithFiltersModel.namesWithFilters.namesResult = _namesFiltersModel.namesWithFilters.namesResult;
            return View(namesWithFiltersModel);
        }

        [HttpPost]
        public async Task<IActionResult> Index(NamesWithFilters namesWithFilters)
        {
            NamesWithFiltersSql namesWithFiltersSql = new NamesWithFiltersSql();

            string sex = "";
            if (namesWithFilters.sex != null)
            { sex = namesWithFilters.sex; }
            string origin = "";
            if (namesWithFilters.origin != null)
            { origin = namesWithFilters.origin; }
            string denotation = "";
            if (namesWithFilters.denotation != null)
            { denotation = namesWithFilters.denotation; }
         
            _namesFiltersModel.namesWithFilters.sex = sex;
            _namesFiltersModel.namesWithFilters.origin = origin;
            _namesFiltersModel.namesWithFilters.denotation = denotation;
            List<Names> names = new List<Names>();
            names = await namesWithFiltersSql.ReadListNamesIntoFilters(sex, origin, denotation);
            //получаем список выбранных имен
            _namesFiltersModel.namesWithFilters.namesResult = names;
            return RedirectToAction("Index", "NamesWithFilters");
        }
    }
}
