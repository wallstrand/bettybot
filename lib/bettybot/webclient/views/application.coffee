$ ->
  if !window.location.hash
    window.location.hash = 'latest'

  if $('#conversation').prop('scrollHeight') <= $('#conversation').prop('scrollTop')
  $('#conversation').scrollTop($('#conversation').prop('scrollHeight'))
