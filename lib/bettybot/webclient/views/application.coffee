$ ->
  if !window.location.hash
    window.location.hash = 'latest'

  $('#conversation img').each( (index, image) ->
    $(image).wrap('<a href="'+$(image).attr('src')+'" rel="shadowbox">')
  )

  Shadowbox.init()

  $('#chat').submit( (e) ->
    e.preventDefault()

    oldNumber = $('.message').size()

    $.post( '/', $(this).serialize(), (data) ->
      messages = $(data).find('.message')
      newNumber = messages.size()

      messagesToAppend = []
      messages.slice(oldNumber, newNumber).each( (index, message) ->
        messagesToAppend.push message
      )

      $('#conversation').append(messagesToAppend).animate({
        scrollTop: $('#conversation').prop('scrollHeight')
      }, 1500)

      messages.find('p').effect("highlight", {}, 1500)

      $('#chat')[0].reset()
    )
  )
