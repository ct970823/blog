$(function () {
    //显示类别
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
            var outStr = "";
            for (let i in res.data) {
                outStr += "<option value=\"" + res.data[i].id + "\">" + res.data[i].t_name + "</option>"
            }
            $('#selectItem').append(outStr);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.readyState);
        }
    });
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

    if (action == "add") {
        //$(".playtimes").hide();
        var tid = 1;
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

            form.on('select()', function (data) {
                //console.log(data.elem); //得到select原始DOM对象
                //console.log(data.value); //得到被选中的值
                //console.log(data.othis); //得到美化后的DOM对象
                tid = data.value;
            });
            
            
        })
        $('#submit').click(function () {
            var name = $('#username').val();
            var title = $('#title').val();
            var preface = $('#preface').val();
            var img = $('#demo1').attr("src");
            var brief = $('#brief').val();
            if (name == "") {
                return '作者不能为空';
                layer.msg("作者不能为空", { icon: 2 });
            }
            if (title == "") {
                return '标题不能为空';
                layer.msg("标题不能为空", { icon: 2 });
            }
            if (preface == "") {
                return '前言不能为空';
                layer.msg("前言不能为空", { icon: 2 });
            }
            if (brief == "") {
                return '内容不能为空';
                //layer.msg("内容不能为空", { icon: 2 });
            }
            var parameter = jQuery.param({ "action": action, "name": name, "title": title, "preface": preface, "img": img, "brief": brief, "tid": tid });
            $.ajax({
                url: "api/article_add.ashx",
                type: "POST",
                async: true,
                data: parameter,
                dataType: "text",
                // contentType: "charset=utf-8",
                cache: false,
                //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
                success: function (res) {
                    //alert(res)
                    layer.alert("增加成功", { icon: 6 }, function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                    });
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
            return false;
        })
    } else {
        var id = getQueryVariable("id")
        var parameter = jQuery.param({ "action": action, "id": id });
        $('#submit').html("修改");
        var tid = 1;
        $.ajax({
            url: "api/article_edit.ashx",
            type: "POST",
            async: true,
            data: parameter,
            dataType: "json",
            // contentType: "charset=utf-8",
            cache: false,
            //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
            success: function (res) {
                //alert(res)
                $('#username').val(res.data[0].aname);
                $('#title').val(res.data[0].a_title);
                $('#preface').val(res.data[0].a_preface);
                //console.log(res.data[0].img);
                $('#demo1').attr("src","/" + res.data[0].img);
                $('#brief').val(res.data[0].brief);
                var select = 'dd[lay-value=' + res.data[0].tid + ']';
                //更改默认下拉选中
                layui.use(['form', 'upload'], function () {
                    var form = layui.form;
                    form.render('select')
                    //更改默认下拉选中
                    $('#selectItem').siblings("div.layui-form-select").find('dl').find(select).click()

                    //上传图片
                    var upload = layui.upload; //得到 upload 对象
                    //创建一个上传组件
                    upload.render({
                        elem: '#imgUpload'
                        , accept: 'images' //允许上传的文件类型
                        , size: 200 //最大允许上传的文件大小
                        , url: 'api/pic_add.ashx'
                        , done: function (res, index, upload) { //上传后的回调
                            $('#demo1').attr("src", res.imgPath)
                        }
                    })

                    form.on('select()', function (data) {
                        //console.log(data.elem); //得到select原始DOM对象
                        //console.log(data.value); //得到被选中的值
                        //console.log(data.othis); //得到美化后的DOM对象
                        tid = data.value;
                    });


                })
                
                //获取输入框的内容
                
                $('#submit').click(function () {
                    var id = res.data[0].id;
                    var name = $('#username').val();
                    var title = $('#title').val();
                    var preface = $('#preface').val();
                    var img = $('#demo1').attr("src");
                    var brief = $('#brief').val();
                    var parameter = jQuery.param({ "action": action, "id": id, "name": name, "title": title, "preface": preface, "img": img, "brief": brief, "tid": tid });
                    $.ajax({
                        url: "api/article_update.ashx",
                        type: "POST",
                        async: true,
                        data: parameter,
                        dataType: "text",
                        // contentType: "charset=utf-8",
                        cache: false,
                        //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
                        success: function (res) {
                            //alert(res)
                            layer.alert("修改成功", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                                
                            });
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
                    return false;
                })

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.readyState);
                
            }
        });
    }
    
})