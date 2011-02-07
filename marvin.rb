require 'isaac'

require './lib/plugins/dice/lib/dice.rb'
require './lib/plugins/gbattle.rb'

configure do |c|
  c.nick    = "Marvin"
  c.server  = "irc.dragonsbait.com"
  c.port    = 6667
end

on :connect do
  join "#gamers"
end
