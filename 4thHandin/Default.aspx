<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_4thHandin._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12 middle-logo">
        <img src="img/FilmwalkBigPosterBg.jpg" alt="Filmwalk" />
    </div> 
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
            <div class="input-group">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="searchtxt form-control sizing-addon1"></asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button ID="Button1" runat="server" Text="Search" OnClick="ButtonSearch_Click" CssClass="buttonsearch btn btn-primary-c btn-outline-secondary top-search-button" />
                </span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h1>Top 10 Movies</h1>
            <hr>
        </div>
    </div>
    <asp:Label ID="LabelThatIsActuallyAnHtmlInjector" Text="" runat="server" />
</asp:Content>