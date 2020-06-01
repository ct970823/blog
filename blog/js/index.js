$(function () {
    //文章分类渲染
    $.ajax({
        url: "api/type.ashx",
        type: "POST",
        async: false,
        dataType: "json",
        // contentType: "charset=utf-8",
        cache: false,
        //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
        success: function (res) {
            var outStr = "";
            for (let i in res.data) {
                outStr += "<li><a href=\"index.aspx?type=" + res.data[i].id+"\">"+res.data[i].t_name+"</a></li>"
            }
            $('.fenlei>ul').append(outStr);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.readyState);
        }
    });
    //总页数
    var pages = 0;
    //文章列表渲染
    //查看url地址中的参数
    var parameter1 = location.search;
    parameter1 = parameter1.substr(1);
    var parameter2 = "pageIndex=1";
    var parameter = parameter1 + "&&" + parameter2;
    getArticle(parameter)
    if (pages == 1) {
        $('.pagelist>p').text('没有更多了');
    }

    //文章搜索
    //搜的是标题
    $('.input_submit').click(function () {
        var tit = $('#keyboard').val();
        if (tit === '') {
            alert("请输入关键词");
            
        } else {
            $('.r_box>ul').html('');
            parameter1 = "keywords=" + tit
            parameter = parameter1 + "&&" + parameter2
            getArticle(parameter)
        }
    })

    //点击加载更多
    var pageIndex = parameter2.substr(-1,1);
    $('.pagelist').click(function () {
        if ($(this).children('p').text() == "没有更多了") {
            return;
        } else {
            //隐藏加载更多
            $(this).children('p').hide();
            //显示加载图片
            $('.more_list').show();
            pageIndex++;
            parameter2 = "pageIndex=" + pageIndex;
            parameter = parameter1 + parameter2;
            getArticle(parameter);
            //隐藏加载图片
            $('.more_list').hide();
            //显示加载更多
            $(this).children('p').show();
            //判断是否是最后一页
            if (pageIndex == pages) {
                $(this).children('p').text('没有更多了');
            }
            
        }
    })


    //封装文章函数
    function getArticle(parameter) {
        var outStr = "";
        $.ajax({
            url: "api/article.ashx",
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
                    outStr = "<li>暂无结果</li>"
                } else {
                    for (let i in res.data) {
                        outStr += "<li><i><a href=\"info.aspx?id=" + res.data[i].id + "\"><img src=\"" + res.data[i].img + "\"></a></i>\n" +
                            "<h3><a href=\"info.aspx?id="+res.data[i].id+"\">" + res.data[i].a_title + "</a></h3>\n" +
                            "" + res.data[i].a_preface + "\n" +
                            "</li>"
                    }
                }
                pages = res.cntAll;
                $('.r_box>ul').append(outStr);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.readyState);
            }
        });
    }
})