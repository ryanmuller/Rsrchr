$(document).ready ->
  $('.hide').hide()

  $('.dropdown-toggle + ul a').click(() ->
    $('.hide').hide()
    $(this).parent().parent().parent().next('.postings').find('#new_posting_for_'+$(this).data('group-id')).parent().show()
  )

  $('.share .cancel').click(() ->
    $(this).parent().parent().parent().parent().hide()
  )
