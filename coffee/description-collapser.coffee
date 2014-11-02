class CollapsableText
    
    constructor: (@dom) ->
        console.log 'CollapsableText', @dom

    show: ->
        console.log 'CollapsableText#show'
        do jQuery(@dom).children().show

    hide: ->
        console.log 'CollapsableText#hide'
        do jQuery(@dom).children().not(':first-child').hide



class CollapseButton

    constructor: (@dom, @collapsableText) ->
        console.log 'CollapseButton', @dom, @collapsableText
        
        @showMoreCaption = jQuery(@dom).text()
        @showLessCaption = jQuery(@dom).data('collapse-less-caption')

        #@showMoreCaption = 'open'
        #@showLessCaption = 'close'
        
        @open = false
        jQuery(@dom).on 'click', @clickHandler

    clickHandler: =>
        console.log 'CollapseButton#clickHandler'
        if @open
            console.log 'open'
            console.log '@dom', @dom
            console.log '@showMoreCaption', @showMoreCaption
            jQuery(@dom).text @showMoreCaption
            do @collapsableText.hide
            @open = false
        else
            console.log 'close'
            console.log '@dom', @dom
            console.log '@showLessCaption', @showLessCaption
            jQuery(@dom).text @showLessCaption
            do @collapsableText.show
            @open = true





# Main

jQuery('[data-collapse]').each ->
    text = jQuery('#' + jQuery(this).data('collapse'))[0]
    collapsableText = new CollapsableText text
    collapseButton = new CollapseButton this, collapsableText