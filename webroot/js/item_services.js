$(function() {
    $('#ItemServiceAssetItemId').change(function() {
        showDetail( this.value );
    }).trigger('change');
});

function showDetail(id) {
    $('.asset_inventory_no').html( item_details[id]['inventory_no'] );
    $('.asset_location').html( item_details[id]['location'] );
    $('.asset_total').html( item_details[id]['total'] );
}
