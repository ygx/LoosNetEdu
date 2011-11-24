<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewGuestBook.aspx.cs" Inherits="ViewGuestBook" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>留言交流系统</title>
</head>
<body bgcolor="#ffccff">
    <form id="form1" runat="server">
       <h1 align=center><asp:Button ID="btn_ok" runat="server" OnClick="btn_ok_Click" Text="给我留言" />&nbsp;
           <font color="#ff0066">师生留言交流系统&nbsp; </font><asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
            Text="重新登录" /></h1><br />
                <asp:Repeater ID="Repeater1" runat="server">
                      <ItemTemplate>
                          <table width="80%" height="50" align=center border="1px" bordercolor="black" bgcolor=#afeeee>
                            <tr>
                              <td width="25%">姓名：</td>
                              <td><%# Eval("name") %></td>
                            </tr>
                            <tr>
                             <td width="25%">Email：</td>
                            <td> <%# Eval("email")%></td>
                              </tr>
                             <tr>
                               <td width="25%">QQ：</td>
                               <td><%# Eval("qq")%></td> 
                             </tr>
                            <tr>
                              <td width="25%">内容：</td> 
                              <td><%# Eval("comment")%></td> 
                            </tr>
                             <tr>
                              <td width="25%">留言时间：</td>
                              <td><%# Eval("datatime") %></td>
                            </tr>
                             <tr>
                             <td width="25%">老师回复：</td>
                            <td> <%# Eval("back")%></td>
                              </tr>
                              
                             </table><br />
                             <center><a href="back.aspx?Xid=<%# Eval("id")%>">回复该留言</a></center>
                             <center><a href="del.aspx?Xid=<%# Eval("id")%>">删除该留言</a></center>
                             <br />
                            
                          </ItemTemplate>  
                </asp:Repeater>
             
            <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        
       
    </form>
</body>
</html>
