
class ScrollFader

    constructor: (@dom) ->
        scrollHandler = (event) =>
            @setOpacity jQuery(window).scrollTop()
        jQuery(window).on 'wheel', scrollHandler

    setOpacity: (y) ->
        minY = 0
        maxY = 200
        opacity = y / (maxY-minY)
        jQuery(@dom).css {opacity}




# MAIN.

jQuery('[data-scroll-fader]').each ->
    new ScrollFader this