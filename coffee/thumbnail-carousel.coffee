
class Carousel

    constructor: (@dom) ->
        prevButton = jQuery('<a class="carousel-prevbutton" href="#"><img src="img/button-prev.png" alt="Previous Image" /></a>')
        nextButton = jQuery('<a class="carousel-nextbutton" href="#"><img src="img/button-next.png" alt="Previous Image" /></a>')
        jQuery(@dom).before prevButton
        jQuery(@dom).after nextButton
        prevButton.on 'click', (event) -> do prev; event.preventDefault()
        nextButton.on 'click', (event) -> do next; event.preventDefault()

        prev = =>
            element = jQuery(@dom).find('li').first()
            reattach = =>
                jQuery(element).detach().find('img').css(width: '')
                jQuery(@dom).find('ul').append(element)
            element.find('img').animate width: '0px', 400, reattach
            
        next = =>
            element = jQuery(@dom).find('li').last()
            reattach = =>
                jQuery(element).find('img').css(width:'0px')
                jQuery(@dom).find('ul').prepend(element)
                jQuery(element).find('img').animate(width: '174px')
            element.find('img').detach
            do reattach




# MAIN

jQuery('.carousel').each ->
    carousel = new Carousel this
