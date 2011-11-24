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
/// Files 的摘要说明
/// 本类完成的功能是调用存储过程完成FileLst表的相关操作
/// </summary>
public class Filels
{
	public Filels()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public bool checkFileName(string fileName) //检查重名
    {
        SqlConnection con = Connection.getConnection();//实例化一个连接对象
        SqlCommand cmd = new SqlCommand("checkFileName", con);//执行命令
        cmd.CommandType = CommandType.StoredProcedure;//采用存储过程
        cmd.Parameters.Add("@Filnm", SqlDbType.VarChar, 10);//添加参数
        cmd.Parameters["@Filnm"].Value = fileName;//赋值
        con.Open();//打开连接
        int n = Convert.ToInt32(cmd.ExecuteScalar());//返回首行首列
        con.Close();//关闭连接
        if (n > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public bool insertFileitem(string nick,string fileName, string url,string fileType,string fileLg,string trun,int filecls)
    {   //插入记录
        SqlConnection con = Connection.getConnection();
        SqlCommand cmd = new SqlCommand("insertFile", con);
//        Byte Ifshare;
//        if (filecls == 3) Ifshare = 1;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Filnm_1", SqlDbType.VarChar, 50);
        cmd.Parameters["@Filnm_1"].Value = fileName;
        cmd.Parameters.Add("@Url_2", SqlDbType.VarChar, 255);
        cmd.Parameters["@Url_2"].Value = url;
        cmd.Parameters.Add("@Type_3", SqlDbType.Char, 50);
        cmd.Parameters["@Type_3"].Value = fileType;
        cmd.Parameters.Add("@NickNm", SqlDbType.Char, 10);
        cmd.Parameters["@NickNm"].Value = nick;
        cmd.Parameters.Add("@Length", SqlDbType.VarChar, 50);
        cmd.Parameters["@Length"].Value = fileLg;
        cmd.Parameters.Add("@Truenm", SqlDbType.VarChar, 50);
        cmd.Parameters["@Truenm"].Value = trun;
        cmd.Parameters.Add("@Share", SqlDbType.Bit);
        cmd.Parameters["@Share"].Value = (int)(filecls / 3);
        cmd.Parameters.Add("@Cls", SqlDbType.Int);
        cmd.Parameters["@Cls"].Value = filecls;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        return true;
    }
    public bool delFileFolder(string NickName) //清理注销用户文件
    {
        SqlConnection con = Connection.getConnection();
        SqlCommand cmd = new SqlCommand("delete FileLst where NickNm=@NickNm", con);
        cmd.Parameters.Add("@NickNm", SqlDbType.VarChar, 10);
        cmd.Parameters["@NickNm"].Value = NickName;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        return true;
    }
//    public bool insmutiFiles(string userName, string userPwd)
//    {
//    }
}


/* 存储过程checkFileName
CREATE procedure checkFileName
@Filnm varchar(10)
as
select count(*) from FileLst
where Filnm=@Filnm
GO

 * 存储过程insertFile
CREATE PROCEDURE [insertFile]
	(@Filnm_1 	[varchar](50),
	 @Url_2 	[varchar](255),
	 @Type_3 	[char](50),
	@NickNm	[char](10),
	@Length	[varchar](50),
	@Truenm	[varchar](50))

AS INSERT INTO [DiskSDB].[dbo].[FileLst] 
	 ( [Filnm],
	 [Url],
	 [Type],
	[NickNm],
	[Length],
	[Truenm]) 
 
VALUES 
	(@Filnm_1,
	 @Url_2,
	 @Type_3,
	@NickNm,
	@Length,
	@Truenm)
GO

*/