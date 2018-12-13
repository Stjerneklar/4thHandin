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
                //example of the DataAccessLayer being useful: here we work with the data directly from the source instead of depending on the webcontrol(repeater in this case) 
                // and possibly having logic fail if we decided to change to a gridview ect. we just ask the table we also use for datasource for shit directly.
                DataAccessLayer.MovieDBListDataTable results = FourthProjectLogic.Movie.MovieTableAdapter.GetMovieBySearchTitle(Request.QueryString["queryName"]);
                Repeater2.DataSource = results;
                Repeater2.DataBind();

                if (results.Count == 1)
                {
                    //redirect to single view if we only get one result
                    Response.Redirect("~/SingleView/?queryID=" + results.Rows[0][0]);
                }
                else if (results.Count == 0)
                {
                    label_noresultsmessage.Visible = true;
                }
            }
        }
    }
}

