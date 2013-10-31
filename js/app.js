// Generated by CoffeeScript 1.6.3
(function() {
  window.App = Ember.Application.create();

  App.IndexController = Ember.ObjectController.extend({
    orginText: "",
    keyWordStr: "",
    keyWordArr: (function() {
      return this.get("keyWordStr").split("\n");
    }).property("keyWordStr"),
    searchResult: (function() {
      var orginText, result;
      result = [];
      orginText = this.get("orginText");
      this.get("keyWordArr").forEach(function(value) {
        return result.push({
          word: value,
          count: orginText.split(value).length - 1
        });
      });
      return result;
    }).property("orginText", "keyWordArr"),
    highlightText: (function() {
      return $("<p>" + (_.escape(this.get("orginText"))) + "</p>").highlight(this.get("keyWordArr")).html();
    }).property("orginText", "keyWordArr")
  });

}).call(this);
