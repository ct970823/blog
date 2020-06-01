<%@ WebHandler Language="C#" Class="infoArticle" %>

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

public class infoArticle : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数
        string id = HttpContext.Current.Request.Params["id"];//id
        //sql
        string sql = "select * from articlelist where id="+id;
        //上一篇
        string sql2 = "select top 1 id from articlelist where id < " + id + " order by id desc";
        //下一篇
        string sql3 = "select top 1 id from articlelist where id >" + id + " order by id asc";
        //查询内容
        DataSet ds = DBHelper.getDataSet(sql);
        DataSet ds2 = DBHelper.getDataSet(sql2);
        DataSet ds3 = DBHelper.getDataSet(sql3);
        int i = ds.Tables[0].Rows.Count;
        int cntUp = ds2.Tables[0].Rows.Count;
        int cntDown = ds3.Tables[0].Rows.Count;
        //转换格式
        StringBuilder Builder = new StringBuilder();
        Builder.Append("{");
        Builder.Append("\"r\":" + i + "");
        Builder.Append(",\"cntUp\":" + cntUp + "");
        Builder.Append(",\"cntDown\":" + cntDown + "");
        if (i > 0)
        {
            List<Article> list = new List<Article>();

            for (int j = 0; j < i; j++)
            {
                Article temp = new Article(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString(), ds.Tables[0].Rows[j][2].ToString(), ds.Tables[0].Rows[j][3].ToString(), ds.Tables[0].Rows[j][4].ToString(), int.Parse(ds.Tables[0].Rows[j][5].ToString()), ds.Tables[0].Rows[j][6].ToString(), ds.Tables[0].Rows[j][7].ToString(), ds.Tables[0].Rows[j][8].ToString());
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