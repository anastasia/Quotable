angular.module("app")
.directive "qNewQuote", ->
  templateUrl: 'partials/new.quote.tpl.jade'
  controllerAs: 'newquote'
  controller: ($scope, QuoteService, TagService) ->
    @shown = null
    # @shown = true
    @addQuote = ->
      obj = {}
      # obj.author  = @author
      obj.content = {}
      obj.content['body']   = @body
      obj.content['author'] = @author
      obj.origin = @origin
      obj.tags   = @tags.split(' ')

      QuoteService
        .createQuote(obj)
        .then ->
          console.log "success!"
        .catch (e) ->
          console.log "error!", e


    $scope.$watch ->
      return QuoteService.addingQuote
    , =>
      @shown = QuoteService.addingQuote
    return
