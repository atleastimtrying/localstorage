App = class App
  constructor: ->
    $(window).keyup @keyPress
    $('section:first-child').show().addClass 'active'
    @playing = no
    @seconds = 0

  keyPress : (event)=>
    unless @playing
      @playing = yes
      @timer()
      @loop()

  timer: =>
    $('#timer').html @seconds
    @seconds += 1
    unless(@seconds % 18){
      console.log @seconds
      $('#timer').addClass('danger')
    }
    unless(@seconds % 20){
      $('#timer').removeClass('danger')
    }
    setTimeout @timer, 1000 

  loop: =>
    @nextSlide()
    setTimeout @loop, 20000 

  nextSlide: =>
    next = $('.active').next('section')
    if next.length isnt 0
      $('.active').hide().removeClass 'active'
      next.show().addClass 'active'

$ ->
  window.app = new App