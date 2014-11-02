// Generated by CoffeeScript 1.7.1
(function() {
  var Carousel;

  Carousel = (function() {
    function Carousel(dom) {
      var next, nextButton, prev, prevButton;
      this.dom = dom;
      console.log('Carousel');
      this.open = false;
      prevButton = jQuery('<a class="carousel-prevbutton" href="#"><img src="img/button-prev.png" alt="Previous Image" /></a>');
      nextButton = jQuery('<a class="carousel-nextbutton" href="#"><img src="img/button-next.png" alt="Previous Image" /></a>');
      jQuery(this.dom).before(prevButton);
      jQuery(this.dom).after(nextButton);
      prevButton.on('click', function(event) {
        prev();
        return event.preventDefault();
      });
      nextButton.on('click', function(event) {
        next();
        return event.preventDefault();
      });
      prev = (function(_this) {
        return function() {
          var element, reattach;
          element = jQuery(_this.dom).find('li').first();
          reattach = function() {
            console.log('reattach');
            console.log('element', element);
            console.log('@dom', _this.dom);
            jQuery(element).detach().find('img').css({
              width: ''
            });
            return jQuery(_this.dom).find('ul').append(element);
          };
          return element.find('img').animate({
            width: '0px'
          }, 400, reattach);
        };
      })(this);
      next = (function(_this) {
        return function() {
          var element, reattach;
          element = jQuery(_this.dom).find('li').last();
          reattach = function() {
            console.log('reattach');
            console.log('element', element);
            console.log('@dom', _this.dom);
            jQuery(element).find('img').css({
              width: '0px'
            });
            jQuery(_this.dom).find('ul').prepend(element);
            return jQuery(element).find('img').animate({
              width: '174px'
            });
          };
          element.find('img').detach;
          return reattach();
        };
      })(this);
    }

    return Carousel;

  })();


  /*
  class Element
  
      constructor: (@dom) ->
          console.log 'Element'
          @thumbnailUrl = jQuery(@dom).find('img').attr('src')
          @imageUrl = jQuery(@dom).find('a').attr('href')
  
      width: ->
          console.log 'Element#width'
          jQuery(@dom).outerWidth()
   */

  jQuery('.carousel').each(function() {
    var carousel;
    return carousel = new Carousel(this);
  });

}).call(this);
