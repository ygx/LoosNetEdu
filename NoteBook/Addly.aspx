<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Addly.aspx.cs" Inherits="Addly" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加留言</title>
    
</head>
<body bgcolor="#33ccff">
<h1 align=center><font color=red>欢迎留言！</font></h1>
  
    <form id="form1" runat="server">
        <table align=center style="width: 593px; height: 306px" border="1px" bordercolor="#3300ff" bgcolor="#ccffcc">
           <tr><td width="30%">您的名字：</td>
           <td><asp:Label ID="name0" runat="server"></asp:Label>
               </td>
           </tr> 
            <tr><td width="30%">
            您的Email： &nbsp;<asp:Button ID="no2" runat="server" OnClick="no2_Click" Text="不写" /></td>
            <td>
            <asp:TextBox ID="email0" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入正确的邮件地址！"
              ControlToValidate="email0" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            <tr>
            <td width="30%">您的QQ&nbsp;： &nbsp;
                <asp:Button ID="no3" runat="server" Text="不写" OnClick="no3_Click" /></td>
            <td><asp:TextBox ID="qq0" runat="server"></asp:TextBox>&nbsp;</td>
            </tr>
            <tr>
            <td width="30%"> 您的留言：</td>
            <td><asp:TextBox ID="comment0" runat="server" Rows="5" TextMode="MultiLine" Height="100px" Width="90%"></asp:TextBox></td>
            </tr>
           
            <tr>
            <td colspan="2">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" OnClientClick="return AddData();" OnClick="Button1_Click" Text="留言" />
                &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
           <asp:Button ID="btn2" runat="server" Text="重置" OnClick="btn2_Click" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
           <asp:Button ID="btn3" runat="server" Text="查看所有留言" OnClick="btn3_Click" /></td>
            </tr>
      </table> 
    </form>
   
          
           
           
       
</body>
</html>
