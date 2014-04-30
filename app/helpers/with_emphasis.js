WithEmphasis = Ember.Handlebars.makeBoundHelper (input) ->
  if against
    input = input.toLowerCase()
    against = against.toLowerCase()

    var output = input.split(against)

    var string = output[0] + '<strong>' + against + '</strong>' + output[1]

    new Ember.Handlebars.SafeString(string)
  else
    input

`export default WithEmphasis`
