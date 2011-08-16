/** ----------------------------------------------------------------------------
 * Jquery function plugin 
 * objectify -- turns a form into an object for JSON serialization.
 */
$.fn.objectify = function() {
   var o = {};
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};

/** ----------------------------------------------------------------------------
 * Jquery function plugin 
 * inputError -- Add some classes and an error message for a validation failure
 */
$.fn.inputError = function(msg) {
	return $(this).addClass('ui-state-error')
		.before('<span class="ui-state-error-text">' + msg + '</span>');
		
};

$.fn.setErrorState = function(state) {
	//console.log("Setting form error statte to " + state);
	$(this).attr('bw:error', state);
	return $(this);
}

$.fn.getErrorState = function() {
	var state = $(this).attr('bw:error');
	if (state == 'true') return true;
	else return false;
}

$.fn.clearError = function(msg) {
	$(this).parent().children('span.ui-state-error-text').remove();
	return $(this).removeClass('ui-state-error');
		
};

/** ----------------------------------------------------------------------------
 * Jquery function plugin 
 * validate -- Validate a form against bw namespace rules.
 */
$.fn.validate = function() {
	$(this).setErrorState(false);
	var formErrorState = false;
	$(this).children('input').each(function() {
		$(this).clearError();
		if ($(this).attr('bw:required') == 'true' && $(this).val().length == 0) {	
			formErrorState = true;
			$(this).inputError('Required.');
		}
	});
	$(this).setErrorState(formErrorState);
	return $(this);
}