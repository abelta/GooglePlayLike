// Generated by CoffeeScript 1.7.1
(function() {
  var CollapsableBackground;

  CollapsableBackground = (function() {
    function CollapsableBackground(dom) {
      var wheelHandler;
      this.dom = dom;
      wheelHandler = (function(_this) {
        return function(event) {
          return _this.reposition(jQuery(window).scrollTop());
        };
      })(this);
      jQuery(window).on('wheel', wheelHandler);
    }

    CollapsableBackground.prototype.reposition = function(y) {
      var top, topInit;
      topInit = 0;
      top = topInit - 0.4 * y;
      return jQuery(this.dom).css({
        top: top
      });
    };

    return CollapsableBackground;

  })();

  jQuery('[data-collapsable-background]').each(function() {
    return new CollapsableBackground(this);
  });

}).call(this);