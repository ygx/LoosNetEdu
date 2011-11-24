<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>视频交流</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" --><!-- TemplateEndEditable -->
<style type="text/css"> 
<!-- 
body  {
	font: 100% Verdana, Arial, Helvetica, sans-serif;
	background: #666666;
	margin: 0; /* 最好将 body 元素的边距和填充设置为 0 以覆盖不同的浏览器默认值 */
	padding: 0;
	text-align: center; /* 在 IE 5* 浏览器中，这会将容器居中。文本随后将在 #container 选择器中设置为默认左对齐 */
	color: #000000;
	background-image: url();
}
.thrColAbs #container { 
	position: relative; /* 添加“position: relative”允许您将两个侧栏相对于此容器放置 */
	width: 780px;  /* 使用比最大宽度 (800px) 小 20px 的宽度可显示浏览器界面元素，并避免出现水平滚动条 */
	background: #FFFFFF;
	margin: 0 auto; /* 自动边距（与宽度一起）会将页面居中 */
	border: 1px solid #000000;
	text-align: left; /* 这将覆盖 body 元素上的“text-align: center”。 */
} 

/* 绝对定位侧栏的提示：
1. 必须为绝对定位 (AP) 元素指定顶部边距和侧边距（左边距或右边距）。默认情况下，如果未指定顶部边距，则 AP 元素将紧跟页面源代码中的前一个元素之后出现。这意味着，如果在文档的源代码顺序中，侧栏是 #container 中的第一个元素，那么，即使未提供顶部边距值，侧栏也将出现在 #container 的顶端。但是，如果它们的源代码顺序之后由于任何原因而移动，就需要具有顶部边距值，才能显示在所需的位置。
2. 绝对定位 (AP) 元素已从文档流中去除。这意味着绝对定位元素周围的元素不知道它们是否存在，在占据合理的页面空间时不会考虑它们。因此，如果您确信大部分内容将总是包含在中间的 #mainContent div 中，则只应当将 AP div 用作侧栏。如果任一侧栏中将包含更多的内容，则该侧栏将超出父 div 的底部，此时侧栏会看起来没有被完全包含进来。
3. 如果满足了上述要求，则可以使用绝对定位侧栏来方便地控制文档的源代码顺序。
*/
.thrColAbs #sidebar1 {
	position: absolute;
	top: 0;
	left: 0;
	width: 148px; /* 在符合标准的浏览器中或者在 Internet Explorer 中的标准模式下，此 div 的实际宽度除了包括宽度外，还包括填充和边框 */
	background: #EBEBEB; /* 将显示背景色，其宽度等于栏中内容的长度，*/
	padding: 15px 10px 15px 20px; /* 填充使 div 的内容与边缘保持一定的距离 */
}
.thrColAbs #sidebar2 {
	position: absolute;
	top: 0;
	right: 0;
	width: 160px; /* 在符合标准的浏览器中或者在 Internet Explorer 中的标准模式下，此 div 的实际宽度除了包括宽度外，还包括填充和边框 */
	background: #EBEBEB; /* 将显示背景色，其宽度等于栏中内容的长度，*/
	padding: 15px 10px 15px 20px; /* 填充使 div 的内容与边缘保持一定的距离 */
}
.thrColAbs #mainContent { 
	margin: 0 200px; /* 此 div 元素的左边距和右边距会在页面两侧上创建两个外部栏。无论侧栏 div 中包含多少内容，栏内的空间都将保留。 */
	padding: 0 10px; /* 请记住，填充是 div 方块内部的空间，边距则是 div 方块外部的空间 */
}
.fltrt { /* 此类可用来使页面中的元素向右浮动。浮动元素必须位于页面上要与之相邻的元素之前。 */
	float: right;
	margin-left: 8px;
}
.fltlft { /* 此类可用来使页面上的元素向左浮动 */
	float: left;
	margin-right: 8px;
}
--> 
</style><!--[if IE 5]>
<style type="text/css"> 
/* 将 IE 5* 的 css 方块模型修正放在这个条件注释中 */
.thrColAbs #sidebar1 { width: 180px; }
.thrColAbs #sidebar2 { width: 190px; }
</style>
<![endif]-->
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>

<body class="thrColAbs">

<div id="container">
  
  <div id="mainContent">
<h1>
  <script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','500','height','600','src','Camara','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','Camara' ); //end AC code
  </script>
  <noscript>
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="500" height="600">
    <param name="movie" value="Camara.swf" />
    <param name="quality" value="high" />
    <embed src="Camara.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="500" height="600"></embed>
  </object>
  </noscript>
</h1>
  <!-- end #mainContent --></div>
  <div id="sidebar1">
  <h3>视频交流系统 </h3>
<p>鲁斯网络老师给用户提供了一个视频交流的平台。</p>
    <p>1、用户可以通过摄像头看到自己的影响，并可将其录制为在线视频。</p>
    <p>2、用户可以播放其他用户的共享视频。</p>
    <p>3、可以和其他在线的用户即时通讯（即聊天室平台）。</p>
    <p>注：在信息栏里输入&quot;天王盖地虎&quot;才可以使用录制功能。<br />FMS服务器连接地址为：rtmp://192.168<br />.1.3/smallchat</p>
  <!-- end #sidebar1 --></div>
  <!-- end #container -->
</div>
</body>
</html>
