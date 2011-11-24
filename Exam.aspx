<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exam.aspx.cs" Inherits="Exam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>在线考试系统</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: left">
        <br />
        请选择考试科目<br />
        <br />
        姓名：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
        科目：<asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList><br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" />
        <br />
        <br />
        <br />
        </div>
    </form>
</body>
</html>
