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
using System.Data.SqlClient;

public partial class Reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Usd"] != null)     //防止已登录用户注册
        {
            Response.Redirect("UpLoad.aspx");
        }
    }
    protected void Submit2_ServerClick(object sender, EventArgs e)
    {
        int myQx = 1;  //一般情况下用户只能注册普通用户（学生）
        users user = new users();  //使用用户操作类（参见App_Code）
        if (user.checkUserName(this.txtUserName.Text))   //检查重名
        {
            Response.Write("<script>alert('此用户已经存在！');</script>");
        }
        else
        {
            if (this.txtVisit.Text == "我是老师")     //教师用户验证注册
            {
                myQx = 2;
            }
            if (user.insertUsers(this.txtUserName.Text, this.txtUserPwd.Text,myQx))   //调用方法，添加一条记录
            {

                DirectoryInfo di;
                di = Directory.CreateDirectory(Server.MapPath("./") + "files\\" + this.txtUserName.Text);   //建立用户文件夹
                File.CreateText(Server.MapPath("./") + "files\\" + this.txtUserName.Text + "\\note.txt");
                Ck(this.txtUserName.Text,myQx);  //建立cookie
                Response.Write("<script>alert('新用户注册成功！');</script>");
                Response.Write("<SCRIPT>window.location.href=\"Lo.aspx\"</SCRIPT>");
            }
        }
    }
    protected void Ck(string namek,int qx)
    {
        HttpCookie myCoo = new HttpCookie("Usd"); //用户名字段
        myCoo.Value = namek;
        Response.Cookies.Add(myCoo);
        myCoo = new HttpCookie("Qx");   //权限字段
        myCoo.Value = qx.ToString();
        Response.Cookies.Add(myCoo);
    }
}
