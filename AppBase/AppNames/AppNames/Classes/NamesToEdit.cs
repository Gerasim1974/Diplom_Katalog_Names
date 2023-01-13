using System.ComponentModel.DataAnnotations;
namespace AppNames.Classes
{
    public class NamesToEdit
    {
        public string Name {get; set;}

        public string UrlAdress { get; set; }

        [DataType(DataType.MultilineText)]
        public string Notice { get; set; }

        public Boolean Success { get; set; }

        public string sError { get; set; }

    }
}
