$(function () {
    $('.cd-top').hide();
    $(window).scroll(function(){
        if($(this).scrollTop() > 100){
            $('.cd-top').fadeIn();
        }else{
            $('.cd-top').fadeOut();
        }
    })
    $('.cd-top').click(function(){
        $('html ,body').animate({scrollTop: 0}, 300);
        return false;
    })
})