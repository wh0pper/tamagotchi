#!/usr/bin/ruby
require_relative('game')

class Tamagotchi
  attr_accessor :name, :age, :food_level, :sleep_level, :activity_level, :happiness_level

  def initialize(name)
    @name = name
    @age = 0
    @food_level = 3
    @sleep_level = 3
    @activity_level = 3
    @happiness_level = 3
    @start_time = Time.now
    @index = 1
  end

  def feed
    if @food_level <=3
      @food_level += 2
    elsif @food_level = 4
      @food_level += 1
    end
  end

  def sleep
    @sleep_level = 5
  end

  def play
    if @activity_level <=3
      @activity_level += 2
    elsif @activity_level = 4
      @activity_level += 1
    end
  end

  def happiness
    @happiness_level = (@food_level + @sleep_level + @activity_level) / 3
  end

  def is_sleepy?
    if @sleep_level < 2
      return true
    end
    false
  end

  def is_hungry?
    if @food_level < 2
      return true
    end
    false
  end

  def is_bored?
    if @activity_level < 2
      return true
    end
    false
  end

  def check_stats
    @elapsed = Time.now - @start_time
    @elapsed = @elapsed.to_i
    if @elapsed/5 == @index
      @food_level -= 1
      @sleep_level -= 1
      @activity_level -= 1
      @index += 1
    end
  end
end
