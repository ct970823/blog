<%@ WebHandler Language="C#" Class="gbook_edit" %>

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

public class gbook_edit : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        int id = int.Parse(HttpContext.Current.Request.Params["id"]);
        string sql = "delete from guestbook where id=" + id;
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