<%@ WebHandler Language="C#" Class="search" %>

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

public class search : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数
        string action = HttpContext.Current.Request.Params["action"];
        int pageIndex = int.Parse(HttpContext.Current.Request.Params["pageIndex"]);//页数索引
        int pageSize = 4;//每页的数据条数
        //准备sql
        string sql = "";
        string sqlAll = "";
        if (action == "article_list")
        {
            //接收其他参数（文章分类和标题）
            string tid = HttpContext.Current.Request.Params["tid"];
            string tit = HttpContext.Current.Request.Params["tit"];
            sql = "select articlelist.id,aname,a_title,a_preface,img,playtimes,publishtime,brief,tid,articleType.t_name from articlelist,articleType where articleType.id = articlelist.tid ";
            sqlAll = sql;
            if (tid != "分类")
            {
                sql += " and articleType.id=" + tid;
                sqlAll += " and articleType.id=" + tid;
            }
            if (!tit.Equals(""))
            {
                sql += " and a_title like '%" + tit + "%'";
                sqlAll += " and a_title like '%" + tit + "%'";
            }
            sql += "order by publishtime offset " + (pageIndex - 1) * pageSize + " rows fetch next " + pageSize + " rows only";
            //查询内容
            DataSet ds = DBHelper.getDataSet(sql);
            DataSet ds2 = DBHelper.getDataSet(sqlAll);
            int i = ds.Tables[0].Rows.Count;
            int cntAll = ds2.Tables[0].Rows.Count;
            //转换格式
            StringBuilder Builder = new StringBuilder();
            Builder.Append("{");
            Builder.Append("\"r\":" + i + "");
            Builder.Append(",\"cntAll\":" + cntAll + "");
            if (i > 0)
            {
                List<Article_list> list = new List<Article_list>();

                for (int j = 0; j < i; j++)
                {
                    Article_list temp = new Article_list(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString(), ds.Tables[0].Rows[j][2].ToString(), ds.Tables[0].Rows[j][3].ToString(), ds.Tables[0].Rows[j][4].ToString(), int.Parse(ds.Tables[0].Rows[j][5].ToString()), ds.Tables[0].Rows[j][6].ToString(), ds.Tables[0].Rows[j][7].ToString(), ds.Tables[0].Rows[j][8].ToString(),ds.Tables[0].Rows[j][9].ToString());
                    list.Add(temp);
                }

                string json = new JavaScriptSerializer().Serialize(list);//这个很关键，否则error 

                Builder.Append(",\"data\":");
                Builder.Append(json);
            }
            Builder.Append("}");
            //return Builder.ToString();
            //回送结果
            context.Response.Write(Builder.ToString());
        }
        else if(action == "article_type")
        {
            //接收其他参数
            string tit = HttpContext.Current.Request.Params["tit"];
            sql = "select * from articleType ";
            sqlAll = sql;
            if (!tit.Equals(""))
            {
                sql += " where t_name like '%" + tit + "%'";
                sqlAll += " where t_name like '%" + tit + "%'";
            }
            sql += " order by id offset " + (pageIndex - 1) * pageSize + " rows fetch next " + pageSize + " rows only";
            //查询内容
            DataSet ds = DBHelper.getDataSet(sql);
            DataSet ds2 = DBHelper.getDataSet(sqlAll);
            int i = ds.Tables[0].Rows.Count;
            int cntAll = ds2.Tables[0].Rows.Count;
            //转换格式
            StringBuilder Builder = new StringBuilder();
            Builder.Append("{");
            Builder.Append("\"r\":" + i + "");
            Builder.Append(",\"cntAll\":" + cntAll + "");
            if (i > 0)
            {
                List<Type> list = new List<Type>();

                for (int j = 0; j < i; j++)
                {
                    Type temp = new Type(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString());
                    list.Add(temp);
                }

                string json = new JavaScriptSerializer().Serialize(list);//这个很关键，否则error 

                Builder.Append(",\"data\":");
                Builder.Append(json);
            }
            Builder.Append("}");
            //return Builder.ToString();
            //回送结果
            context.Response.Write(Builder.ToString());
        }else if (action == "photo")
        {
            //接收其他参数
            string tit = HttpContext.Current.Request.Params["tit"];
            sql = "select * from photo ";
            sqlAll = sql;
            if (!tit.Equals(""))
            {
                sql += " where p_title like '%" + tit + "%'";
                sqlAll += " where p_title like '%" + tit + "%'";
            }
            sql += " order by id offset " + (pageIndex - 1) * pageSize + " rows fetch next " + pageSize + " rows only";
            //查询内容
            DataSet ds = DBHelper.getDataSet(sql);
            DataSet ds2 = DBHelper.getDataSet(sqlAll);
            int i = ds.Tables[0].Rows.Count;
            int cntAll = ds2.Tables[0].Rows.Count;
            //转换格式
            StringBuilder Builder = new StringBuilder();
            Builder.Append("{");
            Builder.Append("\"r\":" + i + "");
            Builder.Append(",\"cntAll\":" + cntAll + "");
            if (i > 0)
            {
                List<Photo> list = new List<Photo>();

                for (int j = 0; j < i; j++)
                {
                    Photo temp = new Photo(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString(), ds.Tables[0].Rows[j][2].ToString(), ds.Tables[0].Rows[j][3].ToString(), ds.Tables[0].Rows[j][4].ToString(), int.Parse(ds.Tables[0].Rows[j][5].ToString()));
                    list.Add(temp);
                }

                string json = new JavaScriptSerializer().Serialize(list);//这个很关键，否则error 

                Builder.Append(",\"data\":");
                Builder.Append(json);
            }
            Builder.Append("}");
            //return Builder.ToString();
            //回送结果
            context.Response.Write(Builder.ToString());
        }else if (action == "diary")
        {
            //接收其他参数
            string tit = HttpContext.Current.Request.Params["tit"];
            sql = "select * from diary ";
            sqlAll = sql;
            if (!tit.Equals(""))
            {
                sql += " where d_title like '%" + tit + "%'";
                sqlAll += " where d_title like '%" + tit + "%'";
            }
            sql += " order by id offset " + (pageIndex - 1) * pageSize + " rows fetch next " + pageSize + " rows only";
            //查询内容
            DataSet ds = DBHelper.getDataSet(sql);
            DataSet ds2 = DBHelper.getDataSet(sqlAll);
            int i = ds.Tables[0].Rows.Count;
            int cntAll = ds2.Tables[0].Rows.Count;
            //转换格式
            StringBuilder Builder = new StringBuilder();
            Builder.Append("{");
            Builder.Append("\"r\":" + i + "");
            Builder.Append(",\"cntAll\":" + cntAll + "");
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
            //return Builder.ToString();
            //回送结果
            context.Response.Write(Builder.ToString());
        }else if (action == "gbook")
        {
            //接收其他参数
            string tit = HttpContext.Current.Request.Params["tit"];
            sql = "select * from guestbook ";
            sqlAll = sql;
            if (!tit.Equals(""))
            {
                sql += " where g_name like '%" + tit + "%'";
                sqlAll += " where g_name like '%" + tit + "%'";
            }
            sql += " order by id offset " + (pageIndex - 1) * pageSize + " rows fetch next " + pageSize + " rows only";
            //查询内容
            DataSet ds = DBHelper.getDataSet(sql);
            DataSet ds2 = DBHelper.getDataSet(sqlAll);
            int i = ds.Tables[0].Rows.Count;
            int cntAll = ds2.Tables[0].Rows.Count;
            //转换格式
            StringBuilder Builder = new StringBuilder();
            Builder.Append("{");
            Builder.Append("\"r\":" + i + "");
            Builder.Append(",\"cntAll\":" + cntAll + "");
            if (i > 0)
            {
                List<Gbook> list = new List<Gbook>();
                for (int j = 0; j < i; j++)
                {
                    Gbook temp = new Gbook(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString(), ds.Tables[0].Rows[j][2].ToString(), ds.Tables[0].Rows[j][3].ToString(), ds.Tables[0].Rows[j][4].ToString());
                    list.Add(temp);
                }
                string json = new JavaScriptSerializer().Serialize(list);//这个很关键，否则error 
                Builder.Append(",\"data\":");
                Builder.Append(json);
            }
            Builder.Append("}");
            //return Builder.ToString();
            //回送结果
            context.Response.Write(Builder.ToString());
        }
        else
        {

        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}