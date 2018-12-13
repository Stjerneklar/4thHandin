<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoviesByCategory.aspx.cs" Inherits="_4thHandin.MoviesByCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div style="padding:46.46% 0 0 0;position:relative;"><iframe allow="autoplay" src="https://player.vimeo.com/video/305764275?autoplay=1&loop=1&title=0&byline=0&portrait=0" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>
    <div>
            Search movie
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Genre" DataValueField="Genre" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT DISTINCT [Genre] FROM [MovieDBList]"></asp:SqlDataSource>
            
            <br />
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" SelectCommand="SELECT * FROM [MovieDBList] WHERE ([Genre] = @Genre)" ConnectionString="<%$ ConnectionStrings:MovieDBListConnectionString %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Genre" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
            </asp:SqlDataSource>


        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource5">
                <ItemTemplate>
                         

                     <div class="card card-1">
                         <a href='SingleView.aspx?queryID=<%# Eval ("ID")%>'>
                         <div class="gradient"></div>
                    
                    <asp:Image ID="PosterPath" Height="100%" runat="server" ImageUrl='<%# Eval ("PosterPath")%>' onerror="this.src='../Myfiles/default-img.jpg'" />

                             <!--<asp:Image ID="Image1" CssClass="default-pic" Height="100%" runat="server" ImageUrl="../Myfiles/default-img.jpg" />-->
                    <br />
                        <span class="text-middle">
                   <asp:Label ID="TitleLabel" CssClass="text-middle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                            </span>
                        </a>
                         </div> 
                       
                </ItemTemplate>
            </asp:Repeater>

        
           <!-- <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="351px" AllowPaging="True">

                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                        <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                        <asp:ImageField DataImageUrlField="PosterPath" HeaderText="Poster">

                        </asp:ImageField>
                        <asp:TemplateField HeaderText="Link" ></asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </asp:Panel>-->

           <!-- <asp:Panel ID="Panel2" runat="server">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="348px">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                        <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                    </Columns>
                </asp:GridView>
            </asp:Panel> -->



           <!-- <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT * FROM [MovieDBList] WHERE ([Genre] = @Genre)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="Genre" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource> -->





        </div>
</asp:Content>