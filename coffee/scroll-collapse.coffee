
class CollapsableBackground

    constructor: (@dom) ->
        wheelHandler = (event) =>
            @reposition jQuery(window).scrollTop()
        jQuery(window).on 'wheel', wheelHandler

    reposition: (y) ->
        topInit = 0
        top = topInit - 0.4 * y
        jQuery(@dom).css {top}




# MAIN.

jQuery('[data-collapsable-background]').each ->
    new CollapsableBackground this
