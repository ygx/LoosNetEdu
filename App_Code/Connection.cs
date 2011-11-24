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
/// <summary>
/// Connection 的摘要说明
/// </summary>
public class Connection
{
    public Connection()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public static SqlConnection getConnection()  //连接数据库
    {
        return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString);
    }
}

