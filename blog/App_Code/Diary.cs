using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Diary 的摘要说明
/// </summary>
public class Diary
{
    public int id;
    public string d_time;
    public string d_title;
    public string d_info;
    public int playtimes;
    public Diary(int id, string d_time, string d_title, string d_info, int playtimes)
    {
        this.id = id;
        this.d_time = d_time;
        this.d_title = d_title;
        this.d_info = d_info;
        this.playtimes = playtimes;
    }
}