window.App = Ember.Application.create()

App.Router.map ->
  return

App.IndexRoute = Ember.Route.extend {
  actions: {
    highlight: ->
      alert()
  }
}

App.IndexController = Ember.ObjectController.extend {
  orginText: ""
  keyWordStr: ""

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