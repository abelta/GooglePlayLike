
class Carousel

    constructor: (@dom) ->
        console.log 'Carousel'
        @open = false
        prevButton = jQuery('<a class="carousel-prevbutton" href="#"><img src="img/button-prev.png" alt="Previous Image" /></a>')
        nextButton = jQuery('<a class="carousel-nextbutton" href="#"><img src="img/button-next.png" alt="Previous Image" /></a>')
        jQuery(@dom).before prevButton
        jQuery(@dom).after nextButton
        prevButton.on 'click', (event) -> do prev; event.preventDefault()
        nextButton.on 'click', (event) -> do next; event.preventDefault()

        prev = =>
            element = jQuery(@dom).find('li').first()
            reattach = =>
                console.log 'reattach'
                console.log 'element', element
                console.log '@dom', @dom
                jQuery(element).detach().find('img').css(width: '')
                jQuery(@dom).find('ul').append(element)
            element.find('img').animate width: '0px', 400, reattach
            
        next = =>
            element = jQuery(@dom).find('li').last()
            reattach = =>
                console.log 'reattach'
                console.log 'element', element
                console.log '@dom', @dom
                jQuery(element).find('img').css(width:'0px')
                jQuery(@dom).find('ul').prepend(element)
                jQuery(element).find('img').animate(width: '174px')
            element.find('img').detach
            do reattach



###
class Element

    constructor: (@dom) ->
        console.log 'Element'
        @thumbnailUrl = jQuery(@dom).find('img').attr('src')
        @imageUrl = jQuery(@dom).find('a').attr('href')

    width: ->
        console.log 'Element#width'
        jQuery(@dom).outerWidth() 
###



# MAIN

jQuery('.carousel').each ->
    carousel = new Carousel this
    #jQuery(this).find('li').each ->
    #    carousel.push new Element this
