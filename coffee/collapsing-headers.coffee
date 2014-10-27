###*
#
###
class DomElement

    ###*
    # @constructor
    ###
    constructor: (@dom) ->
        console.log 'DomElement#constructor'
        @initialPosition = jQuery(@dom).offset().top
        @topPosition = @initialPosition
        @bottomPosition = @topPosition + jQuery(@dom).outerHeight()

    ###*
    #
    ###
    move: (event) =>
        console.log 'DomElement#move'
        console.log 'event', event
        #pageOffset = window.pageYOffset



###*
# Header that will be collapsed.
# Collapsed headers are defined by one thing:
# they will all collapse into the top of the document at the same time.
###
class Collapsable extends DomElement

    ###*
    #
    ###
    move: =>
        console.log 'CollapsableHeader#move'
        super
        if @currentPosition == 0
        else
    



###*
#
###
class NonCollapsable extends DomElement
    
    ###*
    #
    ###
    move: =>
        super
        console.log 'NonCollapsable@move'
        if @currentPosition == 0
        else




###*
# Main class
###
class CollapsingHeaders

    domElements = []

    ###*
    # @constructor
    ###
    constructor: ->
        console.log 'CollapsingHeaders#constructor'
        jQuery('.collapsable, .noncollapsable').each ->
            if jQuery(this).is('.collapsable')
                domElements.push new Collapsable this
            else if jQuery(this).is('.noncollapsable')
                domElements.push new NonCollapsable this
            
        jQuery(window).on 'scroll', scrollHandler
        #jQuery(window).on 'mousewheel', (event) -> console.log 'event', event
        #jQuery(window).on 'wheel', (event) -> console.log 'event', event
        console.log 'PASA'


    scrollHandler = (event) =>
        console.log 'CollapsingHeaders#scrollHandler'
        console.log window.pageYOffset
        #do header.move for header in headers
        console.log 'domElements', domElements
        element.move(event) for element in domElements
        #for header in headers do
        #    header.move()




###
# MAIN
###
new CollapsingHeaders