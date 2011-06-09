var trClone; // first loaded tr is cloned
var tableScope, tableScopeBody, tableScopeFoot;

$(function() {
    tableScope = $('#transactions');
    tableScopeBody = $('tbody:first', tableScope);
    tableScopeFoot = $('tfoot:first', tableScope);
    
    // add row
    $('#add_row').live("click", function(e) {
        var lastRow = $('tr.transaction:last', tableScope);
        
        // make sure exists one row on tableScope
        if ( lastRow.length ) {
            // preformating the clone
            newRow = preformatNewRow(lastRow.clone());
            
            // cache for later use
            if ( typeof(trClone) == 'undefined' ) {
                trClone = newRow;
            }
            
            // tableScopeBody.append(newRow);
            tableScopeBody.append(newRow);
            
            // bind .ajax_select
            bindAjaxSelect( $('.parent_activity_id', $('.transaction:last', tableScope)) );
            
            // since field numeric appended before are from .html()
            // we need rebind blur and change here
            $('.amount_in', $('.transaction:last', tableScope))
                .bind('blur', recalculateTotal).val('');
            $('.reduction', $('.transaction:last', tableScope))
                .bind('blur', recalculateTotal).val('');
            $('.amount_out',  $('.transaction:last', tableScope))
                .bind('blur', recalculateTotal).val('');
            
            $('.tax',  $('.transaction:last', tableScope))
                .bind('blur', recalculateTotal).val('');
        }
    });
    
    // delete row
    $('#del_row').click(function(e) {
        var totalCb = $('.cb_transaction').length;
        var totalChecked = $('.cb_transaction:checked').length;
        
        if ( totalChecked == 0 ) {
            alert('Centang baris yang ingin Anda hapus pada kotak\n'+
                  'kecil sebelah kiri pilihan Kegiatan'
            );
            return false;
        }
        
        if ( totalChecked < totalCb ) {
            $('.cb_transaction:checked').each(function(idx) {
                var rowId = $(this).parent().parent().attr('id');
                $('tr[id^=' + rowId + ']').remove();
            });
            
            // we need to recalculateTotal
            // by triggering blur's .amount_in/out of
            // last available .transaction
            $('.tax', $('.transaction:last', tableScope))
            .trigger('blur');
            
            
        } else {
            alert('Anda tidak dapat menghapus transaksi ini,\n' +
                  'karena harus ada 1 transaksi yang tersisa, jika ada\n' +
                  'lebih dari 1 transaksi, maka transaksi ini dapat dihapus'
            );
            return false;
        }
        
        e.preventDefault();
    });
    
    // force numeric on input.numeric
    $('.numeric').numeric();
    
    // recalculate .total_transaction
    $('.numeric').blur(function(e){recalculateTotal(e);});
    $('.tax').blur(function(e){recalculateTotal(e);});
    
    // toggle show information
    $('#information').hide();
    $('#show_information').click(function(e) {
        $('#information').slideToggle();
        
        var __txt = 'Klik disini keterangan untuk tata cara';
        if ( $(this).html() == 'Klik disini keterangan untuk tata cara' ) {
            __txt = 'Sembunyikan keterangan tata cara';
        }
        
        $(this).html(__txt);
    });
    
    // toggle evidence_no amount_out
    $('.r_amount_out').live('click', function(e) {
        var rowId = $(this).attr('id').substr(25);
        var tr = $('#r' + rowId, tableScopeBody);
        var amount = $('.amount_out', tr);
        
        if ( (amount.val().replace(/,/g,'')*1) > 0 ) {
            // hide both
            $('#' + 'TransactionEAmountOutBank' + rowId).hide().children('.check_no').val('');
            $('#' + 'TransactionEAmountOutKas_' + rowId).hide().children('.cash_receipt_no').val('');
            
            // then show one
            $( $(this).attr('rel') ).show();
        } else {
            alert('Set dulu jumlah pengeluarannya');
            this.checked = false;
        }
    });
    
    // toggle evidence_no amount_in
    $('.r_amount_in').live('click', function() {
        var rowId = $(this).attr('id').substr(24);
        var tr = $('#r' + rowId, tableScopeBody);
        var amount = $('.amount_in', tr);
        
        if ( (amount.val().replace(/,/g,'')*1) > 0 ) {
            // hide both
            $('#' + 'TransactionEAmountInBank' + rowId).hide().children('.sp2d_no').val('');
            $('#' + 'TransactionEAmountInKas_' + rowId).hide().children('.cash_receipt_no_in').val('');
            
            // then show one
            $( $(this).attr('rel') ).attr('disabled', false).show();
        } else {
            alert('Set dulu jumlah penerimaannya');
            this.checked = false;
        }
    });
    
    // check existences of transaction_date
    // only on add action
    checkExistences(
        $('#TransactionTransactionDateYear').val() + '-' +
        $('#TransactionTransactionDateMonth').val() + '-' +
        $('#TransactionTransactionDateDay').val()
    );
    $('.transaction_date').change(function() {
        checkExistences(
            $('#TransactionTransactionDateYear').val() + '-' +
            $('#TransactionTransactionDateMonth').val() + '-' +
            $('#TransactionTransactionDateDay').val()
        );
    });
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
    
    // change index of all input elements
    $('.cb_transaction:first', tr).attr('name', 'data[Transaction][' + 
        newId + '][id]');
    $('.parent_activity_id:first', tr).attr({
        name: 'data[Transaction][' + newId + '][parent_activity_id]',
        rel: '#TransactionActivityId' + newId
    });
    $('.activity_id:first', tr).attr({
        name: 'data[Transaction][' + newId + '][activity_id]',
        id: 'TransactionActivityId' + newId
    }).html('<option value=""></option>');
    $('.activity_child_id:first', tr).attr(
        'name', 'data[Transaction][' + 
            newId + '][activity_child_id]'
    );
    $('.unit_code_id:first', tr).attr(
        'name', 'data[Transaction][' + 
            newId + '][unit_code_id]'
    );
    $('.description:first', tr).attr('name', 'data[Transaction]['+newId+']' +
        '[description]');
    
    // .numeric input need special attention
    $('.amount_out:first', tr).attr('name', 'data[Transaction]['+newId+']' +
        '[amount_out]').val('');
    $('#TransactionRAmountOutBank' + oldId, tr).attr('id', 'TransactionRAmountOutBank' + newId).
        attr('rel', '#TransactionEAmountOutBank' + newId).attr('name', 'data[Transaction]['+newId+'][r_amount_out]').
        attr('checked', '').
        next().attr('for', 'TransactionRAmountOutBank' + newId);
    $('#TransactionRAmountOutKas_' + oldId, tr).attr('id', 'TransactionRAmountOutKas_' + newId).
        attr('rel', '#TransactionEAmountOutKas_' + newId).attr('name', 'data[Transaction]['+newId+'][r_amount_out]').
        attr('checked', '').
        next().attr('for', 'TransactionRAmountOutKas_' + newId);
    $('#TransactionEAmountOutBank' + oldId, tr).attr('id', 'TransactionEAmountOutBank'+newId).hide();
    $('.check_no:first', tr).attr('name', 'data[Transaction]['+newId+'][check_no]').val('');
    $('#TransactionEAmountOutKas_' + oldId, tr).attr('id', 'TransactionEAmountOutKas_'+newId).hide();
    $('.cash_receipt_no:first', tr).attr('name', 'data[Transaction]['+newId+'][cash_receipt_no]').val('');
        
    $('.amount_in:first', tr).attr('name', 'data[Transaction]['+newId+']' +
        '[amount_in]').val('');
    $('#TransactionRAmountInBank' + oldId, tr).attr('id', 'TransactionRAmountInBank' + newId).
        attr('rel', '#TransactionEAmountInBank' + newId).attr('name', 'data[Transaction]['+newId+'][r_amount_in]').
        attr('checked', '').
        next().attr('for', 'TransactionRAmountInBank' + newId);
    $('#TransactionRAmountInKas_' + oldId, tr).attr('id', 'TransactionRAmountInKas_' + newId).
        attr('rel', '#TransactionEAmountInKas_' + newId).attr('name', 'data[Transaction]['+newId+'][r_amount_in]').
        attr('checked', '').
        next().attr('for', 'TransactionRAmountInKas_' + newId);
    $('#TransactionEAmountInBank' + oldId, tr).attr('id', 'TransactionEAmountInBank'+newId).hide();
    $('.sp2d_no:last', tr).attr('name', 'data[Transaction]['+newId+'][sp2d_no]').val('');
    $('#TransactionEAmountInKas_' + oldId, tr).attr('id', 'TransactionEAmountInKas_'+newId).hide();
    $('.cash_receipt_no_in:last', tr).attr('name', 'data[Transaction]['+newId+'][cash_receipt_no_in]').val('');
    $('.reduction:first', tr).attr('name', 'data[Transaction]['+newId+']' +
        '[reduction]').val('');
    
    // tax related
    $('.spj:first', tr).attr(
        'name', 'data[Transaction][' + newId + '][spj]'
    );
    $('.tax_ppndn:first', tr).attr(
        'name', 'data[Transaction][' + newId + '][tax_ppndn]'
    ).val('');
    $('.tax_pph21:first', tr).attr(
        'name', 'data[Transaction][' + newId + '][tax_pph21]'
    ).val('');
    $('.tax_pph22:first', tr).attr(
        'name', 'data[Transaction][' + newId + '][tax_pph22]'
    ).val('');
    $('.tax_pph23:first', tr).attr(
        'name', 'data[Transaction][' + newId + '][tax_pph23]'
    ).val('');
    $('.tax_other:first', tr).attr(
        'name', 'data[Transaction][' + newId + '][tax_other]'
    ).val('');
    
    
    // total
    $('.total:first', tr).html('');
    
    var ret = $('<div id="ret'+newId+'"></div>').html(tr);
    
    return ret.html();
}

/**
 * Function to recalculate single row
 */
function recalculateTotal(e) {
    var el = $(e.target);
    var tr = el.parent().parent();
    var trId = tr.attr('id').substr(1)*1;
    var __type;
    
    // check if tax is trigger this function
    // from change event
    if ( el.hasClass('tax') ) {
        // we need to change el
        // where amount is set
        if ( $('.amount_in:first', tr).val().length ) {
            el = $('.amount_in:first', tr);
        } else if ( $('.amount_out:first', tr).val().length ) {
            el = $('.amount_out:first', tr);
        } else {
            el = $('.amount_in:first', tr);
            el.val(0);
        }
    }
    
    // check if reduction is trigger this function
    // from change event
    if ( el.hasClass('reduction') ) {
        // we need to change el
        // where amount is set
        if ( $('.amount_in:first', tr).val().length ) {
            el = $('.amount_in:first', tr);
        } else if ( $('.amount_out:first', tr).val().length ) {
            el = $('.amount_out:first', tr);
        } else {
            el = $('.amount_in:first', tr);
            el.val(0);
        }
    }
    
    var tax = 0;
    $('.tax', tr).each(function() {
        tax += this.value.replace(/,/g,'')*1;
        this.value = addCommas( this.value );
    });
    
    var reduction = 0;
    reduction = $('.reduction', tr).val().replace(/,/g,'')*1;
    
    if ( el.hasClass('amount_out') ) {
        __type = 'out';
        
        // unset val of .amount_in
        // if we set val on .amount_out
        unsetEvidenceNoRelated('in', trId, tr);
    } else if ( el.hasClass('amount_in') ) {
        __type = 'in';
        
        unsetEvidenceNoRelated('out', trId, tr);
    }
    
    // set total same with amount_in/out
    var total = el.val().replace(/,/g,'')*1;
    // if tax is set
    if ( tax > 0  ) {
        total = total - tax;
    }
    // if in and reduction exists
    if ( __type === 'in' && reduction > 0 ) {
        if ( total > reduction ) {
            total = total - reduction;
            $('.reduction', tr).val( addCommas(reduction) );
        } else {
            $('.reduction', tr).val('');
        }
    }
    
    if ( isNaN(total) ) {
        total = 0;
    }
    el.val( addCommas(el.val()) );
    // set total on current row
    $('.total:first', tr).attr('rel', __type).html(addCommas(total));
    
    // set total of all rows
    total = 0;
    totalOut = 0;
    totalIn = 0;
    $('.total', tableScopeBody).each(function(idx) {
        var ctot = $(this).html().replace(/,/g,'')*1;
        if ( isNaN(ctot) ) {
            ctot = 0;
        }
        
        if ( $(this).attr('rel') == 'out') {
            totalOut += ctot;
        } else if ( $(this).attr('rel') == 'in') {
            totalIn += ctot;
        }
    });
    total = addCommas(totalIn - totalOut);
    $('#total_amount_out', tableScopeFoot).html( addCommas(totalOut) );
    $('#total_amount_in', tableScopeFoot).html( addCommas(totalIn) );
    $('#total_transaction', tableScopeFoot).html(total);
    
    // we need hide related evidence no if
    // val is NaN or not set or LT 0
    if ( !el.val().length || (el.val()*1)<=0 ) {
        unsetEvidenceNoRelated(__type, trId, tr);
        return false;
    }
}

/**
 * Function to bind ajax_select on
 * future .ajax_select element
 */
function bindAjaxSelect(el) {
    if ( el.attr('rel') && el.attr('ref') ) {

        var __rel = $( el.attr('rel') );
        var additionalConditions = '';
        var additionalIds = '';

        // if additional condition exists
        if ( el.attr('conditions') ) {
            var __conditions = el.attr('conditions').replace(/\s/g, '');
            __conditions = __conditions.split(',');
            additionalConditions = el.attr('ref');

            for ( idx in __conditions ) {
                additionalConditions += ',' + $(__conditions[idx]).attr('ref');
            }
        }
        el.change(function(e) {
            if ( $(this).attr('conditions') ) {
                additionalIds = el.val();
                
                for ( idx in __conditions ) {
                    additionalIds += ',' + $(__conditions[idx]).val();
                }
            }
            populateSelect({plugin: __rel.attr('plugin'), model: __rel.attr('model'), field: __rel.attr('field'), belongsTo: additionalConditions ? additionalConditions : el.attr('ref'), belongsToId: additionalIds ? additionalIds : el.val(), target_id: el.attr('rel')});
        });
    } 
}

/**
 * Function to unset related
 * evidence_no in amount_in/out
 * @param string type in or out, default to in
 * @param dom tr parent tr of current amount_in/out
 * @return void
 * 
 */
function unsetEvidenceNoRelated(type, trId, tr) {
    if ( type == 'out' ) {
        $('.amount_out:first', tr).val('');
        
        $('.r_amount_out', tr).attr('checked', '');
        
        $('.check_no', '#TransactionEAmountOutBank' + trId).val('');
        $('.cash_receipt_no', '#TransactionEAmountOutKas_' + trId).val('');
        
        $('#TransactionEAmountOutBank' + trId, tr).hide();
        $('#TransactionEAmountOutKas_' + trId, tr).hide();
    } else {
        $('.amount_in:first', tr).val('');
        $('.reduction:first', tr).val('');
        
        // unset related evidence no
        $('.r_amount_in', tr).attr('checked', '');
        
        $('.sp2d_no', '#TransactionEAmountInBank' + trId).val('');
        $('.cash_receipt_no_in', '#TransactionEAmountInKas_' + trId).val('');
        
        $('#TransactionEAmountInBank' + trId, tr).hide();
        $('#TransactionEAmountInKas_' + trId, tr).hide();
    }
}

function checkExistences(transaction_date) {
    $.get(chkTransURL + '/' + transaction_date,
    function(existences) {
        if ( existences*1 && !onEdit ) {
            $('#add').attr('disabled', true);
            $('#hd').html('<div class="flash_box flash_error">Transaksi pada tanggal ini sudah tersedia</div>');
            $.scrollTo('#hd', 'fast')
        } else {
            $('#add').attr('disabled', false);
            $('#hd').html('');
        }
    });
}