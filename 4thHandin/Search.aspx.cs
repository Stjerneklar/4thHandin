using System;

namespace _4thHandin
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
            if (string.IsNullOrWhiteSpace(Request.QueryString["queryName"]))
            {
                //Response.Redirect("~/");
                label_noresultsmessage.Visible = true;
                LiteralHtmlInjector.Text = FourthProjectLogic.Movie.RenderPosters("Search", "Avengers");
            }
            else
            {
                LiteralHtmlInjector.Text = FourthProjectLogic.Movie.RenderPosters("Search", Request.QueryString["queryName"]);
            }
        }
    }
}

