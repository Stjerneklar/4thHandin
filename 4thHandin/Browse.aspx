<%@ Page Title="Browse Genres" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Browse.aspx.cs" Inherits="_4thHandin.Browse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT DISTINCT [Genre] FROM [MovieDBList]"></asp:SqlDataSource>

    <div class="row">
        <div class="col-md-12">
            <asp:DropDownList CssClass="btn btn-default dropdown-toggle" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Genre" DataValueField="Genre" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </div>  
        <asp:Label ID="LabelThatIsActuallyAnHtmlInjector" Text="" runat="server" />
    </div>
</asp:Content>