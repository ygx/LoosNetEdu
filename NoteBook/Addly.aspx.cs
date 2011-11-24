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

public partial class Addly : System.Web.UI.Page
{
    String Nick="游客";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Usd"] != null)
        {
            Nick = Request.Cookies["Usd"].Value;
//            if (Request.Cookies["Qx"] == "1")
//            {
//                this.btn3.Text = "查看我的留言";
//            }
        }
        this.name0.Text = Nick;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("guestbook.xml"));
         
            XmlElement newElement = xmlDoc.CreateElement("liuyan");
            XmlElement elid = xmlDoc.CreateElement("id");
            XmlElement elname = xmlDoc.CreateElement("name");
            XmlElement elemail = xmlDoc.CreateElement("email");
            XmlElement elqq = xmlDoc.CreateElement("qq");
            XmlElement elcomment = xmlDoc.CreateElement("comment");
            XmlElement eldatatime = xmlDoc.CreateElement("datatime");
            XmlElement elback = xmlDoc.CreateElement("back");
            elid.InnerText = ReturnCount();
            elname.InnerText = Nick;
            elemail.InnerText = this.email0.Text.Trim();
            if (this.email0.Text == "local@host.ss")
            {
                elemail.InnerText = "";
            }
            elqq.InnerText = this.qq0.Text.Trim();
            if (this.qq0.Text == "13800138000")
            {
                elqq.InnerText = "";
            }
            elcomment.InnerText = this.comment0.Text.Trim();
            eldatatime.InnerText = DateTime.Now.ToString();
            elback.InnerText =" ";

            newElement.AppendChild(elid);
            newElement.AppendChild(elname);
            newElement.AppendChild(elemail);
            newElement.AppendChild(elqq);
            newElement.AppendChild(elcomment);
            newElement.AppendChild(eldatatime);
            newElement.AppendChild(elback);
            
            xmlDoc.DocumentElement.AppendChild(newElement);
            
            xmlDoc.Save(Server.MapPath("guestbook.xml"));
            Response.Redirect("ViewGuestBook.aspx");
        
    }
    public string ReturnCount()
    {
        
        string i = string.Empty;
        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.Load(Server.MapPath("guestbook.xml"));
        XmlNode xmlNode = xmlDoc.DocumentElement.LastChild;
        if (xmlNode != null)
        {
            i = Convert.ToString(Convert.ToUInt32(xmlNode["id"].InnerText) + 1);
        }
        return i;
    }
    protected void btn2_Click(object sender, EventArgs e)
    {
        email0.Text = "";
        qq0.Text = "";
        comment0.Text = "";
    }
    protected void btn3_Click(object sender, EventArgs e)
    {
//        if (Request.Cookies["Qx"] == "1")
//        {
//            Response.Redirect("ViewGuestBook.aspx?user=" + Nick);
//        }
//        else
//        {
            Response.Redirect("ViewGuestBook.aspx");
//        }
    }
    protected void no2_Click(object sender, EventArgs e)
    {
        this.email0.Text = "local@host.ss";
        this.email0.Enabled = false;
    }
    protected void no3_Click(object sender, EventArgs e)
    {
        this.qq0.Text = "13800138000";
        this.qq0.Enabled = false;
    }
}
