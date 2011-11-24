<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <table border="1" style="border-collapse: collapse" bordercolor="Teal" align="center" width="505" height="34">
    <tr>
      <td valign="middle" align="center" bgcolor="Teal" colspan="2" width="505" height="85">
        <font style="color:White;background-color:Teal;font-family:华文行楷;font-size:X-Large;font-weight:bold;">欢迎访问"令狐冲"的留言簿！</font>
      </td>
    </tr>
    <tr>
      <td width="505" height="26" align="left" colspan="2"></td>
    </tr>
    <xsl:for-each select="//guest">
      <xsl:apply-templates select="name"/>
    </xsl:for-each>
    <tr>
      <td valign="middle" align="center" colspan="2" width="505">
       
      </td>
    </tr>
  </table>
</xsl:template>
<xsl:template match="name">
  <tr>
    <td width="95" height="26" align="right">
      <font>用户名：</font>
    </td>
    <td width="400" height="26" valign="middle" align="left">
      <font>
        <xsl:value-of select='.'/>
      </font>
    </td>
  </tr>
  <tr>
    <td width="95" height="26" align="right" bgcolor="e0e0e0">
      <font>Email地址：</font>
    </td>
    <td width="400" height="26" valign="middle" align="left" bgcolor="#e0e0e0">
      <font>
        <a HREF="mailto:{../email}">
          <xsl:apply-templates select="../email"/>
        </a>
      </font>
    </td>
  </tr>
  <tr>
    <td width="95" height="26" align="right">
      <font>QQ号码：</font>
    </td>
    <td width="400" height="26" valign="middle" align="left">
      <font>
        <xsl:apply-templates select="../qq"/>
      </font>
    </td>
  </tr>
  <tr>
    <td width="95" height="26" align="right" bgcolor="#e0e0e0">
      <font>个人主页：</font>
    </td>
    <td width="400" height="26" valign="middle" align="left" bgcolor="#e0e0e0">
      <font>
        <a HREF="http://{../homepage}" target="_blank">
          <xsl:apply-templates select="../homepage"/>
        </a>
      </font>
    </td>
  </tr>
  <tr>
    <td width="95" height="26" valign="top" align="right">
      <font>留言信息：</font>
    </td>
    <td width="400" height="26" valign="top" align="left">
      <font>
        <xsl:apply-templates select="../comment"/>
      </font>
    </td>
  </tr>
  <tr>
    <td width="505" height="26" align="left" colspan="2"></td>
  </tr>
</xsl:template>

</xsl:stylesheet> 

