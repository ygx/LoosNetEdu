<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Beginexam.aspx.cs" Inherits="Beginexam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>考试进行时</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        课程：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        姓名：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><br />
        <br />
        <table style="width: 733px; height: 356px">
            <tr>
                <td colspan="3" style="height: 46px">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="Button1" runat="server" Text="交卷" OnClick="Button1_Click" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
