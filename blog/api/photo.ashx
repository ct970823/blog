<%@ WebHandler Language="C#" Class="photo" %>

using System;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Security;
using System.Web.Script.Serialization;
using System.Text;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

public class photo : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //SQL语句
        string sql = "select * from photo order by p_time desc";
        //查询内容
        DataSet ds = DBHelper.getDataSet(sql);
        int i = ds.Tables[0].Rows.Count;
        //转换格式
        StringBuilder Builder = new StringBuilder();
        Builder.Append("{");
        Builder.Append("\"r\":" + i + "");
        if (i > 0)
        {
            List<Photo> list = new List<Photo>();

            for (int j = 0; j < i; j++)
            {
                Photo temp = new Photo(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString(), ds.Tables[0].Rows[j][2].ToString(), ds.Tables[0].Rows[j][3].ToString(), ds.Tables[0].Rows[j][4].ToString(), int.Parse(ds.Tables[0].Rows[j][5].ToString()));
                list.Add(temp);
            }

            string json = new JavaScriptSerializer().Serialize(list);//这个很关键，否则error 

            Builder.Append(",\"data\":");
            Builder.Append(json);
        }
        Builder.Append("}");
        //回送结果
        context.Response.Write(Builder.ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}