<%@ WebHandler Language="C#" Class="user_edit" %>

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

public class user_edit : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数
        int id = int.Parse(HttpContext.Current.Request.Params["id"]);
        string name = HttpContext.Current.Request.Params["name"];
        string pwd = HttpContext.Current.Request.Params["pwd"];
        pwd = MD5.getMD5(pwd);
        string sql = "update admins set name='" + name + "',pwd='" + pwd + "' where id=" + id;
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