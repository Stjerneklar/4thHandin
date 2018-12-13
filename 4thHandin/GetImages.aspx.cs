using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _4thHandin
{
    public partial class GetImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelResults.Text = FourthProjectLogic.OmdbAPI.GetImagesFromApi(); //return number of changed images - only change images for movies without poster (null, n/a, error) 
        }
    }
}