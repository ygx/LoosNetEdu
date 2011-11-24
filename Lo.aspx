<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lo.aspx.cs" Inherits="Lo" %>

<html>
<head runat="server">
    <title>登陆页</title>
</head>
<body>
    <asp:Label ID="informat" runat="server" Text="" Visible="false"></asp:Label><br />
    <asp:Label ID="informatqx" runat="server" Text="" Visible="false"></asp:Label>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UpLoad.aspx?type=shut2" Visible="false">注销登陆</asp:HyperLink>
    <form id="logon1" runat="server">
    <div>
       <table style="width: 281px; height: 114px">
            <caption>
                <asp:Label ID="Label1" runat="server" Text="用户登录"></asp:Label></caption>
            <tr>
                <td style="width: 181px">
                    用户名</td>
                <td>
                    <input id="userNM" type="text" runat="server" style="width: 152px"  /></td>
            </tr>
            <tr>
                <td style="width: 181px">
                    密码</td>
                <td>
                    <input id="userPS1" style="width: 152px" type="password" runat="server" /></td>
            </tr>
           <tr>
                <td style="width: 181px">
                    <asp:Label ID="td1" runat="server" Text="登录到"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="136px">
                        <asp:ListItem>首页</asp:ListItem>
                        <asp:ListItem>上传页</asp:ListItem>
                        <asp:ListItem>文件列表</asp:ListItem>
                        <asp:ListItem>管理页</asp:ListItem>
                        <asp:ListItem>考试页</asp:ListItem>
                        <asp:ListItem>留言板</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2" rowspan="1" style="height: 24px">
                    &nbsp;<input id="Submit2" type="submit" value="提交" style="left: 30%; position: relative; top: 0px" runat="server" onserverclick="Submit2_ServerClick" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp;&nbsp;<asp:Button id="ButBk" runat="server" Text="重置" OnClick="ButBk_Click"></asp:Button>
                    </td>
            </tr>
        </table>
        <asp:HyperLink ID="HyperLink_r" runat="server" NavigateUrl="~/UpLoad.aspx?type=reg">新用户注册</asp:HyperLink>&nbsp; &nbsp; &nbsp;
    <a href="Mission.htm">领取任务</a>
      </div>
    </form>
</body>
</html>
