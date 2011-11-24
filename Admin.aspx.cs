using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Qx"] != null)  //判断权限cookie是否无值
        {
            if (Request.Cookies["Qx"].Value != "0")  //超级管理员才能访问此页面，非授权用户警告提示
            {
                Response.Write("<script>alert('对不起，您没有权限访问此页面！');</script>");
                Page.Visible = false;       //隐藏页面内容
                Response.Write("<a href=\"UpLoad.aspx\">首页</a>");
                Response.Write("<script>alert('请单击后退按钮返回上一页！');</script>");
            }
        }
        else
        {
            Response.Redirect("UpLoad.aspx");
        }
    }
    protected void GridView0_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string usek = e.Values["NickNm"].ToString();   //取得文件所有者用户名
            string finm = e.Values["Filnm"].ToString();   //取得文件名
            File.Delete(Server.MapPath("./") + "files\\" + usek + "\\" + finm);  //删除文件
        }
        catch
        { e.Cancel = true; }//操作失败后终止后续步骤
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Filels userfile = new Filels();
        try
        { 
            string usek = e.Keys["NickNm"].ToString().Trim();     //取得用户名
            Directory.Delete(Server.MapPath("./") + "files\\" + usek, true);    //删除用户文件夹
            userfile.delFileFolder(usek);       //清理数据库中用户文件的记录
            if (usek == "sa")
            {
                Directory.CreateDirectory(Server.MapPath("./") + "files\\" + usek);
                e.Cancel = true;
            }
        }
        catch
        { e.Cancel = true; }
    }
}
