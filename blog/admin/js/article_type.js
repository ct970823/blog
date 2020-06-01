$(function () {
    //显示文章分类
    //总页数
    var pages = 0;
    var pageIndex = 1;
    var parameter = "pageIndex=1";
    article_type(parameter, "api/article_type2.ashx")
    page();
    
    //搜索
    $("#search").click(function () {
        //获取搜索的标题
        var tit = $("#search_tit").val();
        var parameter = jQuery.param({ "action": 'article_type',"tit": tit, "pageIndex": 1 })
        article_type(parameter, "api/search.ashx");
        page();

        $('.article_type_del').click(function () {
            var id = $(this).attr("data-id");
            articleTypeDel($(this), id)
        })
    })

    
    //封装获取url参数
    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) { return pair[1]; }
        }
        return (false);
    }
    //查看地址栏的参数
    var action = getQueryVariable("action");
    //增加
    if (action == "add") {
        $('#submit').html("添加")
        
        $('#submit').click(function () {
            var t_name = $('#t_name').val();
            if (t_name === "") {
                return "分类名不能为空"
            } else {
                var _json = jQuery.param({ "action": action, "t_name": t_name});
                $.ajax({
                    url: "api/article_type_edit.ashx",
                    type: "POST",
                    async: false,
                    data: _json,
                    dataType: "text",
                    // contentType: "charset=utf-8",
                    cache: false,
                    //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
                    success: function (res) {
                        //alert(res)
                        if (res == "成功") {
                            layer.alert("增加成功", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                            

                        } else {
                            layer.alert("增加失败", { icon: 2 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                        parameter = "pageIndex=1";
                        article_type(parameter, "api/article_type2.ashx")
                        
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        //alert(XMLHttpRequest.readyState);
                        layer.alert("增加失败", { icon: 2 }, function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }
                });
                //return false;
            }
        })
    }
    else if (action == "edit") {//修改
        var name = getQueryVariable("t_name");
        name = decodeURI(name)
        $("#t_name").val(name);
        $('#submit').html("修改")
        $("#submit").click(function () {
            var id = getQueryVariable("id");
            var t_name = $('#t_name').val();
            if (t_name === "") {
                return "分类名不能为空"
            } else {
                var _json = jQuery.param({ "action": action, "t_name": t_name,"id":id });
                $.ajax({
                    url: "api/article_type_edit.ashx",
                    type: "POST",
                    async: false,
                    data: _json,
                    dataType: "text",
                    // contentType: "charset=utf-8",
                    cache: false,
                    //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
                    success: function (res) {
                        //alert(res)
                        if (res == "成功") {
                            layer.alert("修改成功", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });


                        } else {
                            layer.alert("修改失败", { icon: 2 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                        

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        //alert(XMLHttpRequest.readyState);
                        layer.alert("修改失败", { icon: 2 }, function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }
                });
                
            }
            
        })
        
    }

    //删除
    $('.article_type_del').click(function () {
        var id = $(this).attr("data-id");
        articleTypeDel($(this),id)
    })

    //封装删除
    function articleTypeDel(obj,id) {
            layer.confirm('确认要删除吗？', function (index) {
                //var id = $("#article_type_del").attr("data-id");
                var _json = jQuery.param({ "action": "del", "id": id });
                $.ajax({
                    url: "api/article_type_edit.ashx",
                    type: "POST",
                    async: false,
                    data: _json,
                    dataType: "text",
                    // contentType: "charset=utf-8",
                    cache: false,
                    //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
                    success: function (res) {
                        //alert(res)
                        if (res == "成功") {
                            layer.alert("删除成功", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                            //$(obj).parents("tr").remove();
                            layer.msg('已删除!', { icon: 1, time: 1000 });
                            article_type(parameter, "api/article_type2.ashx")

                        } else {
                            layer.alert("删除失败", { icon: 2 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }


                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        //alert(XMLHttpRequest.readyState);
                        layer.alert("删除失败", { icon: 2 }, function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }
                });


            })

        
    }
    

    //分页
    function page() {
        layui.use('laypage', function () {
            var laypage = layui.laypage;

            //执行一个laypage实例
            laypage.render({
                elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
                , count: pages //数据总数，从服务端得到
                , limit: 4//每页条数
                , jump: function (obj, first) {
                    //obj包含了当前分页的所有参数，比如：
                    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    //console.log(obj.limit); //得到每页显示的条数
                    pageIndex = obj.curr;
                    //首次不执行
                    if (!first) {
                        console.log(pageIndex)
                        $('.x-cate').html("");
                        parameter = "pageIndex=" + pageIndex;
                        article_type(parameter, "api/article_type2.ashx")
                        $('.article_type_del').click(function () {
                            var id = $(this).attr("data-id");
                            articleTypeDel($(this), id)
                        })
                    }
                }
            });
        });
    }

    //封装文章分类
    function article_type(parameter,url) {
        $('.x-cate').html("");
        var outStr = "";
        $.ajax({
            url: url,
            type: "POST",
            async: false,
            data: parameter,
            dataType: "json",
            // contentType: "charset=utf-8",
            cache: false,
            //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
            success: function (res) {
                console.log(res)
                if (res.data === undefined) {
                    outStr = "<tr>暂无结果</tr>"
                } else {
                    for (let i in res.data) {
                        outStr += `<tr cate-id='1' fid='0' >
                                    <td>
                                      <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                                    </td>
                                    <td>`+res.data[i].id+`</td>
                                    <td>
                                      `+res.data[i].t_name+`
                                    </td>
                                    <td class="td-manage">
                                      <button class="layui-btn layui-btn layui-btn-xs"  onclick="x_admin_show('编辑','article_type_edit.aspx?action=edit&id=`+ res.data[i].id + `&t_name=`+res.data[i].t_name+`')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                                      <button class="layui-btn-danger layui-btn layui-btn-xs article_type_del" data-id="`+res.data[i].id+`" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
                                    </td>
                                  </tr>`;
                    }
                }
                pages = res.cntAll;
                $('.x-cate').append(outStr);

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.readyState);
            }
        });
    }
})