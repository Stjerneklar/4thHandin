using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Net;
using System.Web;
using System.Xml;
using System.Xml.Xsl;

namespace _4thHandin
{
    class FourthProjectLogic
    {
        public static string ConnStr = ConfigurationManager.ConnectionStrings["MovieDBListConnectionString"].ToString();

        //string or int setting current group 

        //object or string array of settings per group

        //dynamic group/design properties brainstorm: bundleconfig path, site title, hell we could run different js from these instead of conditionally running or doing different things

        public class GroupSettings
        {
            public string SiteTitle;
            public GroupSettings(string SiteTitle)    //constructor setting all properties from passed values
            {
                this.SiteTitle = SiteTitle;
            }
        }

        public static GroupSettings InitGroupSettings(){
            GroupSettings Group42 = new GroupSettings("MovieTalk");
            GroupSettings Group62b = new GroupSettings("mTube");
            return Group42;
            //return Group62b;
        }

        public static GroupSettings CurrentGroupSettings = InitGroupSettings();

            public static void SearchMovies(string searchterm) { HttpContext.Current.Response.Redirect("~/search?queryName=" + searchterm); }

        public static string GetJokeFromAPI()
        {
            WebClient client = new WebClient();

            string[] Teachers = { "Torben", "Tue", "Morten", "Jesper" };
            string reply = client.DownloadString("http://api.icndb.com/jokes/random?firstName=" + Teachers[new Random().Next(0, Teachers.Length)]);

            string[] separatingChars = { "\"" };
            string[] mysplit = reply.Split(separatingChars, System.StringSplitOptions.RemoveEmptyEntries);

            if (mysplit[0] != "False"){ return mysplit[11];}
                                 else { return "i dont get it"; };
        }

        public class OmdbAPI
        {
            private static WebClient client = new WebClient();
            private static string OmdbApiToken = "a4036190";

            public static string NameAPI(string name,int year)
            {
                string result = client.DownloadString("http://www.omdbapi.com/?apikey=" + OmdbApiToken + "&r=xml&t=" + name+"&y="+year);
                return result;
            }

            public static string GetPosterUrl(string title,int year)
            {
                string result = OmdbAPI.NameAPI(title,year);
                string poster = "N/A";

                File.WriteAllText(HttpContext.Current.Server.MapPath("~/MyFiles/Latestresult.xml"), result);
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(result);

                if (doc.SelectSingleNode("/root/@response").InnerText == "True")
                {
                    XmlNodeList nodelist = doc.SelectNodes("/root/movie");
                    foreach (XmlNode node in nodelist)
                    {
                        poster = node.SelectSingleNode("@poster").InnerText;
                    }
                }
                return poster;
            }            

            public static string GetImagesFromApi()
            {
                List<Movie> resultdata = Movie.ListMoviesByNoPoster();

                //use a dataset here to avoid doing individual updates?. instead of updating the db we update a dataset and then we do one action with the db synching all the changes
                foreach (Movie movie in resultdata)
                {
                    movie.posterpath = GetPosterUrl(movie.title, movie.year);       //set the loops current movie objects posterpath to the return value of getposterurl method
                    if (movie.posterpath != "N/A")                                  //dont update the database for this movie if we got no url for it
                    {
                    movie.UpdatePoster();           //use the movie objects updateposter method
                    }
                }
                return resultdata.Count.ToString();
            }

        }

        public class Movie
        {
            public static DataAccessLayerTableAdapters.MovieDBListTableAdapter MovieTableAdapter = new DataAccessLayerTableAdapters.MovieDBListTableAdapter();

            public int    id;
            public string title;
            public string genre;
            public int    year;
            public int    viewcount;
            public string posterpath;
            public Movie(int id, string title, string genre, int year, int viewcount, string posterpath)    //constructor setting all properties from passed values
            {
                this.id =         id;
                this.title =      title;
                this.genre =      genre;
                this.year =       year;
                this.viewcount =  viewcount;
                this.posterpath = posterpath;
            }
            
            public Movie(int ID) //constructor via DataSet - essentially the same as searching for movie by id but more sexier
            {
                DataAccessLayer.MovieDBListDataTable movieDBListRows = MovieTableAdapter.GetDataByID(ID);

                this.id = int.Parse(movieDBListRows[0]["ID"].ToString());
                this.title = movieDBListRows[0]["Title"].ToString();
                this.genre = movieDBListRows[0]["Genre"].ToString();
                this.year = int.Parse(movieDBListRows[0]["Year"].ToString());
                this.viewcount = int.Parse(movieDBListRows[0]["Viewcount"].ToString());
                this.posterpath = movieDBListRows[0]["PosterPath"].ToString(); //default "N/A" value set in dataset rather than having it throw an exception on nulls, as was standard
            }

            public override string ToString()
            {
                string output = "That Movie " + this.title + ", i think it was made in " + this.year + " or so... was one of those " + this.genre;
                output += " flicks... folks round here have taken a shine to it " + this.viewcount + " times. you can find its poster at ye olde uniform resource locator " + this.posterpath;
                return output;
            }

            public void IncrementViewcount()
            {
                MovieTableAdapter.Update( this.title, this.genre, this.year, this.viewcount + 1, this.posterpath, this.id, this.id);
            }
            public void UpdatePoster()
            {
                MovieTableAdapter.Update(this.title, this.genre, this.year, this.viewcount, this.posterpath, this.id, this.id);
            }

            private static List<Movie> MovieListLoader(DataAccessLayer.MovieDBListDataTable movieDBListRows)
            {
                var movieList = new List<Movie>();

                foreach (DataAccessLayer.MovieDBListRow row in movieDBListRows)
                {
                    Movie readmovie = new Movie(row.ID, row.Title, row.Genre, row.Year, row.Viewcount, row.PosterPath);
                    movieList.Add(readmovie);
                }
                return movieList;
            }

            public static List<Movie> ListAllMovies()
            {
                DataAccessLayer.MovieDBListDataTable movieDBListRows = MovieTableAdapter.GetData();
                return MovieListLoader(movieDBListRows);
            }

            public static List<Movie> ListMoviesByGenre(string Genre)
            {
                DataAccessLayer.MovieDBListDataTable movieDBListRows = MovieTableAdapter.GetDataByGenre(Genre);  
                return MovieListLoader(movieDBListRows);
            }
            
            public static List<Movie> ListMoviesByNoPoster()
            {
                DataAccessLayer.MovieDBListDataTable movieDBListRows = MovieTableAdapter.GetDataByNotHavingPosterImageUrl();
                return MovieListLoader(movieDBListRows);
            }
            public static List<Movie> ListMoviesByTitle(string Title)
            {
                DataAccessLayer.MovieDBListDataTable movieDBListRows = MovieTableAdapter.GetMovieBySearchTitle(Title);
                return MovieListLoader(movieDBListRows);
            }

            public static List<Movie> ListMoviesTop10()
            {
                DataAccessLayer.MovieDBListDataTable movieDBListRows = MovieTableAdapter.MoviesTop10();
                return MovieListLoader(movieDBListRows);
            }

            public static string RenderPosters(string TypeOfList,string TermIfAny)
            {
                List<Movie> movieList = new List<Movie>();
                switch (TypeOfList)
                {
                    case "Top10":
                        movieList = ListMoviesTop10();
                        break;
                    case "Genre":
                        movieList = ListMoviesByGenre(TermIfAny);
                        break;
                    case "Search":
                        movieList = ListMoviesByTitle(TermIfAny);
                        break;
                }
                string LookMaImmaRepeater = "";
                int whatrowitis = 0;

               

                foreach (Movie M in movieList)
                {
                    string ImageToRender = "/MyFiles/default-img.jpg";
                    if (M.posterpath != "N/A") { ImageToRender = M.posterpath; };
                    
                    if (whatrowitis == 0 | whatrowitis == 5) {     
                        LookMaImmaRepeater += "<div class='col-md-2 col-md-offset-1'>";
                        whatrowitis = 0;
                    } 
                    else {
                        LookMaImmaRepeater += "<div class='col-md-2'>";
                    }
                            LookMaImmaRepeater += "<a href = 'SingleView.aspx?queryID=" + M.id + "'class='poster' style='background-image:url(" + ImageToRender + ")'>";
                                LookMaImmaRepeater += "<span class='card-bottom-year'>" + M.year + "</span>";
                                LookMaImmaRepeater += "<span class='card-bottom-genre'>" + M.genre + "</span>";
                                LookMaImmaRepeater += "<span id='TitleLabel' class='text-middle'>" + M.title + "</span>";
                            LookMaImmaRepeater += "</a>";
                        LookMaImmaRepeater += "</div>";

                    whatrowitis++;
                }

                if (movieList.Count == 1)
                {
                    //redirect to single view if we only get one result
                   HttpContext.Current.Response.Redirect("~/SingleView?queryID=" + movieList[0].id );
                }
                else if (movieList.Count == 0)
                {
                    LookMaImmaRepeater = "No Results for that, sorry!";
                }

                return LookMaImmaRepeater;
            }
        }

        public class Commercials
        {
            // https://www.freeformatter.com/xsl-transformer.html Nice xslt testing       

            // make sure we have the transformed xml, if not then create it
            public static void CheckTransform()
            {
                // do the xslt transformation on the commercials.xml only if we havent done so, or if we deleted it to force a refresh
                if (!File.Exists(HttpContext.Current.Server.MapPath("/xml/commercialsTransformed.xml")))  //might wanna expand this to check if we have rows in commercialsTransformed to make sure we have GOOD xml, not just files.
                {
                    string sourcefile = HttpContext.Current.Server.MapPath("/xml/commercials.xml");
                    string xslfile = HttpContext.Current.Server.MapPath("/xml/commercialsImport.xslt");

                    string destinationfile = HttpContext.Current.Server.MapPath("/xml/commercialsTransformed.xml");

                    FileStream fs = new FileStream(destinationfile, FileMode.Create);
                    XslCompiledTransform xct = new XslCompiledTransform();
                    xct.Load(xslfile);

                    xct.Transform(sourcefile, null, fs);
                    fs.Close();
                }
            }

            //needed for saving since we cant directly do that
            public static void MakeTempXml()
            {
                string sourcefile = HttpContext.Current.Server.MapPath("/xml/commercialsTransformed.xml");
                string xslfile = HttpContext.Current.Server.MapPath("/xml/commercialsCopy.xslt");

                string destinationfile = HttpContext.Current.Server.MapPath("/xml/commercialsTransformedTemp.xml");

                FileStream fs = new FileStream(destinationfile, FileMode.Create);
                XslCompiledTransform xct = new XslCompiledTransform();
                xct.Load(xslfile);
                xct.Transform(sourcefile, null, fs);
                fs.Close();
            }

            //viewcounts for commercials
            public static int StatTracker()
            {
                CheckTransform();

                int randomcommercialToDisplayPosition = new Random().Next(0, 4); //should be a count, otherwise new ones won't be seen

                XsltArgumentList argsList = new XsltArgumentList();
                argsList.AddParam("randomcommercialToDisplayPosition", "", randomcommercialToDisplayPosition);

                string sourcefile = HttpContext.Current.Server.MapPath("/xml/commercialsTransformedTemp.xml");
                string xslfile = HttpContext.Current.Server.MapPath("/xml/commercialsIncrementer.xslt");
                string destinationfile = HttpContext.Current.Server.MapPath("/xml/commercialsTransformed.xml");

                FileStream fs = new FileStream(destinationfile, FileMode.Create);
                XslCompiledTransform xct = new XslCompiledTransform();
                xct.Load(xslfile);
                xct.Transform(sourcefile, argsList, fs);
                fs.Close();

                MakeTempXml();  //keep the temp file updated... updatetemp would probably be a better name 

                return randomcommercialToDisplayPosition;
            }
        }
    }
}