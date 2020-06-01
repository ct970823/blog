using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Photo 的摘要说明
/// </summary>
public class Photo
{
    public int id;
    public string p_time;
    public string p_title;
    public string brief;
    public string img;
    public int commend;
    public Photo(int id, string p_time, string p_title, string brief, string img, int commend)
    {
        this.id = id;
        this.p_time = p_time;
        this.p_title = p_title;
        this.brief = brief;
        this.img = img;
        this.commend = commend;
    }
}