<%@ WebHandler Language="C#" Class="addGbook" %>

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

public class addGbook : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数
        string img = HttpContext.Current.Request.Params["img"];//头像
        string name = HttpContext.Current.Request.Params["name"];//昵称
        string brief = HttpContext.Current.Request.Params["brief"];//留言内容
        string time = DateTime.Now.ToString();//获取时间
        if (!img.Equals("") && !name.Equals("") && !brief.Equals(""))
        {   //SQL语句
            string sql = "insert into guestbook values('"+time+"','"+name+"','"+img+"','"+brief+"')";
            //修改数据库
            DBHelper.exeDML(sql);
            context.Response.Write("发表成功");
        }
        else
        {
            //回送结果
            context.Response.Write("填写内容不能为空");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}