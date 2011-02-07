require "#{File.dirname(__FILE__)}/dice/parser.rb"

class Die
  attr_accessor :count, :sides, :reroll, :explode, :modifier_operator, :modifier

  def initialize(string)
    state = Dice::Parser.new.parse(string)
    self.count = state[:count].to_i
    self.sides = state[:sides].to_i
    self.reroll = state[:reroll].to_i
    self.explode = state[:explode].to_i
    self.modifier_operator = state[:modifier_operator]
    self.modifier = state[:modifier].to_i
  end
end

#on :channel, /^:dice (.*)/i do
#  msg channel, DiceLib.new.parse(match[0])
#  msg channel, "A 20 for you good sir!"
#end
