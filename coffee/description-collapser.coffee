class CollapsableText
    
    constructor: (@dom) ->

    show: ->
        do jQuery(@dom).children().show

    hide: ->
        do jQuery(@dom).children().not(':first-child').hide



class CollapseButton

    constructor: (@dom, @collapsableText) ->

        @showMoreCaption = jQuery(@dom).text()
        @showLessCaption = jQuery(@dom).data('collapse-less-caption')
        
        @open = false
        jQuery(@dom).on 'click', @clickHandler

    clickHandler: =>
        if @open
            jQuery(@dom).text @showMoreCaption
            do @collapsableText.hide
            @open = false
        else
            jQuery(@dom).text @showLessCaption
            do @collapsableText.show
            @open = true





# Main

jQuery('[data-collapse]').each ->
    text = jQuery('#' + jQuery(this).data('collapse'))[0]
    collapsableText = new CollapsableText text
    collapseButton = new CollapseButton this, collapsableText