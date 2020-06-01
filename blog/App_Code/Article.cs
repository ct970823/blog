using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Article 的摘要说明
/// </summary>
public class Article
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
    public Article(int id, string aname, string a_title, string a_preface, string img, int playtimes, string publishtime, string brief, string tid)
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
    }
}