$(function () {
    var parameter = location.search;
    parameter = parameter.substr(1);
    $.ajax({
        url: "api/photoInfo.ashx",
        type: "POST",
        async: false,
        data: parameter,
        dataType: "json",
        // contentType: "charset=utf-8",
        cache: false,
        //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
        success: function (res) {
            var outStr1 = "";
            var outStr2 = "";
            var imgArr = res.data[0].img.split("|");
            console.log(res)
            if (res.data === undefined) {
                outStr1 = "<p>暂无相片</p>"
                $('.picbox').append(outStr1)
            } else {
                var title = res.data[0].p_title;
                var imgFirst = imgArr[0];
                var imgLength = imgArr.length;
                var info = res.data[0].brief;
                var time = res.data[0].p_time;
                var commend = res.data[0].commend;
                $('.piccontext>h2').text(title);
                $('.source_left>span').text(time);
                $('.picshowtop>a:first>img').attr("src", imgFirst);
                $('.picshowtxt_left>i').text(imgLength);
                $('.pictext>ul').text(info);
                $('#diggnum').text(commend);
                for (var i = 0; i < imgLength; i ++) {
                    outStr1 += "<li> <a href=\"javascript: void (0); \"><img src=\"" + imgArr[i] + "\" alt=\"\" bigimg=\""+imgArr[i]+"\" /></a></li>";
                    outStr2 += "<li><div class=\"picimg\"><img src=\""+imgArr[i]+"\" alt=\"\" /></div></li>";
                }
                $('.picmidmid>ul').append(outStr1);
                $('.piclistshow>ul').append(outStr2);
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.readyState);
        }
    });

    //点赞
    $('.diggit').click(function () {
        var num = $('#diggnum').text();
        num++;
        parameter += "&diggitType=3"
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