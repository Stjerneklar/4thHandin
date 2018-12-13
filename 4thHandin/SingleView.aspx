<%@ Page Title="Movie Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SingleView.aspx.cs" Inherits="_4thHandin.SingleView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container container-spacing">
        <div class="col-md-12 button-box">
            <a class="btn btn-primary-c" href="Default.aspx">
                <i class="icon-chevron-left"></i>Go Back</a>
        </div>
        <div class="col-md-9 card-single-view radius" style="padding: 10px;">

            <div class="col-md-4 col-sm-12 image-poster-box">
                <asp:Image ID="ImagePoster" CssClass="single-view-img-center" runat="server" Height="356px"  AlternateText='Poster for the movie' ImageUrl="~/MyFiles/default-img.png" />
            </div>

            <div class="col-md-8 col-sm-12" style="padding-top:10px;padding-bottom:40px;">

                <asp:Label ID="LabelMessages" runat="server" Text="Result"></asp:Label><br />
                
                <asp:Panel ID="MagicPanel" runat="server"> 
                    <asp:Label ID="LabelResultTitle" CssClass="h1" runat="server" Text="Result"></asp:Label><br />
                    <asp:Label ID="LabelResultRating" CssClass="h1" runat="server" Text="Result"></asp:Label><br />
                    <asp:Label ID="LabelResultChildRating" CssClass="h1" runat="server" Text="Result"></asp:Label><br />
                    <asp:Label ID="LabelResultYear" CssClass="h1" runat="server" Text="Result"></asp:Label><br />
                    <hr />
                    <asp:Label ID="LabelResultActors" runat="server" Text="Result"></asp:Label><br /><br />                
                    <asp:Label ID="LabelResultDescription" runat="server" Text="Result"></asp:Label><br />
                </asp:Panel>
            </div>
        </div>

        <div class="col-md-3 col-sm-12  offset-md-1">
            <asp:repeater id="rpMyRepeater" runat="server">
                <ItemTemplate>
                    <div class="commercial-box radius">
                        <a href="http://<%# Eval("webpage") %>">
                            <img alt="Commercial for <%# Eval("company") %>" style="width:100%" src="../Myfiles/<%# Eval("logo")%>" />
                            <span style="text-align:center">
                                <%# Eval("company") %>
                            </span>
                            <div style="display:none" class="ad-viewcount">
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
            <h1>Top 10 Movies</h1>
            <hr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>

                    <div class="col-md-5th-1 col-sm-4">
                        <div class="card card-1">
                            <a href='SingleView.aspx?queryID=<%# Eval ("ID")%>'>
                                <div class="gradient"></div>

                                <asp:Image ID="Image2" Height="100%" runat="server" ImageUrl='<%# Eval ("PosterPath")%>' onerror="this.src='../Myfiles/default-img.jpg'" />
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