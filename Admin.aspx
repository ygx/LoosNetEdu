<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <a href="Default.htm"><img src="img\logo3.jpg" alt="返回首页" border="0" /></a>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            DeleteCommand="delete from FileLst where [Url]=@Url" SelectCommand="select * from FileLst"
            UpdateCommand="UPDATE FileLst SET Filnm=@Filnm, Type=@Type, NickNm=@NickNm, Length=@Length&#13;&#10;WHERE [Url]=@Url">
            <DeleteParameters>
                <asp:Parameter Name="Url" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Filnm" />
                <asp:Parameter Name="Url" />
                <asp:Parameter Name="Type" />
                <asp:Parameter Name="NickNm" />
                <asp:Parameter Name="Length" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <span style="font-size: 8pt"></span>
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Smaller" NavigateUrl="~/UpLoad.aspx">返回</asp:HyperLink>
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
                <asp:TemplateField HeaderText="所属用户" SortExpression="NickNm">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("NickNm") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("NickNm") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="长度" SortExpression="Length">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Length") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Length") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="是否共享" SortExpression="Share" FooterText="1为共享，0为私有" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Share") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Share") %>'></asp:Label>
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
      <div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            DeleteCommand="delete from Users where NickNm=@NickNm" SelectCommand="select * from Users"
            UpdateCommand="UPDATE Users SET Qx=@Qx&#13;&#10;WHERE NickNm=@NickNm">
            <DeleteParameters>
                <asp:Parameter Name="NickNm" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="NickNm" />
                <asp:Parameter Name="Qx" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <span style="font-size: 8pt"></span>
        <center>
            &nbsp;所有用户一览表</center>
        
            <br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" DataKeyNames="NickNm"
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2"
            PagerSettings-PreviousPageImageUrl="~/img/pre.gif" PagerSettings-NextPageImageUrl="~/img/next.gif" PagerSettings-Mode="NextPrevious"
            ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" OnRowDeleting="GridView2_RowDeleting" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <FooterStyle BackColor="#CCCC99" />
            <Columns>
                <asp:BoundField DataField="NickNm" HeaderText="用户名" SortExpression="NickNm" ReadOnly="True" />
                <asp:BoundField DataField="Qx" HeaderText="权限" SortExpression="Qx" />
                <asp:BoundField DataField="Psd" HeaderText="Psd" SortExpression="Psd" Visible="False" />
                <asp:CommandField ShowEditButton="True" UpdateImageUrl="~/img/edit.gif" EditImageUrl="~/img/edit.gif" ButtonType="Image" CancelImageUrl="~/img/cancel.gif" />
                <asp:CommandField ShowDeleteButton="True" DeleteImageUrl="~/img/delete.gif" ButtonType="Image" />
            </Columns>
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
          <br />
          &nbsp;</div>
    </form>
</body>
</html>
