require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pry')
require('./lib/game')
require('./lib/tamagotchi')

get('/') do
  erb(:home)
end

post('/tamagotchi') do
  @chosen_name = params.fetch('name')
  @game = Game.new
  @@pet = Tamagotchi.new(@chosen_name)
  @@image = 'egg.gif'
  # @game.game_cycle()
  # @time = game.time_elapsed
  # until @time == 15
  #   @time = game.time_elapsed
  #   puts @time
  #   if @time < 5
  #     @image = 'egg.png'
  #   elsif @time < 7
  #     @image = 'hatch.png'
  #     redirect to('/tamagotchi')
  #   elsif @time < 10
  #     @image = 'happy.png'
  #   else
  #     @image = 'dead.png'
  #   end
  erb(:tamagotchi)
end

post('/feed') do
  if @@pet.is_hungry?
    @@image = 'happy.png'
  end
  @@pet.feed()
  erb(:tamagotchi)
end

post('/play') do
  if @@pet.is_hungry?
    @@image = 'happy.png'
  end
  @@pet.play()
  erb(:tamagotchi)
end

post('/sleep') do
  if @@pet.is_hungry?
    @@image = 'happy.png'
  end
  @@pet.sleep()
  erb(:tamagotchi)
end

post('/stats') do
  @@pet.check_stats
  erb(:tamagotchi)
end
