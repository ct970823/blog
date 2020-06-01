using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Gbook 的摘要说明
/// </summary>
public class Gbook
{
    public int id;
    public string g_time;
    public string g_name;
    public string g_img;
    public string g_info;
    public Gbook(int id,string g_time, string g_name, string g_img,string g_info)
    {
        this.id = id;
        this.g_time = g_time;
        this.g_name = g_name;
        this.g_img = g_img;
        this.g_info = g_info;
    }
}