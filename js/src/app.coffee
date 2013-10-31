window.App = Ember.Application.create()

App.IndexController = Ember.ObjectController.extend {
  keyWordArr: (->
    @get("keyWordStr").split "\n"
  ).property "keyWordStr"

  searchResult: (->
    result = []
    orginText = @get("orginText")
    @get("keyWordArr").forEach (value) ->
      result.push {
        word: value
        count: orginText.split(value).length - 1
      }
    return result
    
  ).property "orginText", "keyWordArr"

  highlightText: (->
    $("<p>#{ _.escape @get "orginText" }</p>").highlight(@get "keyWordArr").html()
  ).property "orginText", "keyWordArr"
}