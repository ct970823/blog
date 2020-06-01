<%@ WebHandler Language="C#" Class="pic_add" %>

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

public class pic_add : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        HttpFileCollection postedFile = context.Request.Files;
        bool fileUploaded = false;
        string imgPath = "";
        string msg = string.Empty;
        string error = string.Empty;
        if (postedFile.Count > 0)
        {
            string savepath = "";
            string tempPath = "";
            tempPath = System.Web.HttpContext.Current.Server.MapPath("/\\upload\\");
            savepath = tempPath; //context.Server.MapPath(tempPath);  

            for (int i = 0; i < postedFile.Count; i++)
            {
                string filename = postedFile[i].FileName;


                if (!String.IsNullOrEmpty(filename))
                {
                    string sExtension = filename.Substring(filename.LastIndexOf('.'));
                    if (!Directory.Exists(savepath))
                        Directory.CreateDirectory(savepath);
                    string sNewFileName = Guid.NewGuid().ToString("N");
                    //if (i == 0)
                    //{
                    //    imgPath = @"upload/" + sNewFileName + sExtension;
                    //}
                    //else
                    //{
                    //    videoPath = @"upload/" + sNewFileName + sExtension;
                    //}
                    imgPath = @"upload/" + sNewFileName + sExtension;
                    postedFile[i].SaveAs(savepath + @"\" + sNewFileName + sExtension);

                    msg = " 成功! ";
                    error = "0";
                    fileUploaded = true;
                    context.Response.Write("{\"error\":\"" + error + "\", \"msg\":\"" + msg + "\",\"imgPath\":\""+imgPath+"\"}");
                }
                else
                {
                    msg = " 文件未选择! ";
                    error = "1";
                    context.Response.Write("{\"error\":\"" + error + "\", \"msg\":\"" + msg + "\"}");
                }

            }


        }
        else
        {
            msg = "没有选择文件";
            error = "1";
            context.Response.Write("{\"error\":\"" + error + "\", \"msg\":\"" + msg + "\"}");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}