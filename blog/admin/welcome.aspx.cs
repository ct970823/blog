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

public partial class admin_welcome : System.Web.UI.Page
{
    public int article_num = 0;
    public int diary_num = 0;
    public int photo_num = 0;
    public string username = "";
    public string time = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        // 未登录跳转
        if (Session["userId"] == null)
        {
            Response.Redirect("login.aspx");
        }
        username = Session["userName"].ToString();
        time = DateTime.Now.ToString();
        string sql1 = "select * from articlelist";
        string sql2 = "select * from diary";
        string sql3 = "select * from photo";
        DataSet ds1 = DBHelper.getDataSet(sql1);
        DataSet ds2 = DBHelper.getDataSet(sql2);
        DataSet ds3 = DBHelper.getDataSet(sql3);
        int cnt1 = ds1.Tables[0].Rows.Count;
        int cnt2 = ds2.Tables[0].Rows.Count;
        int cnt3 = ds3.Tables[0].Rows.Count;
        article_num = cnt1;
        diary_num = cnt2;
        photo_num = cnt3;
    }
}