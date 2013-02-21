window.Backbone ||= {}
window.Backbone.Views ||= {}

class Backbone.Views.PostIndexView extends Backbone.Diorama.NestingView
  template: JST['post_index']

  initialize: (options) ->
    @render()

  render: =>
    @closeSubViews()
    @$el.html(@template(view: @))
    @renderSubViews()

    return @

  onClose: ->
    @closeSubViews()
