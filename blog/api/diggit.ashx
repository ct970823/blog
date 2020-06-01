<%@ WebHandler Language="C#" Class="diggit" %>

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

public class diggit : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数 有两个，一个是id，另一个是文章或日记或相册
        //后面的参数用diggitType=1来命名   1：文章 2：日记  3：相册
        string id = HttpContext.Current.Request.Params["id"];//id
        int diggitType = int.Parse(HttpContext.Current.Request.Params["diggitType"]);
        //sql
        //判断是哪个类型的
        string sql = "";
        if (diggitType == 1)
        {
            sql = "update articlelist set playtimes += 1 where id ="+id;
        }else if (diggitType == 2)
        {
            sql = "update diary set playtimes += 1 where id ="+id;
        }
        else
        {
            sql = "update photo set commend += 1 where id ="+id;
        }
        //修改数据库
        DBHelper.exeDML(sql);
        context.Response.Write(1);

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}