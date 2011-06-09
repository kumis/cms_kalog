$(function() {
    var pathPrint = path + '/print';
    $('#by').change(function() {
        if ( this.value == 'p' ) {
            __path = path + '/getuser'; 
        } else if ( this.value == 'u' ) {
            __path = path + '/getunit';
        }
        
        if ( this.value.length ) {
            $.get(__path, function(tr) {
                $('#changed').html(tr);
            });
        } else {
            $('#changed').html('');
        }
    });
    
    $('#print').click(function(e) {
        if ( !$('#by').val().length ) {
            alert('Pilih per pengguna / unit kerja');
            e.preventDefault();
            return false
        }
    });
});