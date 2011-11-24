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

public partial class Lo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Typeget = Request.QueryString["type"];   //自毁系统页面从理论上继承登陆页面
        switch (Typeget)
        {
            case "die":  //接受参数，执行功能
                if(Request.Cookies["Usd"]!=null)
                {
                    this.Page.Title = "自毁系统";
                    this.Label1.Text="删除账号";
                    this.Submit2.Value="确认删除";
                    this.userNM.Value = Request.Cookies["Usd"].Value;
                    this.userNM.Disabled = true;        //锁定文本框，避免删除其他用户账号
                    this.DropDownList1.Visible = false;
                    this.td1.Visible = false;

                }
                break;
        }
        string Sourceget = Request.QueryString["from"];
        switch(Sourceget)
        { 
            case "default":
                this.DropDownList1.Items[0].Selected = true;
                this.DropDownList1.Enabled = false;
                break;
            case "upload":
                this.DropDownList1.Items[1].Selected = true;
                break;
            case "file":
                this.DropDownList1.Items[2].Selected = true;
                break;
            case "admin":
                this.DropDownList1.Items[3].Selected = true;
                break;
            case "exam":
                this.DropDownList1.Items[4].Selected = true;
                break;
            case "note":
                this.DropDownList1.Items[5].Selected = true;
                break;
        }
        if (Request.Cookies["Usd"] != null)
            Informo(Request.Cookies["Usd"].Value, Request.Cookies["Qx"].Value);
    }
    protected void Submit2_ServerClick(object sender, EventArgs e)
    {
        users user = new users();  //使用用户操作类（参见App_Code）
        Filels userfile = new Filels();  //使用文件操作类（参见App_Code）
        if (this.Page.Title == "自毁系统")  //自毁系统代码
        {
            if (user.uninstallme(this.userNM.Value, this.userPS1.Value))  //调用类方法，操作数据库删除记录
            {
                Directory.Delete(Server.MapPath("./") + "files\\" + this.userNM.Value, true);  //删除用户文件夹
                userfile.delFileFolder(this.userNM.Value);  //删除数据库的所有记录
                Response.Write("<script>alert('删除成功！');</script>");
                Response.Write("<SCRIPT>window.location.href=\"UpLoad.aspx?type=shut\"</SCRIPT>");
                Response.Redirect("UpLoad.aspx?type=shut");
            }
        }
        else
        {
            if (user.loornot(this.userNM.Value, this.userPS1.Value))        //用户登陆代码
            {
                int qx = user.getqx(this.userNM.Value);     //获取用户权限
                Ck(this.userNM.Value, qx);      //生成cookie
                Response.Write("<script>alert('登陆成功！');</script>");
                switch (this.DropDownList1.Text)  //登陆目的下拉菜单
                {
                    case "首页":
  //                      Response.Write("<SCRIPT>window.location.href=\"Default.htm\"</SCRIPT>");
                        this.logon1.Visible = false;
                        Informo(Request.Cookies["Usd"].Value, Request.Cookies["Qx"].Value);
                        break;
                    case "上传页":
                        Response.Write("<SCRIPT>window.location.href=\"UpLoad.aspx\"</SCRIPT>");
                        break;
                    case "文件列表":
                        Response.Write("<SCRIPT>window.location.href=\"Files.aspx\"</SCRIPT>");
                        break;
                    case "管理页":
                        Response.Write("<SCRIPT>window.location.href=\"Admin.aspx\"</SCRIPT>");
                        break;
                    case "考试页":
                        Response.Write("<SCRIPT>window.location.href=\"Exam.aspx\"</SCRIPT>");
                        break;
                    case "留言板":
                        Response.Write("<SCRIPT>window.location.href=\"NoteBook/Welcome.aspx\"</SCRIPT>");
                        break;
                }
            }
            else 
            {
                Response.Write("<script>alert('用户名或密码错误！');</script>");
            }
        }
        
    }
    protected void ButBk_Click(object sender, EventArgs e)
    {
        userNM.Value = "";
       userPS1.Value = "";
    }
    protected void Ck(string namek, int qx)
    {
        HttpCookie myCoo = new HttpCookie("Usd");
        myCoo.Value = namek;
        Response.Cookies.Add(myCoo);
        myCoo = new HttpCookie("Qx");
        myCoo.Value = qx.ToString();
        Response.Cookies.Add(myCoo);
    }
    protected void Informo(string usd, string qx)
    {
        string qxnote="游客";
        this.informat.Text = "您好，" + usd;
        switch (qx)
        {
          case "0":
            qxnote = "管理员"; break;
          case "1":
            qxnote = "学生用户"; break;
          case "2":
            qxnote = "教师用户"; break;
        }
        this.informatqx.Text = "您是" + qxnote;
        this.informat.Visible = true;
        this.informatqx.Visible = true;
        this.HyperLink1.Visible = true;
        this.logon1.Visible = false;
    }
}
