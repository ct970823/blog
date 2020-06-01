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
/// DBHelper数据库访问类
/// 用户获取数据库的连接；
/// 获取查询结果，执行insert\delete\update,执行查询统计如select count * from(表名)；
/// </summary>
public class DBHelper
{
	public DBHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static SqlConnection getConn()
    {
        string connStr = ConfigurationManager.ConnectionStrings["connStr3"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        return conn;
    }

    /// <summary>
    /// 根据select查询语句，获取DataSet结果集
    /// </summary>
    /// <param name="sql">sql是select语句</param>
    /// <returns>DataSet数据集</returns>
    public static DataSet getDataSet(string sql)
    {
        SqlConnection conn = DBHelper.getConn();
        SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        return ds;
    }
    /// <summary>
    /// 执行insert，update,delete语句
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public static int exeDML(string sql)
    {
        SqlConnection conn = getConn();
        try
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            int n = cmd.ExecuteNonQuery();
            return n;
        }
        finally //无论上面是否return，最后都要执行
        {
            if(conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }
}
