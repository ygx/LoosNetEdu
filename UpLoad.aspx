<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="UpLoad.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>作业上传页</title>
    <script src="\App_Data\dragdiv.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">		
		function addFile()
        {		
            var filebutton = '<br><input type="file" size="50" name="File" />';
            document.getElementById('FileList').insertAdjacentHTML("beforeEnd",filebutton);
        }
	</script>
</head>
<body>
    <span style="font-size: 9pt"><span style="font-size: 10pt">
        <a href="Default.htm" target=_parent>返回首页</a>
        <asp:HyperLink ID="HyperLink_l" runat="server" NavigateUrl="~/UpLoad.aspx?type=logon">登陆</asp:HyperLink></span> 
        <asp:HyperLink ID="HyperLink_r" runat="server" NavigateUrl="~/UpLoad.aspx?type=reg">注册</asp:HyperLink>&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
        <asp:HyperLink ID="HyperLink_f" runat="server" NavigateUrl="~/UpLoad.aspx?type=list">文件列表</asp:HyperLink></span><form id="form1" runat="server">
       <center>
	<p id="FileList">
          <input type="file" id="File1" runat="server" size="50" />
          <input id="Submit1" type="submit" value="上传" runat="server" onserverclick="Submit1_ServerClick"  /><br />
          <input type="radio" id="Radio1" value="初次" runat="server" checked="true" name="Type1" />初次
          <input type="radio" id="Radio2" value="返工" runat="server" name="Type1" />返工
          <input type="radio" id="Radio3" value="已阅" runat="server" name="Type1" disabled="true" />已阅</p>
      </center>
    </form>
<div id="page-body" style="width: 100%; margin-top: 30px;">
       <span id="rec" runat="server">
        <br />
       </span>
    <center>
      <asp:Label id="StatusMsg" runat="server" ForeColor="Red" Width="100%" Visible="False"></asp:Label>
      <a href="UpLoad.aspx?type=list"><img src="img\logo.jpg" alt="转入文件列表" border="0" /></a>
      <p style="color: #666; margin: 10px 0px 0px;"></p>
    </center>
</div>
<!--   <font size="3">联系站长：</font><a href="http://wpa.qq.com/msgrd?V=1&Uin=402446138&Exe=QQ&Menu=No"><img src="img/Q.gif" alt="有问题，QQ一下~" border="0" /></a>
-->
</body>
</html>
