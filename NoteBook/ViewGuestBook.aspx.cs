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
using System.Xml.XPath;
using System.Xml;
using System.IO;
using System.Xml.Xsl;


public partial class ViewGuestBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Typeget = Request.QueryString["user"];
        if (Typeget != null)
        {
        }
        else
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("guestbook.xml"));
            if (ds.Tables.Count > 0)
            { 
                this.Repeater1.DataSource = ds.Tables[0].DefaultView;
                this.Repeater1.DataBind();
            }
        }
    }
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addly.aspx");//
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../UpLoad.aspx?type=shut3");
    }
}
