<%@ Page Language="C#" AutoEventWireup="true" CodeFile="photo_edit.aspx.cs" Inherits="admin_photo_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
    <title>相册</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
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
    <div class="x-body">
        <div class="layui-form">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>标题
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="title" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>图片
              </label>
              <div class="layui-input-inline">
                  <div class="layui-upload">
                      <button type="button" class="layui-btn" id="imgUpload">上传图片</button><input class="layui-upload-file" type="file" accept="undefined" name="file">
                      <div class="layui-upload-list">
                          <img class="layui-upload-img" id="demo1"  style="width: 92px;height: 92px;margin: 0 10px 10px 0;">
                          <!--<p id="demoText"><span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a></p>-->
                      </div>
                  </div>
              </div>
          </div>
          <div class="layui-form-item layui-form-text">
              <label for="desc" class="layui-form-label">
                  <span class="x-red">*</span>内容
              </label>
              <div class="layui-input-block">
                  <textarea placeholder="请输入内容" id="brief" name="desc" class="layui-textarea" required=""></textarea>
              </div>
          </div>
            
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="" id="submit">
                  增加
              </button>
          </div>
      </div>
    </div>
      <script src="js/photo.js"></script>
  </body>
</html>
