using System;
using System.Linq;
using System.ComponentModel.DataAnnotations;
namespace AppNames.Classes
{
    public class NamesWithFilters
    {
        public string name { get; set; } = "";
        public string origin { get; set; } = "";
        public string denotation { get; set; } = "";
        public string sex { get; set; } = "";

        [Display(Name = "Users")]
        public List<string> NameList { get; set; } = new List<string>(); //список всех имен

        [Display(Name = "Origins")]
        public List<string> OriginList { get; set; } = new List<string>(); //возможное происхождение

        [Display(Name = "Denotations")]
        public List<string> DenotationList { get; set; } = new List<string>(); //возможное значение
        [Display(Name = "Sexs")]
        public List<string> SexList { get; set; } = new List<string>() { "женжина", "мужчина" };

        public List<Names> namesResult { get; set; } = new List<Names>();
    }
}
