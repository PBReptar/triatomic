# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  # robot.hear /badger/i, (res) ->
  #   res.send "Badgers? BADGERS? WE DON'T NEED ON STINKIN BADGERS"
  #
  robot.respond /shame (.*)/i, (res) ->
    user = res.match[1]
    user = if user.search("@") != -1 then user else "@" + user 
    res.send "BAD " + user + "-- ! SHAME ON YOU!!!"
  #
  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  #  robot.respond /you are a little slow/, (res) ->
  #    setTimeout () ->
  #    res.send "Who you calling 'slow'?"
  #    , 60 * 1000

  robot.hear /TESTIFY/i, (res) ->
    res.send "DUR DUR DA DUR DUH   DUR NUH NUH  DA DA DUR"
  
  #  robot.hear /apple pie/i, (res) ->
  #  res.send "more like apple die!"

  robot.hear /single ladies/i, (res) ->
    for i in [0...30]
      res.send "were SORRY!"
      res.send "Never forget Harambe..."
  # res.send "POT UP NOOBS!"
  # res.send "/gif runescape"

  # robot.hear /DING/i, (res) ->
  #  res.send "DONG"

  # robot.hear /surely/i, (res) ->
  #  res.send "http://80sclassic.com/wp-content/uploads/2014/11/dontcallmeshirley.jpg"
  
  # robot.hear /SPACESHIP/i, (res) ->
  #  res.send "http://66.media.tumblr.com/2d750207a43135c40c0be97d9ada2ad5/tumblr_n0qeynKbO31tre0g4o1_500.gif"

  # robot.hear /KARMA PARTY/i, (res) ->
  #  res.send "@TrevorPasley++ @NikkiJustice++ @ErickKlix++ @Shupe++ @DuncanKelly++ @JamesHogle++"
  #  res.send "http://www-static.weddingbee.com/pics/35543/Dancing_gifs_081.gif"

  # robot.hear /boats/i, (res) ->
  #  res.send "/quote The only thing I hate more than boats is APPLE PIE - James 2016"

  yourChance = 200

  robot.hear /(.*)/i, (res) ->
    roll = Math.floor(Math.random() * yourChance) >= yourChance - 1
    if roll
      corpus = res.match[1]
      split_corpus = corpus.split /\s+/g
      distance = Math.floor(Math.random() * 4) + 1
      subject = split_corpus.slice(split_corpus.length - distance).join(" ");
      res.send "your a " + subject

  # rushReplies = [
  #   "Rush is such a shitty band. I pity the fool who would get a Rush tattoo.",
  #   "Who the fuck would listen to Rush? Losers that's who."
  # ]

  # robot.hear /rush/i, (res) ->
  #   res.send res.random rushReplies
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
  robot.respond /roll (\d+)d(\d+)/i, (res) ->
    diceToRoll = res.match[1]
    diceValue = res.match[2]
    totalRoll = 0
    i = 0
    while i < diceToRoll
      totalRoll = totalRoll + Math.floor( (Math.random() * 1000) % (diceValue) )
      i++
    res.send  "This function is temporarily unavailable due to the dev being a too HAWT."
  # res.send  "69.  Heh."
