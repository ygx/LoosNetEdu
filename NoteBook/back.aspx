<%@ Page Language="C#" AutoEventWireup="true" CodeFile="back.aspx.cs" Inherits="admin_back" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        教师回复：<asp:TextBox ID="back" runat="server" Rows="10" TextMode="MultiLine"></asp:TextBox><br />
        教师签名：<asp:TextBox ID="qianming" runat="server"></asp:TextBox><br />
        <br />
        <asp:Button ID="btnback" runat="server" OnClick="btnback_Click" Text="回复留言" />
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
        <asp:Button ID="btncz" runat="server" OnClick="btncz_Click" Text="重置" /></div>
    </form>
</body>
</html>
