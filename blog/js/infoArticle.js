$(function () {
    var parameter = location.search;
    parameter = parameter.substr(1);
    $.ajax({
        url: "api/infoArticle.ashx",
        type: "POST",
        async: false,
        data: parameter,
        dataType: "json",
        // contentType: "charset=utf-8",
        cache: false,
        //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
        success: function (res) {
            var outStr = ""
            var upArticle = ""
            var downArticle = ""
            var upinfo = ""
            var downinfo = ""
            if (res.cntUp === 0) {
                upArticle = "javascript:;"
                upinfo = "没有了"
            } else {
                upArticle = "info.aspx?id=" + (res.data[0].id - 1)
                upinfo = "上一篇"
            }
            if (res.cntDown === 0) {
                downArticle = "javascript:;"
                downinfo = "没有了"
            } else {
                downArticle = "info.aspx?id=" + (res.data[0].id + 1)
                downinfo = "下一篇"
            }
            console.log(res)
            if (res.data === undefined) {
                outStr = "<p>抱歉，无此文章。</p>"
            } else {
                    outStr = "<div class=\"newsview\">"+
                                    "<h3 class=\"news_title\">"+res.data[0].a_title+"</h3>" +
                                    "<div class=\"bloginfo\" >"+
                                        "<ul>"+
                                            "<li class=\"author\">作者：<a href=\"javascript:;\">"+res.data[0].aname+"</a></li>"+
                                            "<li class=\"timer\">时间："+res.data[0].publishtime+"</li>"+
                                        "</ul>"+
                                    "</div >"+
                                    "<div class=\"news_about\">"+
                                        "<strong>简介：</strong>"+
                                        ""+res.data[0].a_preface+""+   
                                        "</div > "+
                                    "<div class=\"news_con\">"+res.data[0].brief+"</div>"+
                                "</div>"+
                                "<div class=\"share\" >"+
                                    "<p class=\"diggit\"><a href=\"JavaScript:;\"> 很赞哦！ </a>(<b id=\"diggnum\">"+res.data[0].playtimes+"</b>)</p>"+
                                "</div >"+
                                "<div class=\"nextinfo\">"+
                                    "<a href=\"" + upArticle +"\">"+upinfo+"</a>"+
                                    "<a href=\""+downArticle+"\">"+downinfo+"</a>"+
                                "</div>";   
            }
            $('.infosbox').append(outStr);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.readyState);
        }
    });

    //点赞
    $('.diggit').click(function () {
        var num = $('#diggnum').text();
        num++;
        parameter += "&diggitType=1"
        $.ajax({
            url: "api/diggit.ashx",
            type: "POST",
            async: false,
            data: parameter,
            dataType: "json",
            // contentType: "charset=utf-8",
            cache: false,
            //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
            success: function (res) {
                console.log(res)
                
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.readyState);
            }
        });
        $('#diggnum').text(num);
        $(this).css("pointer-events", "none")

    })
})