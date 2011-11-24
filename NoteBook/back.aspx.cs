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
using System.Text.RegularExpressions;

public partial class admin_back : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Qx"] != null)
        {
            if (Request.Cookies["Qx"].Value != "2")
            {
                Response.Write("<script>alert('对不起，您不是教师，没有权利回复留言！');location.href='ViewGuestBook.aspx';</script>");
            }
            this.qianming.Text = Request.Cookies["Usd"].Value;
        }
        else
        {
            Response.Write("<script>location.href='ViewGuestBook.aspx';</script>");
        }
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Xid"] != null)
        {
          
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("guestbook.xml"));
         
            XmlNodeList xmlNodeList = xmlDoc.SelectNodes("guestbook/liuyan[id='" + Request.QueryString["Xid"].ToString() + "']");//查找
            XmlNode xmlNode = xmlNodeList.Item(0);

            xmlNode["back"].InnerText = this.back.Text + '(' + this.qianming.Text + ')';
            
            xmlDoc.Save(Server.MapPath("guestbook.xml"));
          
        }
        Response.Redirect("ViewGuestBook.aspx");
        
    }
    protected void btncz_Click(object sender, EventArgs e)
    {
        back.Text = "";
    }
}
