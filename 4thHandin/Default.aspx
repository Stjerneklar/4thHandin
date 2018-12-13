<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_4thHandin._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12 middle-logo">
        <img src="img/mtube.png" alt="Mtube" />
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
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="col-md-5th-1 col-sm-4">
                        <div class="card card-1">
                            <a href='SingleView.aspx?queryID=<%# Eval ("ID")%>'>
                                <div class="gradient"></div>
                                <asp:Image ID="Image2" Height="100%" runat="server" ImageUrl='<%# Eval ("PosterPath")%>' onerror="this.src='../Myfiles/default-img.jpg'" /><!-- alt text omitted due to redundant information  -->
                                <label class="card-bottom-year"><%# Eval("Year") %></label>
                                <label class="card-bottom-genre"><%# Eval("Genre") %></label>
                                <span class="text-middle">
                                    <asp:Label ID="TitleLabel" CssClass="text-middle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                </span>
                            </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>