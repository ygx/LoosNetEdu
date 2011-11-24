<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teacher.aspx.cs" Inherits="teacher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>教师页</title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            DeleteCommand="delete from FileLst where [Url]=@Url" SelectCommand="SELECT TOP 100 PERCENT dbo.Users.NickNm, dbo.FileLst.Filnm, dbo.FileLst.Url, dbo.FileLst.Type, dbo.FileLst.Cls, dbo.FileLst.Truenm FROM dbo.FileLst INNER JOIN dbo.Users ON dbo.FileLst.NickNm = dbo.Users.NickNm AND dbo.FileLst.NickNm = dbo.Users.NickNm WHERE (dbo.Users.Qx = 1)"
            UpdateCommand="UPDATE FileLst SET NickNm=@NickNm, Filnm=@Filnm, Type=@Type, Cls=@Cls&#13;&#10;WHERE [Url]=@Url">
            <DeleteParameters>
                <asp:Parameter Name="Url" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="NickNm" />
                <asp:Parameter Name="Filnm" />
                <asp:Parameter Name="Url" />
                <asp:Parameter Name="Type" />
                <asp:Parameter Name="Cls" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <span style="font-size: 8pt"></span>
        <a href="Default.htm" target=_parent>返回首页</a>
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Smaller" NavigateUrl="~/UpLoad.aspx">返回上传页</asp:HyperLink>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Smaller"></asp:Label><br />
        <center>
            &nbsp;所有文件一览表</center>
        
            <br />
        <asp:GridView ID="GridView0" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1"
            PagerSettings-PreviousPageImageUrl="~/img/pre.gif" PagerSettings-NextPageImageUrl="~/img/next.gif" PagerSettings-Mode="NextPrevious"
            ForeColor="#333333" GridLines="None" HorizontalAlign="Center" PageSize="15" DataKeyNames="Url" OnRowDeleting="GridView0_RowDeleting">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="Truenm" HeaderText="Truenm" SortExpression="Truenm" Visible="False" />
                <asp:TemplateField HeaderText="所属用户" SortExpression="NickNm">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("NickNm") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("NickNm") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="名称" SortExpression="Filnm">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Filnm") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Filnm") %>'></asp:Label>
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
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="上传标识" SortExpression="Length">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Cls") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cls") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" UpdateImageUrl="~/img/edit.gif" EditImageUrl="~/img/edit.gif" ButtonType="Image" CancelImageUrl="~/img/cancel.gif" />
                <asp:CommandField ShowDeleteButton="True" DeleteImageUrl="~/img/delete.gif" ButtonType="Image" />
            </Columns>
            <RowStyle BackColor="#E3EAEB" />
            <EditRowStyle BackColor="#7C6F57" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
      </div><br /><br />
        注：上传标识为1是初次作业，为2是返工作业。
    </form>
</body>
</html>
