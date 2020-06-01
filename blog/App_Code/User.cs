using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// User 的摘要说明
/// </summary>
public class User
{
    public int id;
    public string name;
    public string pwd;
    public int limit;
    public User(int id, string name, string pwd, int limit)
    {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.limit = limit;
    }
}