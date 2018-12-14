<%@ Page Language="C#" Title="Search Results" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="_4thHandin.Search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2><asp:Label ID="label_noresultsmessage" Visible="false" runat="server"></asp:Label></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12"><asp:Label ID="LabelThatIsActuallyAnHtmlInjector" Text="" runat="server" /></div>
    </div>           
</asp:Content>