using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// article_list 的摘要说明
/// </summary>
public class Article_list
{

    public int id;
    public string aname;
    public string a_title;
    public string a_preface;
    public string img;
    public int playtimes;
    public string publishtime;
    public string brief;
    public string tid;
    public string t_name;
    public Article_list(int id, string aname, string a_title, string a_preface, string img, int playtimes, string publishtime, string brief, string tid, string t_name)
    {
        this.id = id;
        this.aname = aname;
        this.a_title = a_title;
        this.a_preface = a_preface;
        this.img = img;
        this.playtimes = playtimes;
        this.publishtime = publishtime;
        this.brief = brief;
        this.tid = tid;
        this.t_name = t_name;
    }
}