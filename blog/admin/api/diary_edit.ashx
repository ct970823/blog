<%@ WebHandler Language="C#" Class="diary_edit" %>

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

public class diary_edit : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数
        string action = HttpContext.Current.Request.Params["action"];
        //sql
        string sql = "";
        if (action == "add")
        {
            string title = HttpContext.Current.Request.Params["title"];
            string brief = HttpContext.Current.Request.Params["brief"];
            string time = DateTime.Now.ToString();
            int playtimes = 0;
            sql = "insert into diary(d_time,d_title,d_info,playtimes) values('" + time + "','"+title+"','"+brief+"',"+playtimes+")";
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
        else if(action == "update")
        {
            string title = HttpContext.Current.Request.Params["title"];
            string brief = HttpContext.Current.Request.Params["brief"];
            int id = int.Parse(HttpContext.Current.Request.Params["id"]);
            sql = "update diary set d_title = '" + title + "',d_info = '" + brief + "' where id=" + id;
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
        else if(action == "del")
        {
            int id = int.Parse(HttpContext.Current.Request.Params["id"]);
            sql = "delete from diary where id=" + id;
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
        else if(action == "edit")
        {
            int id = int.Parse(HttpContext.Current.Request.Params["id"]);
            sql = "select * from diary where id=" + id;
            //查询内容
            DataSet ds = DBHelper.getDataSet(sql);
            int i = ds.Tables[0].Rows.Count;
            //转换格式
            StringBuilder Builder = new StringBuilder();
            Builder.Append("{");
            Builder.Append("\"r\":" + i + "");
            if (i > 0)
            {
                List<Diary> list = new List<Diary>();
                for (int j = 0; j < i; j++)
                {
                    Diary temp = new Diary(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString(), ds.Tables[0].Rows[j][2].ToString(), ds.Tables[0].Rows[j][3].ToString(), int.Parse(ds.Tables[0].Rows[j][4].ToString()));
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
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}