using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Files : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Usd"] != null)
        {
            this.Label1.Text = Request.Cookies["Usd"].Value;    //**的文件
            switch (Request.Cookies["Qx"].Value)    //不同权限的不同提示信息
            {
                case "0":
                    this.Label2.Text="伟大的超管，欢迎您~";
//                    Response.Write("<a href=\"admin.aspx\">管理</a>");
                    break;
                case "2":
                    this.Label2.Text="尊敬的老师，欢迎您~";
                    break;
                default:
                    this.Label2.Text = "欢迎使用鲁斯网络教学平台";
                    break;
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Server.Execute("~/UpLoad.aspx");  //点击上传按钮，链接主页
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e) //删除操作前激发的事件
    {
        try
        {
            string usek = Request.Cookies["Usd"].Value; //从cookie取得用户名
            string finm = e.Values[0].ToString();       //从第一字段取得删除文件名
            File.Delete(Server.MapPath("./") + "files\\" + usek + "\\" + finm); //从服务器上删除文件
        }
        catch
        {
            Response.Write("<script>alert('公共文件只能由管理员来删除！');</script>");
            e.Cancel = true; }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this.form1.Visible = false;
        Server.Execute("~/Share.aspx?user=" + DropDownList1.Text);
    }

/*    protected void ccc(object sender, CommandEventArgs e)
    {
        Response.Write("<script>alert('删除！');</script>");
    }
    //<asp:ButtonField ButtonType="Image" ImageUrl="~/img/sharing.gif" Text="共享" CommandName="ccc" />
*/
}
