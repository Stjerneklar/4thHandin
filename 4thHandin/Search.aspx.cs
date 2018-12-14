using System;

namespace _4thHandin
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
            //redirect to home if there is no querystring 
            if (string.IsNullOrWhiteSpace(Request.QueryString["queryName"]))
            {
                Response.Redirect("~/");
            }
            else
            {
                LabelThatIsActuallyAnHtmlInjector.Text = FourthProjectLogic.Movie.RenderPosters("Search", Request.QueryString["queryName"]); ;
                if (LabelThatIsActuallyAnHtmlInjector.Text == "No Results for that, sorry!")
                {
                    LabelThatIsActuallyAnHtmlInjector.Visible = true;
                }
            }
        }
    }
}

