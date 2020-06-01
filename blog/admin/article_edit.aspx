<%@ Page Language="C#" AutoEventWireup="true" CodeFile="article_edit.aspx.cs" Inherits="admin_article_edit" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
    <title>文章</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script src="js/article_edit.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form">
            
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>分类
                </label>
                <div class="layui-input-inline">
                    <select id="selectItem" name="shipping" class="valid">
                        <%--<option value="shentong">1</option>
                        <option value="shunfeng">2</option>--%>
                    </select>
                </div>
            </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>作者
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="name"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>标题
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="title" name="title" required="" lay-verify="title"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>前言
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="preface" name="preface" required="" lay-verify="preface"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>图片
              </label>
              <div class="layui-input-inline">
                  <!---->
                  <div class="layui-upload">
                      <button type="button" class="layui-btn" id="imgUpload">上传图片</button><input class="layui-upload-file" type="file" accept="undefined" name="file" >
                      <div class="layui-upload-list">
                          <img class="layui-upload-img" id="demo1"  style="width: 92px;height: 92px;margin: 0 10px 10px 0;" >
                          <%--<p id="demoText"><span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a></p>--%>
                      </div>
                  </div>
              </div>
          </div>
          <div class="layui-form-item layui-form-text">
              <label for="desc" class="layui-form-label">
                  <span class="x-red">*</span>内容
              </label>
              <div class="layui-input-block">
                  <textarea placeholder="请输入内容" id="brief" name="brief" class="layui-textarea" lay-verify="brief" required=""></textarea>
              </div>
          </div>
            <%--<div class="layui-form-item playtimes">
                <label for="username" class="layui-form-label">
                    点赞数量
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="playtimes" name="playtimes" required="" lay-verify="playtimes"
                           autocomplete="off" class="layui-input">
                </div>
            </div>--%>

          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn"  id="submit"">
                  增加
              </button>
          </div>
      </form>
    </div>
      
</body>
</html>
