<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="Reg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>注册页</title>
</head>
<body>
<!--     <a href="Default.htm"><img src="img\logo2.jpg" alt="返回首页" border="0" /></a>   -->
    <form id="reg1" runat="server">
    <div>
       <table style="width: 326px; height: 114px">
            <caption>用户注册信息</caption>
            <tr>
                <td>
                    用户名：</td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" Width="122px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                        Display="Dynamic" ErrorMessage="用户名必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    密码：</td>
                <td>
                    <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password" Width="123px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserPwd"
                        Display="Dynamic" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    确认密码：</td>
                <td>
                    <asp:TextBox ID="txtUserRePwd" runat="server" TextMode="Password" Width="122px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserRePwd"
                        Display="Dynamic" ErrorMessage="确认密码不能为空"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtUserPwd"
                        ControlToValidate="txtUserRePwd" Display="Dynamic" ErrorMessage="两次输入密码不同"></asp:CompareValidator></td>
            </tr>
           <tr>
                <td>
                    教师验证码：</td>
                <td>
                    <asp:TextBox ID="txtVisit" runat="server" Width="121px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td colspan="2" rowspan="1" style="height: 24px">
                    &nbsp;<input id="Submit2" type="submit" value="提交" style="left: 30%; position: relative; top: 0px" runat="server" onserverclick="Submit2_ServerClick" />
                    <input id="Reset1" style="align: center; left: 30%; position: relative; top: 0px;" type="reset" value="重置" />
                    <br />
              <!--      <span style="font-size: 8pt"><a href="UpLoad.aspx">返回</a></span>    -->
                    </td>
            </tr>
        </table>
    
    </div>
 </form>
</body>
</html>
