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
using System.IO;

public partial class Notes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "sa";
        if (Request.Cookies["Usd"] != null)
        {
            Label1.Text = Request.Cookies["Usd"].Value;
        }

        Label2.Text = "下载地址：";
        HyperLink1.Text = "http://" + Request.ServerVariables["Local_Addr"] + "/files/" + Label1.Text + "/note.txt";
        HyperLink1.NavigateUrl = HyperLink1.Text;
    }

    protected void Get_ServerClick(object sender, EventArgs e)
    {
        FileStream fs = new FileStream(Server.MapPath(".\\files\\" + Label1.Text + "\\") + "note.txt", FileMode.OpenOrCreate, FileAccess.Read);
        StreamReader m = new StreamReader(fs);
        m.BaseStream.Seek(0, SeekOrigin.Begin);
        TextArea1.Value = "";
        string strLine = m.ReadLine();
        while (strLine != null)
        {
            TextArea1.Value += strLine + "\n";
            strLine = m.ReadLine();
        }
        m.Close();
        fs.Close();
    }
//        StreamReader sr = new StreamReader(Server.MapPath(".\\files\\" + Label1.Text + "\\") + "note.txt", System.Text.Encoding.Unicode, true);
//        sr.Read(TextArea1.Value,1,9);
//        sr.Close;
    protected void Del_ServerClick(object sender, EventArgs e)
    {
        try
        {
            File.Delete(Server.MapPath(".\\files\\" + Label1.Text + "\\") + "note.txt");
        }
        finally
        {
            Response.Write("<script>alert('删除成功！');</script>");
        }
    } 

    protected void Submit1_ServerClick(object sender, EventArgs e)
    {
        FileStream fs = new FileStream(Server.MapPath(".\\files\\" + Label1.Text + "\\") + "note.txt", FileMode.OpenOrCreate, FileAccess.ReadWrite);
        StreamWriter m = new StreamWriter(fs, System.Text.Encoding.Unicode);
        m.Write(TextArea1.Value);
        m.Flush();  //把所有缓冲区内容清理,并写入基础流
        fs.Close();

//        StreamWriter sw = new StreamWriter(Server.MapPath(".\\files\\" + Label1.Text + "\\") + "note.txt", true, System.Text.Encoding.Unicode);//文件路径，是否覆盖指定路径同名文件，文本编码
//        sw.Write(TextArea1.Value);
//        sw.Close();
    }

}
