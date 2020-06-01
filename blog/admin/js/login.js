$(function () {
    $('#rmbUser').click(function () {
        $(this).toggleClass('layui-form-radioed')
    })
    //cookie记住用户名和密码
    function saveUserInfo() {
        if ($("#rmbUser").hasClass("layui-form-radioed")) {
            var userName = $("#username").val();
            var passWord = $("#password").val();
            $.cookie("rmbUser", "true", { expires: 7 }); // 存储一个带7天期限的 cookie
            $.cookie("userName", userName, { expires: 7 }); // 存储一个带7天期限的 cookie
            $.cookie("passWord", passWord, { expires: 7 }); // 存储一个带7天期限的 cookie
        }
        else {
            $.cookie("rmbUser", "false", { expires: -1 });        // 删除 cookie
            $.cookie("userName", '', { expires: -1 });
            $.cookie("passWord", '', { expires: -1 });
        }
    };
    //初始化页面时验证是否记住了密码
    $(document).ready(function () {
        if ($.cookie("rmbUser") == "true") {
            $("#rmbUser").addClass("layui-form-radioed");
            $("#username").val($.cookie("userName"));
            $("#password").val($.cookie("passWord"));
        }
    });

    //表单验证
    layui.use('form', function () {
        var form = layui.form;
        form.verify({
            username: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (value == "") {
                    return '用户名不能为空';
                }
                if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                    return '用户名不能有特殊字符';
                }
                if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if (/^\d+\d+\d$/.test(value)) {
                    return '用户名不能全为数字';
                }
            }
            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            , password: function (value,item) {
                if (value == "") {
                    return '密码不能为空';
                }
            }
            , ajax_sub: function () {
                //ajax提交验证
            //获取文本框数据
            var userName = $("#username").val();
            var passWord = $("#password").val();
            // 组装好送往后台的json数据
            var _json = jQuery.param({ "userName": userName, "passWord": passWord });
            $.ajax({
                url: "api/login.ashx",
                type: "POST",
                async: false,
                data: _json, //不能直接写成 {id:"123",code:"tomcat"}  
                dataType: "json",
                // contentType: "charset=utf-8",  
                cache: false,

                //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
                success: function (data) {
                    var json = data;

                    if (json.r > 0) {
                        //提示插入成功
                        //alert(json.data);
                        saveUserInfo();
                        window.location.href = "./index.aspx"
                        //关闭弹出窗口
                    } else {
                        layer.msg(json.data, {icon:2});
                        changeCode();
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.readyState);
                }
            });
            }
        });
        
        
    });

    
})