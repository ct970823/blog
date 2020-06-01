<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
<title>首页</title>
<meta name="keywords" content="个人博客,陈涛个人博客" />
<meta name="description" content="陈涛个人博客" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link href="css/base.css" rel="stylesheet"/>
<link href="css/index.css" rel="stylesheet"/>
<link href="css/m.css" rel="stylesheet"/>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
    <header>
  <div class="logo"><a href="index.aspx"><img src="images/logo.png"/></a></div>
  <nav id="nav">
    <ul>
      <li><a href="index.aspx">网站首页</a></li>
      <li><a href="photo.aspx">我的相册</a></li>
      <li><a href="diary.aspx">我的日记</a></li>
      <li><a href="about.aspx">关于我</a></li>
      <li><a href="gbook.aspx">留言</a></li>
      <li><a href="admin/login.aspx">后台登录</a></li>
    </ul>
  </nav>   
 
</header>
<div class="mnav">
    <ul>
      <li><a href="index.aspx">首页</a></li>
      <li><a href="photo.aspx">相册</a></li>
      <li><a href="diary.aspx">日记</a></li>
      <li><a href="about.aspx">关于</a></li>
      <li><a href="gbook.aspx">留言</a></li>
        <li><a href="admin/login.aspx">后台登录</a></li>
    </ul>
  </div>
<article>
  <div class="l_box">
    <div class="search">
      <form action="" method="post" name="searchform" id="searchform">
        <input name="keyboard" id="keyboard" class="input_text" placeholder="请输入关键字词" style="color: rgb(153, 153, 153);"  type="text"/>
        <input name="button" class="input_submit" value="搜索" type="button"/>
      </form>
    </div>
    <div class="fenlei">
      <h2>文章分类</h2>
      <ul>
        
      </ul>
    </div>
    
    <div class="guanzhu">
      <h2>关注我 么么哒</h2>
      <ul>
        <img src="images/wx.png">
      </ul>
    </div>
  </div>
  <div class="r_box">
    <ul></ul>
     <div class="pagelist">
         <p>加载更多</p>
         <div class="more_list"></div>
    </div>
  </div>
   
</article>
<footer>
  <p>Copyright ©2018 陈涛个人博客</p>
</footer>
<a href="javascript:;" class="cd-top cd-is-visible">Top</a>
    <script src="js/jquery.min.js"></script>
    <script src="js/nav.js"></script>
    <script src="js/top.js"></script>
    <script src="js/index.js"></script>
</body>

</html>
