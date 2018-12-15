<%@ Page Language="C#" Title="Search Results" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="_4thHandin.Search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h3><asp:Label ID="label_noresultsmessage" Visible="false" runat="server">No Query Provided, Showing Avengers instead</asp:Label></h3>
        </div>
    </div>
    <div class="row g42repeater">
        <asp:Literal ID="LiteralHtmlInjector" text="" runat="server" /> 
    </div>    
</asp:Content>