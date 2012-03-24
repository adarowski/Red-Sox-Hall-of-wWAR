$ ->
  setActive = (target) ->
    $(target).parents('dl').find('dd').removeClass('active')
    $(target).parents('dd').addClass('active')

  clearSubFilters = ->
    $('#adjustments dd, #positions dd').removeClass('active')

  hidePlayers = ->
    $('ol#players li').hide()

  $('#show-hall').click (e) ->
    e.preventDefault()
    setActive(e.currentTarget)

    hidePlayers()
    $('ol#players li.wwar').show()

    $('#adjustments').show()

  $('#show-all').click (e) ->
    e.preventDefault()
    setActive(e.currentTarget)

    $('ol#players li').show()
    $('#adjustments').hide()

  $('#positions a').click (e) ->
    e.preventDefault()
    setActive(e.currentTarget)

    hidePlayers()

    position = e.currentTarget.id.split('-')[1].toUpperCase()
    wwarClass = if $('dd.active #show-hall').length then '.wwar' else ''

    $("ol#players li.#{position}#{wwarClass}").show()


  $('#show-hall').click()
