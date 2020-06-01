<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gbook.aspx.cs" Inherits="gbook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
<title>留言</title>
  <meta name="keywords" content="个人博客,陈涛个人博客" />
  <meta name="description" content="陈涛个人博客" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/m.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
    <header>
  <div class="logo"><a href="index.aspx"><img src="images/logo.png"></a></div>
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
  <div class="gbook">
    <div class="comment">
      <ul class="comment_pic">
        <span>头像：</span>
        <li><img src="images/header/face1.gif" alt=""></li>
        <li><img src="images/header/face2.gif" alt=""></li>
        <li><img src="images/header/face3.gif" alt=""></li>
        <li><img src="images/header/face4.gif" alt=""></li>
        <li><img src="images/header/face5.gif" alt=""></li>
        <li><img src="images/header/face6.gif" alt=""></li>
        <li><img src="images/header/face7.gif" alt=""></li>
        <li><img src="images/header/face8.gif" alt=""></li>
      </ul>
      <div class="nickname">
        <span>昵称：</span>
        <input type="text">
          <span class="tips"></span>
      </div>
      <div class="words">
          <textarea name="" id="" cols="30" rows="10" class="comment_info"></textarea>
          <p>300</p>
      </div>    
      <button class="fb">发表</button>
    </div>
     <ul class="about" style="border-bottom: 1px solid">
     最新留言
     </ul>
    <div class="list">
      
      
      </div>
  </div>
</article>
<footer>
  <p>Copyright ©2018 陈涛个人博客</p>
</footer>
    <a href="#" class="cd-top cd-is-visible">Top</a>
<script src="js/jquery.min.js"></script>
    <script src="js/nav.js"></script>
    <script src="js/top.js"></script>
    <script src="js/gbook.js"></script>
</body>
</html>
