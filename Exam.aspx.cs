using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Exam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Usd"] == null)
        {
            Response.Write("<script>alert('欲参加考试，必须先登陆！');</script>");
            Response.Redirect("Lo.aspx?from=exam");
        }
        Label1.Text = Request.Cookies["Usd"].Value;

        if (!IsPostBack)
        {
            DropDownList1.DataSource = DbHelper.getDataset("select distinct 课程名 from Tiku");
            DropDownList1.DataTextField = "课程名";
            DropDownList1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string lesson = DropDownList1.SelectedValue;


        int n = DbHelper.scalar("select count (*) from Users where NickNm='" + Label1.Text + "'");
        if (n <= 0)

            Response.Write("<script>alert('登录失败')</script>");
        //判断是否参加过考试
        else
        {
            int ret = DbHelper.scalar("select count (*) from Chengji where 姓名='" + Label1.Text + "' and 课程名='" + DropDownList1.SelectedValue + "'");
            if (ret > 0)
                Response.Write("<script>alert('你已经参加过这门课程的考试！')</script>");

            else
            {
//                Session["no"] = TextBox1.Text;
                Session["name"] = Label1.Text;
                Session["lession"] = lesson;
                Response.Redirect("Beginexam.aspx");
            }


        }
    }
}
