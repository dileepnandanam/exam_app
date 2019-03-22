$(document).on('turbolinks:load', function() {
	$('.side-nav').on('ajax:success', '.open-hierarchy', function(e, data, status, xhr) {
		target = $(this).data('target')
		$('.' + target).html(data)
		$(this).closest('.hierarchy').find('.hierarchy-item').removeClass('current')
		$(this).closest('.hierarchy-item').addClass('current')
	})

	$('.questions').on('ajax:success', 'form', function(e, data, status, xhr) {
		$(this).closest('.question').remove()
	}).on('ajax:error', 'form', function(e, xhr) {
		$(this).closest('.question').replaceWith(xhr.responseText)
	}).on('ajax:success', '.skip-answer', function() {
		$(this).closest('.question').remove()
	})

})
