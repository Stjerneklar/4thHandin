<%@ Page Language="C#" Title="Search Results" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="_4thHandin.Search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
            <div class="col-md-12">
                <h2><asp:Label ID="label_noresultsmessage" Visible="false" runat="server">No Results for that, sorry!</asp:Label></h2>
            </div>
        </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="col-md-5th-1 col-sm-4">
                        <div class="card card-1">
                            <a href='/SingleView.aspx?queryID=<%# Eval ("ID")%>'>
                                <div class="gradient"></div>
                                <asp:Image ID="Image2" Height="100%" runat="server" ImageUrl='<%# Eval ("PosterPath")%>' onerror="this.src='../Myfiles/default-img.jpg'"/><!-- alt text omitted due to redundant information-->
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