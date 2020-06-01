$(function () {
    var id = 1;
    var name = $("#username").val();
    var _json = jQuery.param({ "name": name });
    $.ajax({
        url: "api/user.ashx",
        type: "POST",
        async: false,
        data: _json,
        dataType: "json",
        // contentType: "charset=utf-8",
        cache: false,
        //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
        success: function (res) {
            id = res.data[0].id;

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.readyState);
        }
    });

    $("#submit").click(function () {
        var name = $("#username").val();
        var pwd = $("#password").val();
        var repwd = $("#repwd").val();
        if (pwd.length < 6 || pwd.length > 16) {
            layer.msg('密码长度要在6-16个字符之间!', { icon: 2, time: 1000 });
        }
        else if (pwd != repwd) {
            layer.msg('两次密码不一致!', { icon: 2, time: 1000 });
        } else {
            var _json = jQuery.param({ "name": name, "pwd": pwd, "id": id });
            $.ajax({
                url: "api/user_edit.ashx",
                type: "POST",
                async: false,
                data: _json,
                dataType: "text",
                // contentType: "charset=utf-8",
                cache: false,
                //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
                success: function (res) {
                    
                    layer.msg('修改成功!', { icon: 6, time: 1000 });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.readyState);
                }
            });
        }
        
    })



    
    
})