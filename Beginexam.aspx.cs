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
using System.Data.SqlClient;

public partial class Beginexam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录
        if (Request.Cookies["Usd"] == null)
            Response.Redirect("Exam.aspx");
        //取得session传入的数据
        Label1.Text = Session["lession"].ToString();
//        Label2.Text = Session["no"].ToString();
        Label3.Text = Session["name"].ToString();
        //取得试题
        SqlDataReader reader = DbHelper.getReader("select * from Tiku where 课程名='" + Label1.Text + "' order by 题号");
        int num = 1;//试题序号
        while (reader.Read())
        {
            //加入题目
            Literal li = new Literal();
            li.Text = num.ToString() + "." + reader["题目"].ToString() + "(" + reader["分数"].ToString() + "分)<br>";
            PlaceHolder1.Controls.Add(li);
            //根据题型决定使用radiobuttonlist 还是checkboxlist
            ListControl list;
            if (reader["类型"].ToString() == "单选题    ")
            { list = new RadioButtonList(); }
            else
            { list = new CheckBoxList(); }
            //加入选项内容
            list.Items.Add(Server.HtmlDecode(reader["选项1"].ToString()));
            list.Items.Add(Server.HtmlDecode(reader["选项2"].ToString()));
            list.Items.Add(Server.HtmlDecode(reader["选项3"].ToString()));
            list.Items.Add(Server.HtmlDecode(reader["选项4"].ToString()));
            PlaceHolder1.Controls.Add(list);
            num += 1;
        }
        reader.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql, answer;
        SqlDataReader reader = DbHelper.getReader("select * from Tiku where 课程名='" + Label1.Text + "'order by 题号");
        //计算考试分数
        int j = 0;
        int sum = 0;
        while (reader.Read())
        {
            ListControl list = (ListControl)PlaceHolder1.Controls[2 * j + 1];
            //取得考生答案
            answer = "";
            for (int i = 0; i < list.Items.Count; i++)
            {
                if (list.Items[i].Selected)
                    answer = answer + Convert.ToString(i + 1);
            }
            if (answer == reader["解答"].ToString().Trim())
                sum = sum + Convert.ToInt32(reader["分数"].ToString());
            j += 1;

            //把考试成绩插入到成绩表中
            sql = string.Format("insert into Chengji(姓名,课程名,成绩) values('{0}','{1}','{2}')", Label3.Text, Label1.Text, sum.ToString());
            DbHelper.exesql(sql);
            Response.Redirect("Grad.aspx");
        }
    }
}

