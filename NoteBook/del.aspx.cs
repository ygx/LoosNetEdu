using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.XPath;
using System.Xml;
using System.IO;
using System.Xml.Xsl;
using System.Text.RegularExpressions;
using System.Web.UI.HtmlControls;

public partial class del : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Qx"] != null)
        {
            if (Request.Cookies["Qx"].Value != "0")
            {
                Response.Write("<script>alert('对不起，您不是管理员，没有权利删除该留言！');location.href='ViewGuestBook.aspx';</script>");
            }
            else
           {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("guestbook.xml"));
            XmlNodeList xmlNodeList = xmlDoc.SelectNodes("guestbook/liuyan[id='" + Request.QueryString["Xid"].ToString() + "']");
            XmlNode xmlNode = xmlNodeList.Item(0);
            xmlNode.ParentNode.RemoveChild(xmlNode);
            xmlDoc.Save(Server.MapPath("guestbook.xml"));//
            Response.Redirect("ViewGuestBook.aspx");
           }
        }
        else
        {
            Response.Write("<script>location.href='ViewGuestBook.aspx';</script>");
        }
    }
}
