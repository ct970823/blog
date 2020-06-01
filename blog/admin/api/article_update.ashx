<%@ WebHandler Language="C#" Class="article_update" %>

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

public class article_update : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数
        string id = HttpContext.Current.Request.Params["id"];
        string name = HttpContext.Current.Request.Params["name"];
        string title = HttpContext.Current.Request.Params["title"];
        string preface = HttpContext.Current.Request.Params["preface"];
        string img = HttpContext.Current.Request.Params["img"];
        string brief = HttpContext.Current.Request.Params["brief"];
        string time = DateTime.Now.ToString();
        string tid = HttpContext.Current.Request.Params["tid"];
        string sql = "update articlelist set aname = '" + name + "',a_title = '" + title + "',a_preface = '" + preface + "',img = '" + img + "',publishtime = '" + time + "',brief = '" + brief + "',tid = '" + tid + "' where id="+id;
        //修改数据库
        DBHelper.exeDML(sql);
        context.Response.Write("修改成功");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}