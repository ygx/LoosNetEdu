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
/// DbHelper 的摘要说明
/// </summary>

public class DbHelper
{
	public DbHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    //从web.config中读取数据库连接信息
    public static string getConnstr()
    {
        string connstr = "server=.;uid=sa;pwd=sa;database=DiskSDB;";
        return connstr;
    }
    //根据select查询sql，返回dataset
    public static DataSet getDataset(string sql)
    {
        SqlConnection con = new SqlConnection(getConnstr());
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
     }
     //根据select查询sql，返回datareader
    public static SqlDataReader getReader(string sql)
    {
        
        SqlConnection con = new SqlConnection(getConnstr());
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = cmd.ExecuteReader();
       
        return reader;
       
        
    }
    //根据select查询sql，返回一个整数
    public static int scalar(string sql)
    {
        int ret;
        SqlConnection con = new SqlConnection(getConnstr());
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        ret = (int)(cmd.ExecuteScalar());
        con.Close();
        return ret;
    }
    //运行updata insert delete等语句
    public static void exesql(string sql)
    {
        SqlConnection con = new SqlConnection(getConnstr());
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}
