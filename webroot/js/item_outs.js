$(function() {
    $('#add_item_outs').click(function(e) {
        if ( !$('#ItemOutKomitmen').is(':checked') ) {
            alert('Anda harus setuju dengan komitmen yang disebutkan');
            e.preventDefault();
            return false;
        }
    });
});