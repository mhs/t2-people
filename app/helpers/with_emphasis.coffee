WithEmphasis = Ember.Handlebars.makeBoundHelper (input, against) ->
  if against
    input = input.toLowerCase()
    against = against.toLowerCase()

    output = input.split(against)

    string = "#{output[0]} <strong> #{against} </strong> #{output[1]}"

    new Ember.Handlebars.SafeString(string)
  else
    input

`export default WithEmphasis`
