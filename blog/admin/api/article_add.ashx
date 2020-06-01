<%@ WebHandler Language="C#" Class="article_add" %>

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

public class article_add : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数
        string action = HttpContext.Current.Request.Params["action"];//添加或修改
        //sql
        string sql = "";
        //判断是添加还是修改
        string name = HttpContext.Current.Request.Params["name"];
            string title = HttpContext.Current.Request.Params["title"];
            string preface = HttpContext.Current.Request.Params["preface"];
            string img = HttpContext.Current.Request.Params["img"];
            string brief = HttpContext.Current.Request.Params["brief"];
            string time = DateTime.Now.ToString();
            string tid = HttpContext.Current.Request.Params["tid"];
            if (!name.Equals("") && !title.Equals("") && !preface.Equals("") && !img.Equals("") && !brief.Equals("") && !time.Equals("") && !tid.Equals(""))
            {
                sql = "insert into articlelist(aname,a_title,a_preface,img,playtimes,publishtime,brief,tid)values('"+name+"','"+title+"','"+preface+"','"+img+"',0,'"+time+"','"+brief+"','"+tid+"')";
                //修改数据库
                DBHelper.exeDML(sql);
                context.Response.Write("添加成功");
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