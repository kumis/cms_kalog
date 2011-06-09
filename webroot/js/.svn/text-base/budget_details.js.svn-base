var trClone; // first loaded tr is cloned
$(function() {
    var tableScope = $('#budget_details');
    var tableScopeBody = $('tbody:first', tableScope);
    
    // add row
    $('#add_row').live("click", function(e) {
        var lastRow = $('tr.row_budget_details:last', tableScope);
        
        // make sure exists one row on tableScope
        if ( lastRow.length ) {
            // preformating the clone
            newRow = preformatNewRow(lastRow.clone());
            
            // cache for later use
            if ( typeof(trClone) == 'undefined' ) {
                trClone = newRow;
            }
            
            // tableScopeBody.append(newRow);
            $('.add_description_row:last', tableScope).after(newRow);
            
            // since field numeric appended before are from .html
            // we need rebind blur here
            $('.unit_amount', $('.row_budget_details:last', tableScope))
                .bind('blur', recalculateAllocated).val('');
            $('.unit_count',  $('.row_budget_details:last', tableScope))
                .bind('blur', recalculateAllocated).val('');
        }
    });
    
    // delete row
    $('#del_row').click(function(e) {
        var totalCb = $('.cb_budget_details').length;
        var totalChecked = $('.cb_budget_details:checked').length;
        
        if ( totalChecked == 0 ) {
            alert('Centang MAK yang ingin Anda hapus pada kotak\n'+
                  'kecil sebelah kiri pilihan MAK'
            );
            return false;
        }
        
        if ( totalChecked < totalCb ) {
            $('.cb_budget_details:checked').each(function(idx) {
                var rowId = $(this).parent().parent().attr('id');
                $('tr[id^=' + rowId + ']').remove();
                $('#rg' + rowId.substr(1)).remove();
            });
            
            // we need to recalculateTotal
            // by triggering blur's .count_amount of
            // last available .row_budget_details
            $('.unit_amount', $('.row_budget_details:last', tableScope))
            .trigger('blur');
            
            
        } else {
            alert('Anda tidak dapat menghapus MAK ini,\n' +
                  'karena harus ada 1 MAK yang tersusa, jika ada\n' +
                  'lebih dari 1 MAK, maka MAK ini dapat dihapus'
            );
            return false;
        }
        
        e.preventDefault();
    });
    
    // add description
    $('.add_description').live('click', function(){
        var row = $('#r'+this.id.substr(1));
        var newRow = preformatNewDesc(row.clone());
        $('#rg'+this.id.substr(1)).before(newRow);
    });
    
    // delete description
    $('.del_description').live('click', function(){
        var rel = $(this).attr('rel');
        var trRemoved = $('#'+rel);
        if ( trRemoved.hasClass('row_budget_detail_descriptions') ) {
            trRemoved.remove();
            
            // we need to recalculateTotal
            // by triggering blur's .count_amount of
            // current .row_budget_details
            var trId = rel.split('_')[0].substr(1)*1;
            $('.unit_amount', $('#r'+trId, tableScope))
            .trigger('blur');
            
        } else {
            alert('Anda tidak dapat menghapus rincian pertama.\n' +
                  'Tapi Dengan menghapus MAK-nya,\n' +
                  'Anda juga akan menghapus semua rinciannya'
            );
            return false;
        }
    });
    
    // force numeric on input.numeric
    $('.numeric').numeric();
    
    // recalculate .total_allocated for that
    // description on blur event, also
    // recalculate total for that MAK
    $('.numeric').blur(function(e){recalculateAllocated(e);});
});

/**
 * Function to format new tr after
 * #add_row is clicked
 * @param dom tr cloned row to be formatted before appended into tbody
 * @return dom tr after formatted
 */
function preformatNewRow(tr) {    
    // get row-xth
    // and increment it
    var oldId = tr.attr('id').substr(1)*1;
    var newId = oldId+1;
    $(tr).attr('id', 'r' + newId);
    
    // rel is 
    $(tr).attr('rel', 'r' + newId + '_d0');
    
    // change index of all input elements (budget_details)
    $('.cb_budget_details:first', tr).attr('name', 'data[Budget][BudgetDetail][' + 
        newId + '][id]');
    $('.activity_childs:first', tr).attr('name', 'data[Budget][BudgetDetail][' + 
        newId + '][activity_child_id]');
    $('.del_description:first', tr).attr('rel', 'r' + newId + '_d0');
    
    // change index of all input elements (budget_detail_descriptions)
    $('.description:first', tr).attr('name', 'data[Budget][BudgetDetail]['+newId+']' +
        '[BudgetDetailDescription][0][description]');
    $('.volume_id:first', tr).attr('name', 'data[Budget][BudgetDetail]['+newId+']' +
        '[BudgetDetailDescription][0][volume_id]');
    
    // .numeric input need special attention
    $('.unit_count:first', tr).attr('name', 'data[Budget][BudgetDetail]['+newId+']' +
        '[BudgetDetailDescription][0][unit_count]').val('')
    $('.unit_amount:first', tr).attr('name', 'data[Budget][BudgetDetail]['+newId+']' +
        '[BudgetDetailDescription][0][unit_amount]').val('')
    
    // fund_source
    $('.fund_source:first', tr).attr('name', 'data[Budget][BudgetDetail]['+newId+']' +
        '[BudgetDetailDescription][0][fund_source]');
        
    // total_allocated
    $('.total_allocated:first', tr).html('');
    
    // added add_description_row
    var dr = $('#rg' + oldId).clone();
    dr.attr('id', 'rg' + newId );
    $('#b'+oldId, dr).attr('id', 'b'+newId);
    
    var ret = $('<div id="ret'+newId+'"></div>').html(tr).append(dr);
    
    return ret.html();
}

/**
 * Function to format new tr after
 * .add_description is clicked
 * @param dom tr cloned row to be formatted before inserted before #rgx
 * @return dom tr after formatted
 */
function preformatNewDesc(tr) {
    // get add_description_row
    var rowId = tr.attr('id').substr(1)*1;
    
    // get description-xth
    // and increment it
    // var oldId = tr.attr('rel').substr(1)*1;
    var o = $('tr[id^=r' + rowId + ']:last').attr('rel').split('_');
    var oldId = o[1].substring(1)*1;
    var newId = oldId+1;
    
    $(tr).removeClass('row_budget_details');
    $(tr).addClass('row_budget_detail_descriptions');
    tr.attr('id', 'r'+rowId+'_d'+newId);
    tr.attr('rel', 'r'+rowId+'_d'+newId);
    
    // change index of all input elements (budget_details)
    $('.cb_budget_details:first', tr).parent().addClass('empty').children().remove();
    $('.activity_childs:first', tr).parent().addClass('empty').children().remove()
    $('.del_description:first', tr).attr('rel', 'r'+rowId+'_d'+newId);
    
    // change index of all input elements (budget_detail_descriptions)
    $('.description:first', tr).attr('name', 'data[Budget][BudgetDetail]['+rowId+']' +
        '[BudgetDetailDescription]['+newId+'][description]');
    $('.volume_id:first', tr).attr('name', 'data[Budget][BudgetDetail]['+rowId+']' +
        '[BudgetDetailDescription]['+newId+'][volume_id]');
    
    // .numeric input need special attention
    $('.unit_count:first', tr).attr('name', 'data[Budget][BudgetDetail]['+rowId+']' +
        '[BudgetDetailDescription]['+newId+'][unit_count]').val('')
        .bind('blur', recalculateAllocated);
    $('.unit_amount:first', tr).attr('name', 'data[Budget][BudgetDetail]['+rowId+']' +
        '[BudgetDetailDescription]['+newId+'][unit_amount]').val('')
        .bind('blur', recalculateAllocated);
        
    // fund_source
    $('.fund_source:first', tr).attr('name', 'data[Budget][BudgetDetail]['+rowId+']' +
        '[BudgetDetailDescription]['+newId+'][fund_source]');
    
    // total_allocated
    $('.total_allocated:first', tr).html('');
    
    return tr
}

/**
 * Function to recalculate single MAK
 */
function recalculateAllocated(e) {
    var el = $(e.target);
    var tr = el.parent().parent();
    var trId = tr.attr('id').split('_')[0].substr(1)*1;
    var lastTr = $('#rg' + trId);
    
    // element to be multiplied with
    var multiply = $('.unit_count', tr);
    if ( el.hasClass('unit_count') ) {
        multiply = $('.unit_amount', tr);
    }
    
    el.val( addCommas(el.val()) );
    multiply.val( addCommas(multiply.val()) );
    
    // multiply total_allocated
    // remove ,
    var total = el.val().replace(/,/g, '') * multiply.val().replace(/,/g, '');
    
    if ( isNaN(total) ) {
        total = 0;
    }
    
    // set total_allocated
    total = addCommas(total);
    $('.total_allocated:first', tr).html(total);
    
    // set total of current MAK
    total = 0;
    $('tr[id^=r'+trId+']').each(function(idx) {
        var ctot = $('.total_allocated', this).html().replace(/,/g,'')*1;
        if ( isNaN(ctot) ) {
            ctot = 0;
        }
        total += ctot;
    });
    total = addCommas(total);
    $('.total', lastTr).html(total);
    
    // set total of current activity
    total = 0;
    $('.total').each(function(idx) {
        var ctot = $(this).html().replace(/,/g,'')*1;
        if ( isNaN(ctot) ) {
            ctot = 0;
        }
        total += ctot;
    });
    total = addCommas(total);
    $('#total_for_activity').html(total);
}