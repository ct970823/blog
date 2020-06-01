<%@ Page Language="C#" AutoEventWireup="true" CodeFile="infopic.aspx.cs" Inherits="infopic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
<title>相册详情</title>
  <meta name="keywords" content="个人博客,陈涛个人博客" />
  <meta name="description" content="陈涛个人博客" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/infopic.css" rel="stylesheet">
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
    </ul>
  </div>
<article>
  <div class="picsbox">
    <div class="bodymodal"></div>
    <!--播放到第一张图的提示-->
    <div class="firsttop">
      <div class="firsttop_right">
        <div class="close2"> <a class="closebtn1" title="关闭" href="javascript:void(0)"></a> </div>
        <div class="replay">
          <h2 id="div-end-h2"> 已到第一张图片了。 </h2>
          <p> <a class="replaybtn1" href="javascript:;">重新播放</a> </p>
        </div>
      </div>
    </div>
    <!--播放到最后一张图的提示-->
    <div class="endtop">
      <div class="firsttop_right">
        <div class="close2"> <a class="closebtn2" title="关闭" href="javascript:void(0)"></a> </div>
        <div class="replay">
          <h2 id="H1"> 已到最后一张图片了。 </h2>
          <p> <a class="replaybtn2" href="javascript:;">重新播放</a> </p>
        </div>
      </div>
    </div>
    <!--弹出层结束--> 
    <!--图片特效内容开始-->
    <div class="piccontext">
      <h2></h2>
      <div class="source">
        <div class="source_left"><span></span> </div>
        <div class="source_right"> <a href="javascript:;" class="list">列表查看</a> </div>
        <div class="source_right1"> <a href="javascript:;" class="gaoqing">高清查看</a> </div>
      </div>
      <!--大图展示-->
      <div class="picshow">
        <div class="picshowtop"> <a href="#"><img src="" alt="\" id="pic1" curindex="0" /></a> <a id="preArrow" href="javascript:void(0)" class="contextDiv" title="上一张"><span id="preArrow_A"></span></a> <a id="nextArrow" href="javascript:void(0)" class="contextDiv" title="下一张"><span id="nextArrow_A"></span></a> </div>
        <div class="picshowtxt">
          <div class="picshowtxt_left"><span>1</span>/<i></i></div>
          <div class="picshowtxt_right"></div>
        </div>
        <div class="picshowlist">
          <div class="picshowlist_mid">
            <div class="picmidleft"> <a href="javascript:void(0)" id="preArrow_B"><span class="sleft"></span></a> </div>
            <div class="picmidmid">
              <ul>
                <%--<li> <a href="javascript:void(0);"><img src="images/1.jpg" alt="" bigimg="images/1.jpg" text="《古剑》小师妹迪丽热巴清新写真宛若小仙女" /></a></li>--%>
              </ul>
            </div>
            <div class="picmidright"> <a href="javascript:void(0)" id="nextArrow_B"><span class="sright"></span></a> </div>
          </div>
        </div>
      </div>
      
      <!--列表展示-->
      <div class="piclistshow">
        <ul>
          
        </ul>
      </div>
    </div>
    <div class="pictext">
      <ul>
      </ul>
    </div>
    <div class="share">
      <p class="diggit">很赞哦！(<b id="diggnum">13</b>)</p>
    </div>
  </div>
</article>
<footer>
  <p>Design by <a href="http://www.yangqq.com" target="_blank">杨青个人博客</a> <a href="/">蜀ICP备11002373号-1</a></p>
</footer>
<a href="#" class="cd-top cd-is-visible">Top</a>
    <script src="js/jquery.min.js"></script>
    <script src="js/infoPic.js"></script>
    <script src="js/nav.js"></script>
    <script src="js/top.js"></script>
    <script src="js/piccontent.min.js" type="text/javascript"></script>
</body>
</html>
