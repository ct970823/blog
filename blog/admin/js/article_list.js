$(function () {
    //总页数
    var pages = 0;
    //文章列表渲染

    var parameter = "pageIndex=1";
    getArticle(parameter, "api/article_list.ashx")
    //分类
    $.ajax({
        url: "api/article_type.ashx",
        type: "POST",
        async: false,
        dataType: "json",
        // contentType: "charset=utf-8",
        cache: false,
        //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
        success: function (res) {
            var outStr = "<option> 分类</option>";
            for (let i in res.data) {
                outStr += "<option value=\"" + res.data[i].id + "\">" + res.data[i].t_name + "</option>"
            }
            $('.secect_list').append(outStr);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.readyState);
        }
    });
    var pageIndex = 1;
    page();
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
                        $('.list_info').html("");
                        parameter = "pageIndex=" + pageIndex;
                        getArticle(parameter, "api/article_list.ashx")
                        $('.delItem').click(function () {
                            var id = $(this).attr("data-id");
                            console.log(id)
                            member_del($(this), id);
                        })
                    }
                }
            });
        });
    }
    
    var tid = 1;
    //select选中的值
    layui.use('form', function () {
        var form = layui.form;
        form.on('select()', function (data) {
            //console.log(data.elem); //得到select原始DOM对象
            //console.log(data.value); //得到被选中的值
            //console.log(data.othis); //得到美化后的DOM对象
            tid = data.value;
            console.log(tid)
        });
    })
    //搜索
    $('#search').click(function () {
        //获取搜索的标题
        var tit = $("#search_tit").val();
        var parameter = jQuery.param({ "action": 'article_list', "tid": tid, "tit": tit, "pageIndex": 1 })
        getArticle(parameter, "api/search.ashx");
        page();
        $('.delItem').click(function () {
            var id = $(this).attr("data-id");
            console.log(id)
            member_del($(this), id);
        })
    })


    //封装文章函数
    function getArticle(parameter,url) {
        $('.list_info').html("");
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
                        outStr += `<tr>
                                    <td>
                                        <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                                    </td>
                                    <td>`+res.data[i].id+`</td>
                                    <td>`+res.data[i].t_name+`</td>
                                    <td>`+res.data[i].aname+`</td>
                                    <td>`+res.data[i].a_title+`</td>
                                    <td>`+res.data[i].a_preface+`</td>
                                    <td><img src="../`+ res.data[i].img +`"></td>
                                    <td>`+res.data[i].brief+`</td>
                                    <td>`+res.data[i].playtimes+`</td>
                                    <td>`+res.data[i].publishtime+`</td>
                                    <td class="td-manage">
                                        <a title="查看" onclick="x_admin_show('编辑','article_edit.aspx?action=edit&id=`+res.data[i].id+`')" href="javascript:;">
                                            <i class="layui-icon">&#xe63c;</i>
                                        </a>
                                        <a title="删除" class="delItem" data-id="`+res.data[i].id+`"  href="javascript:;">
                                            <i class="layui-icon">&#xe640;</i>
                                        </a>
                                    </td>
                                </tr >`;
                    }
                }
                pages = res.cntAll;
                $('.list_info').append(outStr);
                
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.readyState);
            }
        });
    }

    $('.delItem').click(function () {
        var id = $(this).attr("data-id");
        console.log(id)
        member_del($(this), id);
    })
    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            var parameter = jQuery.param({ "tid": id });
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
                    if (res.r > 0) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', { icon: 1, time: 1000 });
                        $('.list_info').html("");
                        parameter = "pageIndex=" + pageIndex;
                        getArticle(parameter)
                        console.log(pages)
                        layui.use('laypage', function () {
                            var laypage = layui.laypage;
                            //执行一个laypage实例
                            laypage.render({
                                elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
                                , count: pages //数据总数，从服务端得到,
                                , curr: pageIndex
                                , limit: 4//每页条数
                                , jump: function (obj, first) {
                                    //obj包含了当前分页的所有参数，比如：
                                    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                                    //console.log(obj.limit); //得到每页显示的条数
                                    pageIndex = obj.curr;
                                    //首次不执行
                                    if (!first) {
                                        $('.list_info').html("");
                                        parameter = "pageIndex=" + pageIndex;
                                        getArticle(parameter)
                                        $('.delItem').click(function () {
                                            var id = $(this).attr("data-id");
                                            console.log(id)
                                            member_del($(this), id);
                                        })
                                    }
                                }
                            });
                            $('.delItem').click(function () {
                                var id = $(this).attr("data-id");
                                console.log(id)
                                member_del($(this), id);
                            })
                        });
                    }

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.readyState);
                }
            });

        });

    }
    //批量删除
    //$("#delAll").clcik(function () {
    //    layer.confirm('确认要删除吗？' + data, function (index) {
    //        //捉到所有被选中的，发异步进行删除
    //        var tid = [];
    //        $(".js-movies :checkbox").each(function (index, item) {
    //            if (this.checked) {
    //                delList.push($(item).val());
    //            }
    //        });
    //        layer.msg('删除成功', { icon: 1 });
    //        $(".layui-form-checked").not('.header').parents('tr').remove();
    //    });
    //})
    //function delAll(argument) {

    //    var data = tableCheck.getData();

        
    //}

})