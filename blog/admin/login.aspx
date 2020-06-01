<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
	<title>后台登录-X-admin2.0</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">个人博客管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" action="api/login.ashx">
            <input name="username" placeholder="用户名"  type="text" lay-verify="username" class="layui-input" id="username">
            <hr class="hr15">
            <input name="password" lay-verify="password" placeholder="密码"  type="password" class="layui-input" id="password">
            <hr class="hr15">
            <div class="layui-unselect layui-form-radio " id="rmbUser">
                <i class="layui-anim layui-icon layui-anim-scaleSpring"></i>
                <div>记住密码</div>
            </div>
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="button" id="submit" lay-verify="ajax_sub">
            <hr class="hr20" >
        </form>
    </div>

    <script src="js/login.js"></script>
</body>
</html>
