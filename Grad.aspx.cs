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

public partial class grad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["Usd"] == null)
              Response.Redirect("Exam.aspx");
            Label1.Text = "姓名:" + Session["name"].ToString();
//            Label2.Text = "学号：" + Session["no"].ToString();
            GridView1.DataSource = DbHelper.getDataset("select 课程名,成绩 from Chengji where 姓名='" + Session["name"].ToString() + "'");
            GridView1.DataBind();
        }
    }
}
