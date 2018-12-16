<%@ Page Title="Movie Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SingleView.aspx.cs" Inherits="_4thHandin.SingleView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12 button-box">
            <a class="btn btn-primary-c" href="Default.aspx">
                <i class="icon-chevron-left"></i>Go Back</a>
        </div>
    </div>
    <div class="row">
       <div class="col-md-8 col-md-offset-1 card-single-view">
           <div class="col-md-4 col-sm-12 image-poster-box">
                <asp:Image ID="ImagePoster" CssClass="single-view-img-center" runat="server"  AlternateText='Poster for the movie' ImageUrl="~/MyFiles/default-img.png" />
            </div>

            <div class="col-md-8 col-sm-12">
                <p><asp:Label ID="LabelMessages" Visible="false" runat="server" Text="Result"></asp:Label></p>
                <asp:Panel ID="MagicPanel" runat="server"> 
                    <h1>
                        <asp:Label ID="LabelResultTitle" runat="server" Text="Result"></asp:Label>
                    </h1>
                    <p><asp:Label ID="LabelResultYear" runat="server" Text="Result"></asp:Label> Rated <asp:Label ID="LabelResultChildRating" runat="server" Text="Result"></asp:Label>  </p>
                    <p><span>IMDB rating: </span><asp:Label ID="LabelResultRating" runat="server" Text="Result"></asp:Label></p>
                    <p><span>starring: </span><asp:Label ID="LabelResultActors" runat="server" Text="Result"></asp:Label></p>
                    <p><em><asp:Label ID="LabelResultDescription" runat="server" Text="Result"></asp:Label></em></p>
                </asp:Panel>
            </div>
        </div>

        <div class="col-md-2 col-sm-12 ">
            <asp:repeater id="rpMyRepeater" runat="server">
                <ItemTemplate>
                    <div class="commercial-box">
                        <a href="http://<%# Eval("webpage") %>">
                            <img alt="Commercial for <%# Eval("company") %>" src="../Myfiles/<%# Eval("logo")%>" />
                            <span>
                                <%# Eval("company") %>
                            </span>
                            <div class="ad-viewcount">
                                <%# Eval("viewcount") %>
                            </div>
                        </a>
                        </div>
                </ItemTemplate>
            </asp:repeater>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h3>Top Movies</h3>
            <hr>
        </div>
    </div>
    <div class="row g42repeater">
        <asp:Literal ID="LiteralHtmlInjector" text="" runat="server" /> 
    </div>




</asp:Content>