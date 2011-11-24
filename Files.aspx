<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Files.aspx.cs" Inherits="Files" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>文件清单</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            DeleteCommand="delete from FileLst where Url=@Url" SelectCommand="ShowFile" SelectCommandType="StoredProcedure"
            UpdateCommand="Fileupdt" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Url" />
            </DeleteParameters>
            <SelectParameters>
                <asp:CookieParameter CookieName="Usd" DefaultValue="sa" Name="NickNm" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Filnm" />
                <asp:Parameter Name="Type" />
                <asp:Parameter Name="Share" />
                <asp:Parameter Name="Url" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <span style="font-size: 8pt"></span>
        <a href="Default.htm" target=_parent>返回首页</a>
        <asp:HyperLink ID="HyperLink_x" runat="server" Font-Size="Smaller" NavigateUrl="~/UpLoad.aspx">返回上传页</asp:HyperLink>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Smaller"></asp:Label><br />
        <center><asp:Label ID="Label1" runat="server" Text="sa (公共用户)"></asp:Label>
        的文件一览表</center>
        
            <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
            PagerSettings-PreviousPageImageUrl="~/img/pre.gif" PagerSettings-NextPageImageUrl="~/img/next.gif" PagerSettings-Mode="NextPrevious"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Url" DataSourceID="SqlDataSource1"
            ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowDeleting="GridView1_RowDeleting">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="Truenm" HeaderText="Truenm" SortExpression="Truenm" Visible="False" />
                <asp:TemplateField HeaderText="名称" SortExpression="Filnm">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filnm") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Filnm") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="下载链接" SortExpression="Url">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Url", "{0}") %>'
                            Text='<%# Eval("Truenm") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类型" SortExpression="Type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="大小" ShowHeader="False" SortExpression="Length">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Length") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Length") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="是否共享" SortExpression="Share" FooterText="1为共享，0为私有">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Share") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Share") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" UpdateImageUrl="~/img/edit.gif" EditImageUrl="~/img/edit.gif" ButtonType="Image" CancelImageUrl="~/img/cancel.gif" />
                <asp:CommandField ShowDeleteButton="True" DeleteImageUrl="~/img/delete.gif" ButtonType="Image" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br /></div>
    <center>
        浏览<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="NickNm" DataValueField="NickNm" CausesValidation="True">
        </asp:DropDownList>
            的<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">共享文件</asp:LinkButton></center>
        <center>
            &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/upload.jpg"
                OnClick="ImageButton1_Click" /></center>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
    </form>
</body>
</html>
