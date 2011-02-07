require 'dice.rb'

describe Dice do
  it "handles simple CdS dice strings" do
    die = Die.new('1d20')
    die.count.should be(1)
    die.sides.should be(20)
  end

  it "handles reroll CdSrR dice strings" do
    Die.new('1d20r2').reroll.should be(2)
  end

  it "handles exploding CdSeE dice strings" do
    Die.new('1d20e18').explode.should be(18)
  end

  it "handles both exploding and rerolling in either order" do
    Die.new('1d20r2e18').explode.should be(18)
    Die.new('1d20e18r2').reroll.should  be(2)
  end

  it "handles simple static -/+ modifiers" do
    %w(- +).each do |modifier|
      die = Die.new("1d20#{modifier}2")
      die.modifier_operator.should == modifier
      die.modifier.should be(2)
    end
  end
end
