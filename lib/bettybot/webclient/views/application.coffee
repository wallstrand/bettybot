$ ->
  if !window.location.hash
    window.location.hash = 'latest'

  $('#conversation img').each( (index, image) ->
    $(image).wrap('<a href="'+$(image).attr('src')+'" rel="shadowbox">')
  )

  Shadowbox.init()
