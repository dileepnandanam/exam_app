$(document).on('turbolinks:load', function() {
	$('.side-nav').on('ajax:success', '.open-hierarchy', function(e, data, status, xhr) {
		target = $(this).data('target')
		$('.' + target).html(data)
		$(this).closest('.hierarchy').find('.hierarchy-item').removeClass('current')
		$(this).closest('.hierarchy-item').addClass('current')
	})
})
