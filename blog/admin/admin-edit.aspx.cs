using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin_edit : System.Web.UI.Page
{
    public string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        // 未登录跳转
        if (Session["userId"] == null)
        {
            Response.Redirect("login.aspx");
        }
        username = Session["userName"].ToString();
    }
}