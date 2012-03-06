$(document).ready ->
  $('.hide').hide()

  $('.dropdown-toggle + ul a').click(() ->
    $('.hide').hide()
    $('#new_posting_for_'+$(this).data('group-id')).parent().show()
  )

  $('.share .cancel').click(() ->
    $(this).parent().parent().parent().parent().hide()
  )
