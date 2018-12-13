<%@ Page Title="Browse Genres" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Browse.aspx.cs" Inherits="_4thHandin.Browse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT DISTINCT [Genre] FROM [MovieDBList]"></asp:SqlDataSource>

    <div class="row">
        <div class="col-md-12">
            <asp:DropDownList CssClass="btn btn-default dropdown-toggle" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Genre" DataValueField="Genre" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </div>  
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>          
                <div class="col-md-5th-1 col-sm-4">
                    <div class="card card-1">
                        <a href='SingleView.aspx?queryID=<%# Eval ("ID")%>'>
                            <div class="gradient"></div>
                            <asp:Image ID="PosterPath" Height="100%" runat="server" ImageUrl='<%# Eval ("PosterPath")%>' onerror="this.src='../Myfiles/default-img.jpg'" /><!-- alt text omitted due to redundant information-->
                            <br />
                            <span class="text-middle">
                                <asp:Label ID="TitleLabel" CssClass="text-middle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                            </span>
                        </a>
                    </div> 
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>