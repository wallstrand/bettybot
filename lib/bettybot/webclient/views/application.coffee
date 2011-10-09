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

      $('#latest').removeAttr('id')

      $('#conversation ul').append(messagesToAppend)
      $('#conversation').animate({
        scrollTop: $('#conversation').prop('scrollHeight')
      }, 1500)

      messages.find('img').each( (index, image) ->
        $(image).wrap('<a href="'+$(image).attr('src')+'" rel="shadowbox">')
      )

      Shadowbox.init({ skipSetup: true }); Shadowbox.setup();

      $('#chat')[0].reset()
    )
  )
