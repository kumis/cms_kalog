$(function() {
    var tableScope = $('table.input');
    if ( tableScope ) {
        $('#checkall_modules, #checkall_menus').click(function(e) {
            var divScope = $('#' + this.id.substring(9));
            if ( $(this).is(':checked') ) {
                $('.checkall', divScope).attr("checked", "checked");
                $('.cb', divScope).attr("checked", "checked");
            } else {
                $('.checkall', divScope).attr("checked", "");
                $('.cb', divScope).attr("checked", "");
            }
        });
        
        $('.checkall').click(function(e) {
            target = $(e.target);
            if ( target.is(':checked') ) {
                $('.' + target.attr("rel")).attr("checked", "checked");
            } else {
                $('.' + target.attr("rel")).attr("checked", "");
            }
        });
        
        $('.cb').click(function(e) {
            target = $(e.target, tableScope);
            rel = function() {
                    var el = target.attr('class').split(' ');
                    for (i in el) {
                        if (el[i] != 'cb') return el[i];
                    }
            }();
            parent = $( '.checkall[rel=' + rel + ']' );
            if ( target.is(':checked') ) {
                parent.attr("checked", "checked");
            } else {
                if ( $('.' + rel).filter(':checked').length == 0 ) {
                    parent.attr("checked", "");
                }
            }
        });
    }
    
    
});