$(function () {
    $.ajax({
        url: "api/photo.ashx",
        type: "POST",
        async: false,
        dataType: "json",
        // contentType: "charset=utf-8",
        cache: false,
        //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
        success: function (res) {
            var outStr = "";
            console.log(res)
            if (res.data === undefined) {
                outStr = "<p>暂无相片</p>"
                $('.picbox').append(outStr)
            } else {
                var index = 0;
                for (let i in res.data) {
                    index++;
                    var imgArr = res.data[i].img.split('|')
                    outStr += "<li data-scroll-reveal=\"enter bottom over 1s\" >"+
                                    "<a href=\"infopic.aspx?id="+res.data[i].id+"\" >"+
                                        "<i><img src=\"" + imgArr[0]+"\"></i>"+
                                        "<div class=\"picinfo\">"+
                                            "<h3>"+res.data[i].p_title+"</h3>"+
                                            "<span>"+res.data[i].brief+"</span>"+
                                        "</div>"+
                                    "</a>"+
                                "</li >"
                    if (index % 4 == 0) {
                        index = 0;
                    }
                    $('.picbox>ul').eq(index).append(outStr)
                }
            }
           
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.readyState);
        }
    });
})