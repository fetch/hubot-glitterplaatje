# Description:
#   Return the "glitterplaatje" of the day.
#
# Commands:
#   hubot gpotd - Returns the glitterplaatje of the day.
#   hubot glitterplaatje - Returns the glitterplaatje of the day.
#
# Author:
#   @koenpunt

module.exports = (robot) ->

  robot.respond /(glitterplaatje of the day|gpotd)(.*)$/i, (msg) ->
    gotd msg

  robot.enter (msg) ->
    gotd msg


gotd = (msg) ->
  msg.http("https://gpotd.herokuapp.com/daily")
    .get() (err, res, body) ->
      if err?
        lookup_error msg, err
      else
        gpotd = JSON.parse(body)
        msg.send gpotd.url

lookup_error = (msg, err) ->
  console.log err
  msg.reply "Sorry, there was an error looking up the glitterplaatje of the day"
