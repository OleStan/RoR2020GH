# frozen_string_literal: true

class Pet
  attr_accessor :animal, :name, :stomach, :hp, :interest, :sleepiness, :intelect, :purity

  def initialize(animal, name, stomach, hp, interest, sleepiness, intelect, purity)
    @animal = animal
    @name = name
    @hp = hp
    @interest = interest
    @stomach = stomach
    @sleepiness = sleepiness
    @intelect = intelect
    @purity = purity
  end

  def render
    "         ,
            |`-.__
            / ' _/
           ****`
          /    }
         /  1 /
     1 /`   lll
     `l     /_ll
       `~~~~~``~`"
  end

  def voice
    case @animal
    when 'cat'
      'meow'
    when 'dog'
      'bark'
    when 'hamster'
      'pee-pee'
    else 'hello'
    end
  end

  # action------------------------------------------
  def feed(pet, timer)
    timer.day_time += 1
    puts "You feed #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'healing')
    status(pet, timer)
  end

  def play(pet, timer)
    timer.day_time += 1
    puts "You play with #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'playing')
    status(pet, timer)
  end

  def wash(pet, timer)
    timer.day_time += 1
    puts "You wash #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'cleaning')
    status(pet, timer)
  end

  def look_at(pet, timer)
    timer.day_time += 1
    puts "You just look at #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'looking')
    status(pet, timer)
  end

  def walk(pet, timer)
    timer.day_time += 1
    puts "You walpet.name# and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'walking')
    status(pet, timer)
  end

  def put_to_sleep(pet, timer)
    timer.day_time = 1
    puts "You put sleep #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'sleeping')
    status(pet, timer)
  end

  def train(pet, timer)
    timer.day_time += 1
    puts "You train #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'power_up')
    status(pet, timer)
  end
end

class Timer
  attr_accessor :day_time
  attr_reader :max_hp, :max_interest, :max_stomach, :max_sleepiness, :max_intelect, :max_purity, :finish_game

  def initialize(day_time)
    @day_time = day_time.to_f
    @max_hp = 6
    @max_interest = 5
    @max_stomach = 4
    @max_sleepiness = 3
    @max_intelect = 6
    @max_purity = 4
    @day_count = 0
    @finish_game = false
  end

  def status_counting(pet, timer, action)
    case action
    when 'healing'
      pet.stomach += 1 if pet.stomach <= timer.max_stomach
      pet.hp += rand(0..1) if pet.hp != timer.max_hp
      pet.sleepiness -= 1 if pet.sleepiness >= 0
    when 'playing'
      pet.interest += 1 if pet.interest <= timer.max_interest
      pet.stomach -= 1 if pet.stomach >= 0
      pet.sleepiness -= 1 if pet.sleepiness >= 0
    when 'cleaning'
      pet.interest -= 1 if pet.interest >= 0
      pet.purity = timer.max_purity
    when 'looking'
      pet.interest -= 1 if pet.interest >= 0
      pet.stomach -= 1 if pet.stomach >= 0
      pet.sleepiness -= 1 if pet.sleepiness >= 0
      pet.intelect -= 1 if pet.intelect >= 0
      pet.purity -= 1 if pet.purity >= 0
      pet.hp -= 1 if pet.hp >= 0
    when 'walking'
      pet.interest += 1 if pet.interest <= timer.max_interest
      pet.stomach -= 1 if pet.stomach >= 0
      pet.purity -= 1 if pet.purity >= 0
    when 'sleeping'
      pet.interest -= 1 if pet.interest >= 0
      pet.stomach -= 1 if pet.stomach >= 0
      pet.sleepiness = timer.max_sleepiness
      pet.intelect -= 1 if rand(1..3) == 2 && pet.intelect >= 0
      pet.purity -= 1 if pet.purity >= 0
    when 'power_up'
      pet.intelect += 1 if pet.intelect <= timer.max_intelect
      pet.stomach -= 1 if pet.stomach >= 0
    end
  end
  def endings(pet)
    ending_title(pet, 'die') if pet.hp == 0
  end

  def random_event(pet, action)

  end

  def ending_title(pet, reson)
    case reson
    when 'die'
      puts "#{pet.name} die
      ,-=-.
     /  +  l
     | ~~~ |
     |R.I.P|
     |_____|
"
      finish_game = true
    when 'disapere'

    end
  end




  def day_period
    case @day_time
    when 1
      'Morning'

    when 2
      'Noonday'

    else
      'Evening'
    end
  end


end

# start game--------------------------------------

def dayli(pet, timer)
  if timer.day_time != 3
  puts "---------------------------

 Chose what you wanna do
1.feed             5.walk
2.play             6.put_to_sleep
3.wash             7.train
4.look at(nothing)
Comand: "
  input_action = gets.chomp.to_f
  case input_action
  when 1
    pet.feed(pet, timer)
  when 2
    pet.play(pet, timer)
  when 3
    pet.wash(pet, timer)
  when 4
    pet.look_at(pet, timer)
  when 5
    pet.walk(pet, timer)
  when 6
    pet.put_to_sleep(pet, timer)
  when 7
    pet.train(pet, timer)
  else
    puts "    !!!!!!!!!!!!!!!!!!!!!!!!
    !! Type corect number !!
    !!!!!!!!!!!!!!!!!!!!!!!!"
    dayli(pet, timer)
  end
  else
    puts "---------------------------
Its to late you can only sleep
        1.put_to_sleep

Comand: "
    input_action = gets.chomp.to_f
    if input_action == 1
      pet.put_to_sleep(pet, timer)
    else
       puts "    !!!!!!!!!!!!!!!!!!!!!!!!
    !! Type corect number !!
    !!!!!!!!!!!!!!!!!!!!!!!!"
    end
  end
end

def start_game
  print ' chose you animal name:  '
  input_pet_name = gets.chomp
  pet = Pet.new('dog', input_pet_name.capitalize, 5, 6, 4, 4, 2, 6)
  timer = Timer.new(1)
  puts " #{pet.render}"
  puts "#{pet.name} say #{pet.voice}"
  status(pet, timer)
  game(pet, timer)
end

def status(pet, timer)
  puts " #{pet.name}  status
Time = #{timer.day_period}
---------------------------------------------
|hp| = #{pet.hp}     |stomach| = #{pet.stomach}    |purity| = #{pet.purity}
|interes| = #{pet.interest} |sleepiness| = #{pet.sleepiness} |intelect| = #{pet.intelect}
--------------------------------------------- "
  puts danger_notification(pet).to_s
end

def danger_notification(pet)
  puts "#{pet.name} hp is #{pet.hp} and it's to low. Feed #{pet.name}" if pet.hp < 2
  puts "#{pet.name} stomach is #{pet.stomach} and it's to low. Feed #{pet.name}" if pet.stomach < 2
  puts "#{pet.name} purity is #{pet.purity} and it's to low. Wash #{pet.name}" if pet.purity < 2
  puts "#{pet.name} interest is #{pet.interest} and it's to low. Play or walk with #{pet.name} " if pet.interest < 3
  puts "#{pet.name} sleepiness is #{pet.sleepiness} and it's to low. #{pet.name} need a rest " if pet.sleepiness < 1
  puts "#{pet.name} intelect is #{pet.intelect} and it's to low. Train #{pet.name}" if pet.intelect < 2
end

def game(pet, timer)
  timer.endings(pet)
  dayli(pet, timer) unless timer.finish_game
  game(pet, timer) unless timer.finish_game
end

start_game
