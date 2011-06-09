$(function() {
    $('.stock').each(function(){
        var container = $(this);
        $.get( getStock + $(this).attr('rel'), function (stock) {
            container.html(stock);
        });
    });
});