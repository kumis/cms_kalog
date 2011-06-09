/**
 * Common table grid in index
 */
$(function() {
/**
 * Common functions and event handlings
 */
    function startLoading(el, content) {
        if (el == null) el = '#loading';
        if (content == null) content = 'Loading...';
        
        $(el).html(content).css({
            top: '0', left: ($('body').width()/2)-($(el).width()/2)
        }).removeClass('finish').show();
    }
    function endLoading(el) {
        if (el == null) el = '#loading';
        
        $(el).css({
            top: '0', left: ($('body').width()/2)-($(el).width()/2)
        }).addClass('finish');
        setTimeout(function(){$(el).fadeOut('slow')}, 100);
    }
    $().ajaxStart(function(){
        startLoading();
    }).ajaxStop(function(){
        endLoading();
    });
    function bindAjaxSubmit(el) {
        $(el).submit(function(e){
            $.ajax({
                type: 'POST', 
                url: $(this).attr('action'),
                data: $(this).serialize(),
                success:function(data){
                    $('#hd').html(data);
                    var scopeTable = $(e.target).children(':first');
                    $('input[checked]', scopeTable).not('.checkall').parent().parent().fadeOut(100, function(){
                        $(this).remove();
                    });
                }
            });
            return false;
        });
    }
    $('select.ajax_select').each( function(index) {
		if ( $(this).attr('rel') && $(this).attr('ref') ) {
			var __this = this;
			var __rel = $( $(this).attr('rel') );
			var additionalConditions = '';
			var additionalIds = '';
			
			// if additional condition exists
			if ( $(this).attr('conditions') ) { 
				var __conditions = $(__this).attr('conditions').replace(/\s/g, '');
				__conditions = __conditions.split(',');
				additionalConditions = $(__this).attr('ref');
				
				for ( idx in __conditions ) {
					additionalConditions += ',' + $(__conditions[idx]).attr('ref');
				}
			}
			$(this).change(function(e) {
				if ( $(this).attr('conditions') ) {
					additionalIds = __this.value;
					for ( idx in __conditions ) {
						additionalIds += ',' + $(__conditions[idx]).val();
					}
				}	
				populateSelect({plugin: __rel.attr('plugin'), model: __rel.attr('model'), field: __rel.attr('field'), belongsTo:  additionalConditions ? additionalConditions : $(__this).attr('ref'), belongsToId: additionalIds ? additionalIds : __this.value, target_id: $(__this).attr('rel')});
			});
		}
	});
    
    function checkParentTr(el) {
        if ( el == null ) return false;
        
        var parents = $(el).parents();
        for (var i = 0; i < parents.length; i++) {
            if ( $(parents[i]).is('tr') && $(parents[i]).parent().parent().hasClass('tablegrid') ) {
                return $(parents[i]);
            }
        }
        
        return false;
    }
    
    function colorizeChecked(tr) {
        tr.addClass('checked');
    }
    function uncolorizeChecked(tr) {
        tr.removeClass('checked');
    }

/**
 * Start of code for tablegrid
 */    
    bindAjaxSubmit('.formgrid');
    
    $('#maincontent').click(function(e) {
        var target = $(e.target);
        var parent = target.parent();
        var container = $(this);
        
        // ajax for pagination and sorting
        if ( target.is('a') ) {
            if ( (parent.hasClass('paging')||parent.parent().hasClass('paging')||parent.hasClass('sortable')) ) {
                var _surl = target.attr('href').split('?');
                var _url  = target.attr('href');
                if (_surl.length > 1 ) {
                    _url = _url + '&ajax=1';
                } else {
                    _url = _url + '?ajax=1';
                }
                $.get( _url, function(content) {
                    container.html(content);
                    
                    // clear message
                    $('#hd').html("");
                });
                e.preventDefault();
                return false;
            }
            
            if ( parent.is('td') ) {
                startLoading();
            }
        }
        
        // check all
        if ( target.hasClass('checkall') && target.parent().is('th') ) {
            var state = target.is(':checked');
            var tableScope = target.parent().parent().parent().parent();
            if (state) {
                $('.cb', tableScope).attr("checked","checked").each(function(i) {
                    colorizeChecked( $('tr[rel=' + $(this).attr('id') + ']') );
                });
                $('.checkall', tableScope).attr("checked","checked");
            } else {
                $('.cb', tableScope).attr("checked","").each(function(i) {
                    uncolorizeChecked( $('tr[rel=' + $(this).attr('id') + ']') );    
                });
                $('.checkall', tableScope).attr("checked","");
            }
        }
        
        // single checkbox
        if ( target.hasClass('cb') && target.parent().is('td') ) {
            var state = target.is(':checked');
            if (state) {
                colorizeChecked( $('tr[rel=' + target.attr('id') + ']') );
            } else {
                uncolorizeChecked( $('tr[rel=' + target.attr('id') + ']') );
            }
        }
        
        // ajax delete
        if ( target.hasClass('delete') || (target.is('span') && target.parent().hasClass('delete')) ) {
            
            var tableScope = container.children().children().filter('.formgrid')
                            .children().filter('#tablegrid_' + target.attr('rel'));
            
            var rows = $('input[checked]', tableScope).not('.checkall');
            
            if ( !rows.length ) {
                alert('Check the record you want to delete');
            } else {
                if (!confirm('Are you sure want to delete this records?')) {
                    return false;
                };
                endLoading();
                bindAjaxSubmit(tableScope.parent());
                tableScope.parent().trigger('submit');
            }
            e.preventDefault();
            return false;
        } else if ( target.hasClass('add_new') || (target.is('span') && target.parent().hasClass('add_new')) ) {
            startLoading();
        }
        
        var tr = checkParentTr( e.target );
        if ( tr !== false && (target.is('a')===false) && (target.hasClass('cb')===false)  ) {
            var cb = $('#' + tr.attr('rel'));
            if ( cb.is(':checked') ) {
                cb.attr('checked', false)
                uncolorizeChecked(tr);
            } else {
                cb.attr('checked', true)
                colorizeChecked(tr);
            }
        }
        
    }).mouseover(function(e){
        var tr = checkParentTr( e.target );
        if ( tr !== false ) {
            tr.addClass('over');    
        }
    }).mouseout(function(e) {
        var tr = checkParentTr( e.target );
        if ( tr !== false ) {
            tr.removeClass('over');    
        }
    });

/**
 * Add or Edit actions
 */    
    $('table.input').click(function(e) {
        var target = $(e.target);
        var container = $(this);
        
        if ( target.is("input[type=submit]") ) {
            startLoading();
        }
        
        if ( target.is("a.back") ) {
            startLoading();
        }
    });

/**
 * Sidebar
 */
    $('#sb').click(function(e) {
        var target = $(e.target);
        var parent = target.parent();
        var container = $('#maincontent');
        
        if ( target.is('strong') ) {
            target = parent.parent().parent();
        }
        
        /*
        if ( target.is('a') && target.hasClass('sb_item') ) {
            
            $.get( target.attr('href') + '?ajax=1', function(content) {
                container.html(content);
                // clear message
                $('#hd').html("");
                
                //change url
                // TODO! also back reference
            });
            e.preventDefault();
            return false;
        }
        */
    });
});
/**
 * Global functions
 */
function populateSelect( params ) {
    if (typeof(params) != 'object') {
        return false;
    }
    
    var __options = '<option value="">- Select One -</option>';
    $.getJSON(ajaxURL, params, function(json){
        if ( json ) {
            for ( id in json ) {
                __options += '<option value="'+id+'">'+json[id]+'</option>';
            }
        }
        $(params['target_id']).html(__options).trigger('change');
    });
}
