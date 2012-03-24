commonFilterBehavior = (e, options = {}) ->
  e.preventDefault()
  clearSubFilters()
  setActive(e.currentTarget)

  if options['hidePlayers']
    $('ol#players li').hide()

setActive = (target) ->
  $(target).parents('dl').find('dd').removeClass('active')
  $(target).parents('dd').addClass('active')

clearSubFilters = ->
  $('#adjustments dd, #positions dd').removeClass('active')

$ ->
  # hall and all filters
  $('#show-hall').click (e) ->
    commonFilterBehavior(e, hidePlayers: true)

    $('ol#players li.wwar').show()

    $('#adjustments').show()

  $('#show-all').click (e) ->
    commonFilterBehavior(e)

    $('ol#players li').show()
    $('#adjustments').hide()

  # positions
  $('#positions a').click (e) ->
    commonFilterBehavior(e, hidePlayers: true)

    position = e.currentTarget.id.split('-')[1].toUpperCase()
    wwarClass = if $('dd.active #show-hall').length then '.wwar' else ''

    $("ol#players li.#{position}#{wwarClass}").show()

  # adjustments
  $('#adjustments a#whos-in').click (e) ->
    commonFilterBehavior(e, hidePlayers: true)
    $('ol#players li.wwar').not('.hof').show()

  $('#adjustments a#whos-out').click (e) ->
    commonFilterBehavior(e, hidePlayers: true)
    $('ol#players li.hof').not('.wwar').show()

  $('#adjustments a#whos-next').click (e) ->
    commonFilterBehavior(e, hidePlayers: true)
    $('ol#players li.future').show()


  # init default view
  $('#show-hall').click()
