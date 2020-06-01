$(function () {
    //显示相册列表
    //总页数
    var pages = 0;
    var pageIndex = 1;
    var parameter = "pageIndex=1";
    photo_list(parameter, "api/photo_list.ashx")
    page()

    //搜索
    //搜索
    $("#search").click(function () {
        //获取搜索的标题
        var tit = $("#search_tit").val();
        var parameter = jQuery.param({ "action": 'photo', "tit": tit, "pageIndex": 1 })
        photo_list(parameter, "api/search.ashx");
        page();

        $('.photo_del').click(function () {
            var id = $(this).attr("data-id");
            photoDel($(this), id)
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
        layui.use(['form', 'upload'], function () {
            var form = layui.form;
            //上传图片
            var upload = layui.upload; //得到 upload 对象
            //创建一个上传组件
            upload.render({
                elem: '#imgUpload'
                , accept: 'images' //允许上传的文件类型
                , size: 200 //最大允许上传的文件大小
                , url: 'api/pic_add.ashx'
                , done: function (res, index, upload) { //上传后的回调
                    $('#demo1').attr("src", "/" + res.imgPath)
                }
            })
        })
        $('#submit').click(function () {
            var title = $('#title').val();
            var img = $('#demo1').attr("src");
            var brief = $('#brief').val();
            if (title === "" || img === "" || brief == "") {
                return "必填项不能为空"
            } else {
                var _json = jQuery.param({ "action": action, "title": title, "img": img, "brief": brief});
                $.ajax({
                    url: "api/photo_edit.ashx",
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
                        photo_list(parameter, "api/photo_list.ashx")

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
    //修改
    else if (action == "edit") {
        $("#submit").html("修改")
        //先显示内容
        var id = getQueryVariable("id")
        var _json = jQuery.param({ "action": action, "id": id });
        layui.use(['form', 'upload'], function () {
            var form = layui.form;
            //上传图片
            var upload = layui.upload; //得到 upload 对象
            //创建一个上传组件
            upload.render({
                elem: '#imgUpload'
                , accept: 'images' //允许上传的文件类型
                , size: 200 //最大允许上传的文件大小
                , url: 'api/pic_add.ashx'
                , done: function (res, index, upload) { //上传后的回调
                    $('#demo1').attr("src", "/" + res.imgPath)
                }
            })
        })
        $.ajax({
            url: "api/photo_edit.ashx",
            type: "POST",
            async: false,
            data: _json,
            dataType: "json",
            // contentType: "charset=utf-8",
            cache: false,
            //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
            success: function (res) {
                //alert(res)
                var imgArr = res.data[0].img.split('|');
                $("#title").val(res.data[0].p_title);
                $("#demo1").attr("src", imgArr[0]);
                $("#brief").val(res.data[0].brief);


            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.readyState);
            }
        });
        //点击修改
        $("#submit").click(function () {
            
            var title = $('#title').val();
            var img = $('#demo1').attr("src");
            var brief = $('#brief').val();
            if (title === "" || img === "" || brief == "") {
                return "必填项不能为空"
            } else {
                var _json = jQuery.param({ "action": "update", "title": title, "img": img, "brief": brief,"id":id });
                $.ajax({
                    url: "api/photo_edit.ashx",
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
    $('.photo_del').click(function () {
        var id = $(this).attr("data-id");
        photoDel($(this), id)
    })

    //封装删除
    function photoDel(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //var id = $("#article_type_del").attr("data-id");
            var _json = jQuery.param({ "action": "del", "id": id });
            $.ajax({
                url: "api/photo_edit.ashx",
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
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', { icon: 1, time: 1000 });

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
                        photo_list(parameter, "api/photo_list.ashx")
                        $('.photo_del').click(function () {
                            var id = $(this).attr("data-id");
                            photoDel($(this), id)
                        })
                    }
                }
            });
        });
    }
        
    //封装相册
    function photo_list(parameter, url) {
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
                
                if (res.data === undefined) {
                    outStr = "<tr>暂无结果</tr>"
                } else {
                    for (let i in res.data) {
                        var imgArr = res.data[i].img.split('|')
                        var info = res.data[i].brief
                        if (info.length > 100) {
                            info = res.data[i].brief.substr(0,100) + "..."
                        }
                        
                        outStr += `<tr>
                                    <td>
                                      <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                                    </td>
                                    <td>`+res.data[i].id+`</td>
                                    <td>`+res.data[i].p_title+`</td>
                                    <td><img src="`+ imgArr[0] +`"/></td>
                                    <td class="info">`+ info +`</td>
                                    <td>`+ res.data[i].commend +`</td>
                                    <td>`+ res.data[i].p_time +`</td>
                                    <td class="td-manage">
                                      <button class="layui-btn layui-btn layui-btn-xs"  onclick="x_admin_show('编辑','photo_edit.aspx?action=edit&id=`+ res.data[i].id+`')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                                      <button class="layui-btn-danger layui-btn layui-btn-xs photo_del" data-id="`+ res.data[i].id+`" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
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