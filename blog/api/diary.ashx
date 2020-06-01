<%@ WebHandler Language="C#" Class="diary" %>

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

public class diary : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        //接收参数
        string keywords = HttpContext.Current.Request.Params["keywords"];//关键词
        int pageIndex = int.Parse(HttpContext.Current.Request.Params["pageIndex"]);//页数索引
        int pageSize = 3;//每页的数据条数
        //如果有参数就修改sql语句
        string sql = "";
        string sqlAll = "";
        if (keywords != null)
        {
            sql = "select * from diary where d_title like '%" + keywords + "%'order by d_time offset "+(pageIndex - 1)*pageSize+" rows fetch next "+pageSize+" rows only";
            sqlAll = "select * from diary where d_title like '%" + keywords + "%'order by d_time";
        }
        else
        {
            sql= "select * from diary order by d_time offset "+(pageIndex - 1)*pageSize+" rows fetch next "+pageSize+" rows only";
            sqlAll = "select * from diary order by d_time";
        }

        //查询内容
        DataSet ds = DBHelper.getDataSet(sql);
        DataSet ds2 = DBHelper.getDataSet(sqlAll);
        int i = ds.Tables[0].Rows.Count;
        int cntAll = ds2.Tables[0].Rows.Count;
        cntAll = cntAll / pageSize + (cntAll % pageSize == 0 ? 0 : 1);
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
        //回送结果
        context.Response.Write(Builder.ToString());
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}