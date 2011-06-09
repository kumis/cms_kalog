var trClone; // first loaded tr is cloned
$(function() {
    var tableScope = $('#asset_items');
    var tableScopeBody = $('tbody:first', tableScope);
    
    // add row
    $('#add_row').live("click", function(e) {
        var lastRow = $('tr.row_asset_items:last', tableScope);
        
        // make sure exists one row on tableScope
        if ( lastRow.length ) {
            // preformating the clone
            newRow = preformatNewRow(lastRow.clone());
            
            // cache for later use
            if ( typeof(trClone) == 'undefined' ) {
                trClone = newRow;
            }
            
            // tableScopeBody.append(newRow);
            $('.row_asset_items:last', tableScope).after(newRow);
            
            calculateTotal();
        }
    });
    
    // delete row
    $('#del_row').click(function(e) {
        var totalCb = $('.cb_asset_items').length;
        var totalChecked = $('.cb_asset_items:checked').length;
        
        if ( totalChecked == 0 ) {
            alert('Centang barang yang ingin Anda hapus pada kotak\n'+
                  'kecil sebelah kiri pilihan nama barang'
            );
            return false;
        }
        
        if ( totalChecked < totalCb ) {
            $('.cb_asset_items:checked').each(function(idx) {
                var rowId = $(this).parent().parent().attr('id');
                $('tr[id^=' + rowId + ']').remove();
            });
            
            // we need to recalculateTotal
            calculateTotal();
        } else {
            alert('Anda tidak dapat menghapus barang ini,\n' +
                  'karena harus ada 1 barang yang tersusa, jika ada\n' +
                  'lebih dari 1 barang, maka barang ini dapat dihapus'
            );
            return false;
        }
        
        e.preventDefault();
    });
    
    // force numeric on input.numeric
    $('.numeric').numeric();
    
    // recalculate .total_allocated for that
    // description on blur event, also
    // recalculate total for that MAK
    //$('.numeric').blur(function(e){recalculateAllocated(e);});
    
    calculateTotal();
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
    
    // change index of all input elements
    $('.cb_asset_items:first', tr).attr('name', 'data[Asset][AssetItem][' +
        newId + '][id]');
    $('.item_id:first', tr).attr('name', 'data[Asset][AssetItem][' +
        newId + '][item_id]');
    $('.inventory_no:first', tr).attr('name', 'data[Asset][AssetItem][' +
        newId + '][inventory_no]');
    $('.location_id:first', tr).attr('name', 'data[Asset][AssetItem][' +
        newId + '][location_id]');
    $('.unit_code_id:first', tr).attr('name', 'data[Asset][AssetItem][' +
        newId + '][unit_code_id]');
    $('.total:first', tr).attr('name', 'data[Asset][AssetItem][' +
        newId + '][total]');
        
    // total_price
    $('.total_price:first', tr).html('');
    
    return tr;
}

$('.item_id').live('change', function() {
    calculateTotal();
});
$('.total').live('change', function() {
    calculateTotal();
});

// get total price for all rows
function calculateTotal() {
    var total = 0;
    $('.row_asset_items').each(function() {
        var _el = $('.item_id', this);
        total += calculateTotalPrice(_el);
    });
    
    $('#total').html( addCommas(total) );
}

// get total price for current row
function calculateTotalPrice(el) {
    var tr = $(el).parent().parent();
    var total = $('.total', tr).val() * 1;
    if ( !total ) total = 0;
    var price = item_price[ $(el).val() ] * 1;
    var total_price = price * total;
    
    $('.price_per_unit', tr).html( addCommas( price ) );
    $('.total_price', tr).html( addCommas( total_price ) );
    
    return total_price;
}
