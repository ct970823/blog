<%@ Page Language="C#" AutoEventWireup="true" CodeFile="diary_list.aspx.cs" Inherits="admin_diary_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
    <title>日记列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>日记列表</cite></a>
      </span>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <div class="layui-form layui-col-md12 x-so">

          <input type="text" name="username"  placeholder="请输入日记标题" autocomplete="off" class="layui-input" id="search_tit">
          <button class="layui-btn" id="search"><i class="layui-icon">&#xe615;</i></button>
        </div>
      </div>
      <xblock>
        <%--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>--%>
        <button class="layui-btn" onclick="x_admin_show('添加日记','./diary_edit.aspx?action=add')"><i class="layui-icon"></i>添加</button>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>id</th>
            <th>标题</th>
            <th>内容</th>
            <th>点赞数量</th>
            <th>时间</th>
            <th>操作</th>
            </tr>
        </thead>
        <tbody class="x-cate">
          
        </tbody>
      </table>
      <div class="page" id="pages1">
        
      </div>

    </div>
      <script src="js/diary.js"></script>
  </body>
</html>
