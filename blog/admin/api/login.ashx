<%@ WebHandler Language="C#" Class="login" %>

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
using System.Web.SessionState;//第一步：导入此命名空间

public class login : IHttpHandler, IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        //指定接收数据的类型
        context.Response.ContentType = "application/json";
        //接收数据
        string userName = context.Request["userName"];
        string passWord = context.Request["passWord"];
        string outstr = doSelect(userName, passWord);
        //回送结果
        context.Response.Write(outstr);
    }
 
    public string doSelect(string username, string password)
    {

        string msg = "";
        int i = 0;

        string demo = MD5.getMD5(password);
            //执行插入操作，并获得影响的行数
            DataSet result = DBHelper.getDataSet("select id,name,pwd,limit from admins where name = '" + username + "' and pwd = '" + MD5.getMD5(password) + "'");
            i = result.Tables[0].Rows.Count;
            if (i > 0)
            {
                msg = "登录成功";
                HttpContext.Current.Session["userId"] = result.Tables[0].Rows[0][0].ToString();
                HttpContext.Current.Session["userName"] = result.Tables[0].Rows[0][1].ToString();
                HttpContext.Current.Session["userLimit"] = result.Tables[0].Rows[0][3].ToString();
            }
            else
            {
                msg = "账号或密码错误";
            }

        StringBuilder Builder = new StringBuilder();
        Builder.Append("{");
        Builder.Append("\"r\":" + i + "");
        Builder.Append(",\"data\":\"" + msg + "\"");
        Builder.Append("}");
        return Builder.ToString();
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}