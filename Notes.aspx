<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Notes.aspx.cs" Inherits="Notes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>留言本</title>
<script language="javascript" type="text/javascript">

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        学生姓名：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
        便笺内容： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <input id="Button1" type="button" value="获取" runat=server onserverclick="Get_ServerClick" style="width: 66px"  />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <input id="Button2" type="button" value="删除" runat=server onserverclick="Del_ServerClick" style="width: 62px"  /><br />
        <textarea id="TextArea1" style="width: 355px; height: 285px" runat="server"></textarea>
        <br />
        <input id="Submit1" type="submit" value="保存" runat=server onserverclick="Submit1_ServerClick" style="width: 72px" />
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <asp:HyperLink ID="HyperLink1" runat="server"></asp:HyperLink></div>
    </form>
</body>
</html>
