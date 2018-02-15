#!/usr/bin/ruby
require_relative('tamagotchi')

class Game
  def initialize
    @day_counter = 0
    @setting = "home"
    @is_messy = false
    @start_time = Time.now
    @is_first_run = true
  end

  def night
    @day_counter += 1
  end

  def image
    @@image
  end

  def game_cycle
    if @is_first_run
      @@image = 'egg.png'
      sleep(2)
      @@image = 'hatch.png'
      sleep(2)
      @@image = 'happy.png'
      sleep(2)
      @@image = 'dead.png'
      sleep(2)
      @is_first_run = false
    else
      @@image = 'happy.png'
      @@image = 'dead.png'
    end
  end


end
