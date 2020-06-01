<%@ WebHandler Language="C#" Class="article_type_edit" %>

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

public class article_type_edit : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数
        string action = HttpContext.Current.Request.Params["action"];
        //sql
        string sql = "";
        if (action == "add")
        {
            string t_name = HttpContext.Current.Request.Params["t_name"];
            sql = "insert into articleType(t_name) values('" + t_name + "')";
        }
        else if(action == "edit")
        {
            string t_name = HttpContext.Current.Request.Params["t_name"];
            int id = int.Parse(HttpContext.Current.Request.Params["id"]);
            sql = "update articleType set t_name = '" + t_name + "' where id=" + id;
        }
        else if(action == "del")
        {
            int id = int.Parse(HttpContext.Current.Request.Params["id"]);
            sql = "delete from articleType where id=" + id;
        }
        //修改数据库
        int i = DBHelper.exeDML(sql);
        if (i > 0)
        {
            context.Response.Write("成功");
        }
        else
        {
            context.Response.Write("失败");
        }


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}