<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Grad.aspx.cs" Inherits="grad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>查看成绩</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp; &nbsp;
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;
<!--        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>-->
        <br />
        <br />
        &nbsp;<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
            <EditRowStyle BackColor="#7C6F57" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
