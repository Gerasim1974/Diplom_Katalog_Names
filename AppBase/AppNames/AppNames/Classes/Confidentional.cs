namespace AppNames.Classes
{
    public class Confidentional
    {
        public string Crypt(string str, ushort secretKey)
        {
            string strCrypt = "";
            var ch = str.ToArray();
            foreach (var item in ch)
            {
                strCrypt += CharToChar(item, secretKey);
            }
              return strCrypt;
        }
        public char CharToChar(char character, ushort secretKey)
        {
            character = (char)(character ^ secretKey);
            return character;
        }
    }
}
