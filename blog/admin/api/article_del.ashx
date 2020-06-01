<%@ WebHandler Language="C#" Class="article_del" %>

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
using System.Web.SessionState;//第一步：导入此命名空间

public class article_del : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //指定接收数据的类型
        context.Response.ContentType = "application/json";
        //准备回送的字符串
        string outstr = "";

        //接收数据
        string tid = context.Request["tid"];

        //执行写入操作
        outstr = doSelect(context, tid);

        //回送结果
        context.Response.Write(outstr);
    }
    

    public string doSelect(HttpContext context, string tid)
    {

        string del_sql = "select img  from articlelist where id in (" + tid + ")";
        DataSet delDs = DBHelper.getDataSet(del_sql);


        for (int j = 0; j < delDs.Tables[0].Rows.Count; j++)
        {
            System.IO.File.Delete(context.Server.MapPath("~/" + delDs.Tables[0].Rows[j]["img"].ToString() + ""));
        }

         string sql = "delete from articlelist where id in( " + tid + ")";
         int i = 0;
        //执行插入操作，并获得影响的行数

        try
        {
            i = DBHelper.exeDML(sql);
            
        } catch(Exception e){
            i = 0;
            
        }

        StringBuilder Builder = new StringBuilder();
        Builder.Append("{");
        Builder.Append("\"r\":" + i + "");
        Builder.Append("}");
        return Builder.ToString();
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}