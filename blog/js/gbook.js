$(function () {
    //头像选择
    $('.comment_pic>li').click(function () {
        $(this).addClass('cur').siblings('li').removeClass('cur')
    });
    //昵称字数不能超过6个字符
    $('.nickname>input').on('input',function () {
        if ($(this).val().length > 6) {
            $('.tips').html('不能超过六个字符')
            $('.fb').attr("disabled","true")
        } else {
            $('.tips').html('')
        }
    })
    //文本框字数最多300字符
    var num = 300;
    $('.comment_info').on('input',function () {
        num--;
        if (num < 0) {
            num = 0
        }
        $('.words>p').text(num)
        if ($(this).val().length > 300) {
            $(this).val($(this).val().substr(0, 300));
        }
    })
    //发表留言
    $('.fb').click(function () {
        //检查头像是否选择
        if ($('.cur').size() === 0) {
            alert("请选择一个头像");
            return;
        }else if ($('.nickname>input').val().length === 0 ) {
            alert("请输入昵称")
            return;
        }else if ($('.comment_info').val().length === 0) {
            alert("请输入留言");
        }
        var img = $('.cur>img').attr("src");
        var name = $('.nickname>input').val();
        var brief = $('.comment_info').val();
        var parameter = "img=" + img + "&name=" + name + "&brief=" + brief;
        $.ajax({
            url: "api/addGbook.ashx",
            type: "POST",
            async: false,
            data: parameter,
            dataType: "text",
            // contentType: "charset=utf-8",
            cache: false,
            //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
            success: function (res) {
                alert(res)
                gbook();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.readyState);
            }
        });
    })
    //显示最新留言
    gbook();


    //封装留言
    function gbook() {
        $(".list").html("");
        $.ajax({
            url: "api/gbook.ashx",
            type: "POST",
            async: false,
            dataType: "json",
            // contentType: "charset=utf-8",
            cache: false,
            //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
            success: function (res) {
                var outStr = "";
                for (let i in res.data) {
                    outStr += "<div node-type=\"cmt-item\" data-id=\"1584282968\" data-user-id=\"125198389\" data-platform-id=\"3\" class=\"clear-g block-cont-gw\">" +
                        "<div class=\"cont-head-gw\" >" +
                        "<div class=\"head-img-gw\">" +
                        "<img src=\"" + res.data[i].g_img + "\" width=\"42\" height=\"42\" alt=\"\">" +
                        "</div>" +
                        "</div>" +
                        "<div class=\"cont-msg-gw\">" +
                        "<div class=\"msg-wrap-gw\">" +
                        "<div class=\"wrap-user-gw global-clear-spacing\">" +
                        " <span class=\"user-time-gw\">" + res.data[i].g_time + "</span>" +
                        "<span node-type=\"nickname\" class=\"user-name-gw\">"+res.data[i].g_name+"</span>" +
                        "</div>" +
                        "<div class=\"wrap-issue-gw\">" +
                        "<p class=\"issue-wrap-gw\"><span class=\"wrap-word-gw\">" + res.data[i].g_info + "</span></p>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div >";
                }
                //console.log(outStr)
                $(".list").append(outStr);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.readyState);
            }
        });
    }

})