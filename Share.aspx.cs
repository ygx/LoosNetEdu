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

public partial class Share : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Sharer = Request.QueryString["user"];
        this.Label1.Text = Sharer; 
        
//        SqlDataSource1.SelectParameters.Add(new QueryStringParameter());
//        SqlDataSource1.SelectParameters[0].DefaultValue="sa";
//        SqlDataSource1.SelectParameters[0].Name="NickNm";
//        SqlDataSource1.SelectParameters[0].Type="String";
//        SqlDataSource1.SelectParameters[0].QueryStringField="user";
    }
}
