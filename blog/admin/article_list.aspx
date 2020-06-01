<%@ Page Language="C#" AutoEventWireup="true" CodeFile="article_list.aspx.cs" Inherits="admin_article_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
    <title>文章列表</title>
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
    <style>
        td>p{
            display:none;
        }
        td>p:first-child{
            display:block;
            max-height:100px;
            overflow:hidden;
        }
        td>div{
            max-height:100px;
            overflow:hidden;
        }
        td{
            max-width:200px;
        }
    </style>
</head>
<body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>文章列表</cite></a>
      </span>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <div class="layui-form layui-col-md12 x-so">
          <div class="layui-input-inline">
            <select name="contrller" class="secect_list">
            </select>
          </div>
            <input id="handle_status" value="" hidden="hidden">
          <input type="text" name="username"  placeholder="请输入文章标题" autocomplete="off" class="layui-input" id="search_tit">
          <button class="layui-btn" id="search"><i class="layui-icon">&#xe615;</i></button>
        </div>
      </div>
      <xblock>
        <%--<button class="layui-btn layui-btn-danger" id="delAll"><i class="layui-icon"></i>批量删除</button>--%>
        <button class="layui-btn" onclick="x_admin_show('添加文章','./article_edit.aspx?action=add')"><i class="layui-icon"></i>添加</button>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>id</th>
            <th>分类</th>
            <th>作者</th>
            <th>标题</th>
            <th>前言</th>
            <th>图片</th>
            <th>内容</th>
            <th>点赞数量</th>
            <th>发表时间</th>
            <th>操作</th>
            </tr>
        </thead>
        <tbody class="list_info">
          <%--<tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>2017009171822298053</td>
            <td>老王:18925139194</td>
            <td>7829.10</td>
            <td>7854.10</td>
            <td>待确认</td>
            <td>未支付</td>
            <td>未发货</td>
            <td>其他方式</td>
            <td>申通物流</td>
            <td class="td-manage">
              <a title="查看"  onclick="x_admin_show('编辑','article_edit.aspx?action=edit')" href="javascript:;">
                <i class="layui-icon">&#xe63c;</i>
              </a>
              <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>--%>
        </tbody>
      </table>
      <div class="page" id="test1">
        <%--<div>
          <a class="prev" href="">&lt;&lt;</a>
          <a class="num" href="">1</a>
          <span class="current">2</span>
          <a class="num" href="">3</a>
          <a class="num" href="">489</a>
          <a class="next" href="">&gt;&gt;</a>
        </div>--%>
      </div>

    </div>
    <script src="js/article_list.js"></script>
    <%--<script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });
        /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            var parameter = jQuery.param({"id": id});
            $.ajax({
                url: "api/article_del.ashx",
                type: "POST",
                async: false,
                data: parameter,
                dataType: "json",
                // contentType: "charset=utf-8",
                cache: false,
                //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
                success: function (res) {
                    if (res.r>0) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', { icon: 1, time: 1000 });
                        parameter = "pageIndex=" + pageIndex;
                        getArticle(parameter)
                    }
                    
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.readyState);
                }
            });
            
        });
    }
      
    </script>--%>
    <%--<script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>--%>
</body>
</html>
