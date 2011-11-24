using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;//引入数据命名空间
/// <summary>
/// users 的摘要说明
/// 本类完成的功能是调用存储过程完成Users表的相关操作
/// </summary>
public class users
{
    public users()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public bool checkUserName(string userName)      //检查重名
    {
        SqlConnection con = Connection.getConnection();
        SqlCommand cmd = new SqlCommand("checkUserName", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@NickNm", SqlDbType.VarChar, 10);
        cmd.Parameters["@NickNm"].Value = userName;
             //以上代码调用存储过程checkUserName对数据库进行操作，
        con.Open();
        int n = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        if (n > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public bool insertUsers(string userName, string userPwd,int backQx)        //插入记录
    {
        SqlConnection con = Connection.getConnection();
        SqlCommand cmd = new SqlCommand("insertUsers", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@NickNm_1", SqlDbType.VarChar, 10);
        cmd.Parameters["@NickNm_1"].Value = userName;
        cmd.Parameters.Add("@Psd_2", SqlDbType.VarChar, 10);
        cmd.Parameters["@Psd_2"].Value = userPwd;
        cmd.Parameters.Add("@Qx_3", SqlDbType.Int, 4);
        cmd.Parameters["@Qx_3"].Value = backQx;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        return true;
    }
    public bool uninstallme(string userName,string userPwd)     //自毁程序
    {
        SqlConnection con = Connection.getConnection();
        SqlCommand cmd = new SqlCommand("delete users where NickNm=@NickNm and Psd=@Psd", con);
        cmd.Parameters.Add("@NickNm", SqlDbType.VarChar, 10);
        cmd.Parameters["@NickNm"].Value = userName;
        cmd.Parameters.Add("@Psd", SqlDbType.VarChar, 10);
        cmd.Parameters["@Psd"].Value = userPwd;
            //这次没用存储过程，直接用SQl语句操作数据库
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        return true;
    }
    public bool loornot(string userName, string userPwd)        //判断是否成功登录
    {
        SqlConnection con = Connection.getConnection();
        SqlCommand cmd = new SqlCommand("lo", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@NickNm", SqlDbType.VarChar, 10);
        cmd.Parameters["@NickNm"].Value = userName;
        cmd.Parameters.Add("@Psd", SqlDbType.VarChar, 10);
        cmd.Parameters["@Psd"].Value = userPwd;
        con.Open();
        int n = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        if (n == 1) //成功登陆后，只能返回一条结果
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public int getqx(string userName)  //获取权限
    {
        SqlConnection con = Connection.getConnection();
        SqlCommand cmd = new SqlCommand("select Qx from users where NickNm=@NickNm", con);
        cmd.Parameters.Add("@NickNm", SqlDbType.VarChar, 10);
        cmd.Parameters["@NickNm"].Value = userName;
        con.Open();
        int n = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        return n;
    }
}

/* 存储过程checkUserName
create procedure checkUserName
@NickNm varchar(10)
as
select count(*) from users
where NickNm=@NickNm
GO

 * 存储过程insertUsers
CREATE PROCEDURE [insertUsers]
	(@NickNm_1 	[char](10),
	 @Psd_2 	[char](10),
	 @Qx_3 	[int])

AS INSERT INTO [DiskSDB].[dbo].[Users] 
	 ( [NickNm],
	 [Psd],
	 [Qx]) 
 
VALUES 
	( @NickNm_1,
	 @Psd_2,
	 @Qx_3)
GO

 * 存储过程lo
create procedure lo
(@NickNm char(10),
 @Psd char(10))
as
select count(*) from users
where NickNm=@NickNm and Psd=@Psd
GO

*/
