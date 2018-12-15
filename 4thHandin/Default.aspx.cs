using System;
using System.Web.UI;

namespace _4thHandin
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LiteralHtmlInjector.Text = FourthProjectLogic.Movie.RenderPosters("Top10", "");
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
           FourthProjectLogic.SearchMovies(TextBox1.Text);
        }
    }
}