using System;

namespace _4thHandin
{
    public partial class Browse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.ConnectionString = FourthProjectLogic.ConnStr; //data for dropdownlist

            //if no genre querystring, default to action movies
            if (string.IsNullOrWhiteSpace(Request.QueryString["genre"]))
            {
                LabelThatIsActuallyAnHtmlInjector.Text = FourthProjectLogic.Movie.RenderPosters("Genre", "Action");
            }
            else //use querystring
            {
                LabelThatIsActuallyAnHtmlInjector.Text = FourthProjectLogic.Movie.RenderPosters("Genre", Request.QueryString["genre"]); 
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //navigate to page with querystring after selection               
            Response.Redirect("~/browse/?genre=" + DropDownList1.SelectedValue);
        }
    }
}