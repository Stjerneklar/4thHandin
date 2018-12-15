using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace _4thHandin
{
    public partial class SingleView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //redirect to home if there is no querystring
            if (string.IsNullOrWhiteSpace(Request.QueryString["queryID"])) {
                Response.Redirect("~/");
            }        

            FourthProjectLogic.Movie themovie = new FourthProjectLogic.Movie(Int32.Parse(Request.QueryString["queryID"])); //get movie object via id, fetching db info for it

            themovie.IncrementViewcount(); //what it says on the tin, this is how we track views

            string result = FourthProjectLogic.OmdbAPI.NameAPI(themovie.title,themovie.year); 

            File.WriteAllText(Server.MapPath("~/MyFiles/Latestresult.xml"), result);
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(result);

            if (doc.SelectSingleNode("/root/@response").InnerText == "True")
            {
                XmlNodeList nodelist = doc.SelectNodes("/root/movie");
                foreach (XmlNode node in nodelist)
                {
                    string poster = node.SelectSingleNode("@poster").InnerText;
                    if (poster == "N/A" || poster == "FAIL")
                    {
                        ImagePoster.ImageUrl = "/Myfiles/default-img.jpg";
                    }
                    else
                    {
                        ImagePoster.ImageUrl = poster;
                    }
                }

                LabelResultTitle.Text = nodelist[0].SelectSingleNode("@title").InnerText;
                LabelResultRating.Text = nodelist[0].SelectSingleNode("@imdbRating").InnerText;
                LabelResultYear.Text = nodelist[0].SelectSingleNode("@year").InnerText;
                LabelResultActors.Text = nodelist[0].SelectSingleNode("@actors").InnerText;
                LabelResultDescription.Text = nodelist[0].SelectSingleNode("@plot").InnerText;
                LabelResultChildRating.Text = nodelist[0].SelectSingleNode("@rated").InnerText;
                MagicPanel.Visible = true;
            }
            else
            {
                MagicPanel.Visible = false;
                LabelMessages.Visible = true;
                LabelMessages.Text = "Movie not found";
                ImagePoster.ImageUrl = "/Myfiles/default-img.jpg";
            }

            //top 10
            LiteralHtmlInjector.Text = FourthProjectLogic.Movie.RenderPosters("Top10","");

            // COMMERCIAL          
            // run the logic for commercial stat tracking - reading and modifying the xml to increment viewcount for the random commercial and passing the commercials id/rowindex/"position"
            int randomcommercialToDisplayPosition = FourthProjectLogic.Commercials.StatTracker();

            DataSet ds = new DataSet();
            ds.ReadXml(MapPath("/xml/commercialsTransformed.xml"));
            rpMyRepeater.DataSource = ds;
            rpMyRepeater.DataBind();

            foreach (RepeaterItem item in rpMyRepeater.Items)
            {
                if (item.ItemIndex != randomcommercialToDisplayPosition)
                {
                    item.Visible = false;
                }
            }
        }
    }
}