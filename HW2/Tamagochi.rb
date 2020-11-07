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
  def feed
  end

  def play; end

  def wash; end

  def look_at; end

  def walk; end

  def put_to_sleep; end

  def train; end

  class Timer
    def initialize
      @day_time = day_time
    end
    def day_period(day_time)
      case day_time
      when 1
        'Morning'
      when 2
        'Noonday'
      else
        'Evening'

      end
    end
  end
end



# start game--------------------------------------

def dayli(pet)
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
    pet.feed
  when 2
    pet.play
  when 3
    pet.wash
  when 4
    pet.look_at
  when 5
    pet.walk
  when 6
    pet.put_to_sleep
  when 7
    pet.train
  else
    puts "    !!!!!!!!!!!!!!!!!!!!!!!!
    !! Type corect number !!
    !!!!!!!!!!!!!!!!!!!!!!!!"
    dayli(pet)
  end
end

def start_game
  print ' chose you animal name:  '
  input_pet_name = gets.chomp
  pet = Pet.new('dog', input_pet_name.capitalize, 5, 10, 4, 4, 2, 6)
  timer = Timer.new('1')
  puts " #{pet.render}"
  puts "#{pet.name} say #{pet.voice}"
  status(pet)
  game(pet)
end

def status(pet, timer)
  puts " #{pet.name}  stat
Time = #{}
---------------------------------------------
|hp| = #{pet.hp}     |stomach| = #{pet.stomach}    |purity| = #{pet.purity}
|interes| = #{pet.interest} |sleepiness| = #{pet.sleepiness} |intelect| = #{pet.intelect}
--------------------------------------------- "
end

def game(pet)
  dayli(pet)
end

start_game

