<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_4thHandin._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>This is the 4th handin home page!</h1>
        <p class="lead"></p>
        <p><a href="#" class="btn btn-primary btn-lg">Click Hir 4 To Win&laquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-12">
            
        </div>
    </div>
    <div id="wrapper" style="padding:46.46% 0 0 0;position:relative;"><iframe id="myVideo" src="https://player.vimeo.com/video/305764275?autoplay=1&loop=1&title=0&byline=0&portrait=0" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" webkitallowfullscreen mozallowfullscreen  allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>
    

    <div class="row">
        <div class="col-md-12">
            
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                         

                     <div class="card card-1">
                         <a href='SingleView.aspx?queryID=<%# Eval ("ID")%>'>
                         <div class="gradient"></div>
                    
                    <asp:Image ID="Image2" Height="100%" runat="server" ImageUrl='<%# Eval ("PosterPath")%>' />
                    <br />
                        <span class="text-middle">
                   <asp:Label ID="TitleLabel" CssClass="text-middle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                            </span>
                        </a>
                         </div> 
                       
                </ItemTemplate>
            </asp:Repeater>
                                             


<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBListConnectionString %>" SelectCommand="SELECT TOP 10 [ID], [PosterPath], [Title] FROM [MovieDBList] ORDER BY ViewCount DESC, Year DESC"></asp:SqlDataSource>           

            <asp:GridView ID="GridViewDisplayTopMovies" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                    <asp:BoundField DataField="ViewCount" HeaderText="ViewCount" SortExpression="ViewCount" />
                    <asp:ImageField DataImageUrlField="PosterPath" HeaderText="PosterPath">
                    </asp:ImageField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ></asp:SqlDataSource>

        </div>
    </div>








</asp:Content>





