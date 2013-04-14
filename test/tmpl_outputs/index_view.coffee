window.Backbone ||= {}
window.Backbone.Views ||= {}

class Backbone.Views.IndexView extends Backbone.View
  template: Handlebars.templates['index.hbs']

  initialize: (options) ->
    @render()

  render: ->
    @$el.html(@template())
    return @

  onClose: ->
    
