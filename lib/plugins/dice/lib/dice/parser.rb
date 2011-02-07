require 'parslet'

module Dice
  class Parser < Parslet::Parser
    rule(:count)              { match('[0-9]').repeat(1).as(:count) }
    rule(:sides)              { str('d') >> match('[0-9]').repeat(1).as(:sides) }
    rule(:explode)            { str('e') >> match('[0-9]').repeat(1).as(:explode) }
    rule(:reroll)             { str('r') >> match('[0-9]').repeat(1).as(:reroll) }
    rule(:modifier_operator)  { match('[+|-]').as(:modifier_operator) }
    rule(:modifier)           { modifier_operator >> match('[0-9]').repeat(1).as(:modifier) }
    rule(:die)                { count >> sides >> ( reroll | explode ).maybe >> ( reroll | explode ).maybe >> modifier.maybe }
    root(:die)
  end
end
