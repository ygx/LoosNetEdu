using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.IO;
using System.Net;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    private static string Nick;
    protected void Page_Load(object sender, EventArgs e)
    {
        //页面获取到的参数处理
        string Typeget = Request.QueryString["type"];
        switch (Typeget)
        {
            case "reg":  //注册请求
                Response.Redirect("Reg.aspx");
                break;
            case "logon":  //登陆请求
                //     Response.Write("<SCRIPT>window.open('Lo.aspx', 'Sample', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width=425,height=320,left=0,top=0')</SCRIPT>");
                Response.Redirect("Lo.aspx?from=upload");
                break;
            case "shut":  //注销请求
                if (Request.Cookies["Usd"] != null)
                {
                    HttpCookie cooki = Request.Cookies["Usd"];
                    cooki.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(cooki);        //清除Cookie
                    Response.Redirect(Request.Url.ToString());  //页面自刷新
                }
                break;
            case "shut2": //从首页注销
                if (Request.Cookies["Usd"] != null)
                {
                    HttpCookie cooki = Request.Cookies["Usd"];
                    cooki.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(cooki);        //清除Cookie
                    Response.Redirect("Lo.aspx");
                }
                break;
            case "shut3": //从留言板注销
                if (Request.Cookies["Usd"] != null)
                {
                    HttpCookie cooki = Request.Cookies["Usd"];
                    cooki.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(cooki);        //清除Cookie
                }
                Response.Redirect("Lo.aspx?from=note");
                break;
            case "die":   //删除账户请求
                Response.Redirect("Lo.aspx?type=die");
                break;
            case "list":  //文件列表请求
                Response.Redirect("Files.aspx");
                break;
        }
        //Cookie判断
        if (Request.Cookies["Usd"] != null) //用户名字段不能为null
        {
            Nick = Request.Cookies["Usd"].Value;   //获取到用户名
            this.HyperLink_l.Text = "注销";         //已登录，改“登陆”为“注销”
            this.HyperLink_l.NavigateUrl = "~/UpLoad.aspx?type=shut";  //注销链接
            string qxsm;    //权限描述
            switch (Request.Cookies["Qx"].Value)    //获取权限
            {
                case "0":
                    this.HyperLink_r.Text = "管理";     //管理员登陆，将“注册”改为“管理”
                    this.HyperLink_r.NavigateUrl = "~/admin.aspx";
//                    rec.InnerHtml += HttpContext.Current.Request.Url.Host;
//                    rec.InnerHtml += Request.ServerVariables["Local_Addr"];
                    qxsm = "超级管理员"; break;
                case "1":
                    this.HyperLink_r.Text = "删除账号";   //会员登陆，将“注册”改为“删除账号”
                    this.HyperLink_r.NavigateUrl = "~/UpLoad.aspx?type=die";
                    qxsm = "普通用户"; break;
                case "2":
                    this.HyperLink_r.Text = "查看作业";
                    this.HyperLink_r.NavigateUrl = "~/Teacher.aspx";
                    this.Radio2.Disabled = true;
                    this.Radio3.Disabled = false;
                    this.Radio3.Checked = true;
                    qxsm = "教师用户"; break;
                default:
                    qxsm = "游客"; break;
            }
            this.Label1.Text = "欢迎您：" + Nick + "。 您是" + qxsm;    //欢迎信息
        }
        else
        {
            Nick = "sa";        //如果没有cookie的记录，用公共账户sa登陆
        }

    }

    protected void Submit1_ServerClick(object sender, EventArgs e)
    {

        string filename1;   //定义文件显示名称（不一定是文件名，不能重复）
        string filepath = File1.PostedFile.FileName; //获取路径字符串
        if (filepath == "")  //如果没有选择文件就点击了上传按钮
        {
            Session.Abandon();     //取消操作，刷新页面
            Response.Redirect("./UpLoad.aspx");
        }

        string[] namearr = filepath.Split('\\');  //用斜杠分离数组元素
        string filename = namearr[namearr.Length - 1];  //定义文件名为数组的最后一个元素
        string savedirectory = Server.MapPath(".\\files\\" + Nick + "\\");  //服务器保存相对路径
        string localipadd = "http://" + Request.ServerVariables["Local_Addr"] + "/files/" + Nick + "/";  //服务器下载链接完整路径，不包括文件名
        string filetype = File1.PostedFile.ContentType.ToString();  //文件类型
        string filelg = File1.PostedFile.ContentLength.ToString();  //文件大小
        int filecls=1;
        if (Radio1.Checked == true) filecls = 1;
        if (Radio2.Checked == true) filecls = 2;
        if (Radio3.Checked == true) filecls = 3;
        Filels fille = new Filels();  //使用文件操作类（参见App_Code）
        if (fille.checkFileName(filename))
        {
            filename1 = "0" + filename;     //检查重名，如果有，前面补0
        }
        else
        {
            filename1 = filename;
        }

        if (fille.insertFileitem(Nick, filename1, localipadd + filename, filetype, filelg, filename, filecls))  //调用方法，添加一条记录
        {
            File1.PostedFile.SaveAs(savedirectory + filename);  //上传文件
            rec.InnerHtml += "<tr><td>上传成功！   </td><td>文件地址为：<a href=\"" + localipadd + filename + "\">" + localipadd + filename + "</a></td></tr>";
            rec.InnerHtml += "<br />"; //即时信息提示
        }
    }
}   

