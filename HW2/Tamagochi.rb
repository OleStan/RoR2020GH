# frozen_string_literal: true

class String
  def black
    "\e[30m#{self}\e[0m"
  end

  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def brown
    "\e[33m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def magenta
    "\e[35m#{self}\e[0m"
  end

  def cyan
    "\e[36m#{self}\e[0m"
  end

  def gray
    "\e[37m#{self}\e[0m"
  end

  def bg_black
    "\e[40m#{self}\e[0m"
  end

  def bg_red
    "\e[41m#{self}\e[0m"
  end

  def bg_green
    "\e[42m#{self}\e[0m"
  end

  def bg_brown
    "\e[43m#{self}\e[0m"
  end

  def bg_blue
    "\e[44m#{self}\e[0m"
  end

  def bg_magenta
    "\e[45m#{self}\e[0m"
  end

  def bg_cyan
    "\e[46m#{self}\e[0m"
  end

  def bg_gray
    "\e[47m#{self}\e[0m"
  end

  def bold
    "\e[1m#{self}\e[22m"
  end

  def italic
    "\e[3m#{self}\e[23m"
  end

  def underline
    "\e[4m#{self}\e[24m"
  end

  def blink
    "\e[5m#{self}\e[25m"
  end

  def reverse_color
    "\e[7m#{self}\e[27m"
  end
end
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
    $notification_event = ''
    $notification_action = ''
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
    $notification_action = "You feed #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'healing')
    status(pet, timer)
  end

  def play(pet, timer)
    timer.day_time += 1
    $notification_action = "You play with #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'playing')
    status(pet, timer)
  end

  def wash(pet, timer)
    timer.day_time += 1
    $notification_action = "You wash #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'cleaning')
    status(pet, timer)
  end

  def look_at(pet, timer)
    timer.day_time += 1
    $notification_action = "You just look at #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'looking')
    status(pet, timer)
  end

  def walk(pet, timer)
    timer.day_time += 1
    $notification_action = "You walk with #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'walking')
    status(pet, timer)
    timer.endings(pet, timer, 'disappear_b') if interest? && rand(1..10) == 3
    timer.endings(pet, timer, 'disappear_s') if stupid? && rand(1..10) == 4
  end

  def put_to_sleep(pet, timer)
    timer.day_time = 1
    $notification_action = "You put sleep #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'sleeping')
    status(pet, timer)
  end

  def train(pet, timer)
    timer.day_time += 1
    $notification_action = "You train #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'power_up')
    status(pet, timer)
  end
  def out_stat(pet, timer)
    status(pet, timer)
  end
  def geme_over(pet, timer)
    timer.endings(pet, timer, 'die') if over?
  end

  private

  def over?
    @hp <= 0
  end

  def hungry?
    @stomach <= 2
  end

  def ill?
    @hp <= 2
  end

  def dirty?
    @purity <= 2
  end

  def interest?
    @interest <= 3
  end

  def stupid?
    @intelect <= 2
  end

  def sleepy?
    @sleepiness <= 1
  end

  def danger_notification(pet)
    puts "#{pet.name} hp is #{pet.hp} and it's to low. Feed #{pet.name}".red if ill?
    puts "#{pet.name} stomach is #{pet.stomach} and it's to low. Feed #{pet.name}".red if hungry?
    puts "#{pet.name} purity is #{pet.purity} and it's to low. Wash #{pet.name}".red if dirty?
    puts "#{pet.name} interest is #{pet.interest} and it's to low. Play or walk with #{pet.name} ".red if interest?
    puts "#{pet.name} sleepiness is #{pet.sleepiness} and it's to low. #{pet.name} need a rest ".red if sleepy?
    puts "#{pet.name} intelect is #{pet.intelect} and it's to low. Train #{pet.name}".red if stupid?
  end

  def status(pet, timer)
    system "clear" or system "cls"
    danger_notification(pet)
    puts"---------------------------------------------------
#{$notification_event}
#{$notification_action}"
    puts "
         #{pet.render}
#{pet.name}  status

Time = #{timer.day_period}
---------------------------------------------
|hp| = #{pet.hp}     |stomach| = #{pet.stomach}    |purity| = #{pet.purity}
|interes| = #{pet.interest} |sleepiness| = #{pet.sleepiness} |intelect| = #{pet.intelect}
--------------------------------------------- ".cyan
  end
end

class Timer
  attr_accessor :day_time, :game_over
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
  end

  def endings(pet, timer, reason)
    $game_over = true
    case reason
    when 'die'

      timer.ending_title(pet, timer, 'die')
    when 'disappear_b'

      timer.ending_title(pet, timer, 'disappear_b')
    when 'disappear_s'

      timer.ending_title(pet, timer, 'disappear_s')
    else # type code here
    end
  end

  def random_actions(pet, actions, timer)
    case actions
    when 'walking'
      random_event(pet, timer, 'walking', rand(1..5)) if pet.intelect < 2
      random_event(pet, timer, 'walking', rand(3..5)) if pet.intelect >= 2 && pet.intelect <= 4
      random_event(pet, timer, 'walking', rand(4..5)) if pet.intelect > 4
    when 'power_up'
      random_event(pet, timer, 'power_up', rand(1..5))
    when 'playing'
      random_event(pet, timer, 'playing', rand(1..5))
    else # type code here
    end
  end

  def random_event(pet, timer, action, situation)
    case action
    when 'walking'
      case situation
      when 1
        pet.stomach -= 3 if pet.stomach > 3
        pet.stomach = 0 if pet.stomach < 3
        pet.hp -= 1
        $notification_event = "When you walking your pet found trash and eat it. It's hurts....".bg_brown.black.italic
      when 3
        pet.stomach += 3
        pet.stomach = timer.max_stomach if pet.stomach < timer.max_stomach - 3
        pet.hp += 1 if pet.hp != timer.max_hp
        $notification_event = 'When you walking your pet normal food. Next time be careful you may catch something dangerous'.bg_brown.black.italic
      when 5
        pet.stomach = timer.max_stomach
        pet.hp = timer.max_hp
        $notification_event = "During your walkin #{pet.name} breathed freash air and it feel nice".bg_brown.black.italic
      end
    when 'power_up'

      case situation
      when 1
        pet.hp -= 2
        $notification_event = 'When you trained your pet, you were inattentive. It hurts .... '.bg_brown.black.italic
      when 3
        pet.intelect += 1 if pet.intelect <= timer.max_intelect - 1
        pet.hp += 1 if pet.hp != timer.max_hp - 1
        $notification_event = 'Your training is successful. Get extra bonus'.bg_brown.black.italic
      when 5
        pet.intelect += 2 if pet.intelect <= timer.max_intelect - 3
        pet.hp += 2 if pet.hp != timer.max_hp - 2
        $notification_event = 'Your training is very successful. Get mega bonus'.bg_brown.black.italic
      end
    when 'playing'
      if 1
        pet.hp -= 2
        $notification_event = 'When you play with your pet, you were inattentive. It hurts .... '.bg_brown.black.italic
      elsif 3
        pet.intelect += 1 if pet.intelect <= timer.max_intelect - 1
        pet.hp += 1 if pet.hp != timer.max_hp - 1
        $notification_event = 'Your playing is successful. Get extra bonus'.bg_brown.black.italic
      elsif 5
        pet.interest += 1 if pet.interest <= timer.max_interest - 2
        pet.intelect += 1 if pet.intelect <= timer.max_intelect - 2
        pet.hp += 2 if pet.hp != timer.max_hp - 2
        $notification_event = 'Your playing is very successful. Get mega bonus'.bg_brown.black.italic
      end
    end
  end

  def ending_title(pet, _timer, reason)
    case reason
    when 'die'

      if $game_over
        puts "#{pet.name} die
      ,-=-.
     /  +  l
     | ~~~ |
     |R.I.P|
     |_____|
".magenta
      end

    when 'disappear_b'

      if $game_over
        puts " On walkink #{pet.name} get away because it bored
 _____   ___  ___  ___ _____
|  __ l / _ l |  l/  ||  ___|
| |  l// /_l l| .  . || |__
| | __ |  _  || |l/| ||  __|
| |_l l| | | || |  | || |___
 l____/l_| |_/l_|  |_/l____/


 _____  _   _ ___________
|  _  || | | |  ___| ___ l
| | | || | | | |__ | |_/ /
| | | || | | |  __||    /
l l_/ /l l_/ / |___| |l l
 l___/  l___/l____/l_| l_|
".magenta
      end

    when 'disappear_s'

      if $game_over
        puts " On walkink #{pet.name} lost because it stupid
 _____   ___  ___  ___ _____
|  __ l / _ l |  l/  ||  ___|
| |  l// /_l l| .  . || |__
| | __ |  _  || |l/| ||  __|
| |_l l| | | || |  | || |___
 l____/l_| |_/l_|  |_/l____/


 _____  _   _ ___________
|  _  || | | |  ___| ___ l
| | | || | | | |__ | |_/ /
| | | || | | |  __||    /
l l_/ /l l_/ / |___| |l l
 l___/  l___/l____/l_| l_|
".magenta
      end

    end
  end

  def danger_moments(pet)
    pet.hp -= 1 if pet.purity.zero?
    pet.hp -= 1 if pet.stomach.zero?
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

  def status_counting(pet, timer, action)
    case action
    when 'healing'
      pet.stomach += 1 if pet.stomach <= timer.max_stomach
      pet.hp += rand(0..1) if pet.hp != timer.max_hp
      pet.sleepiness -= 1 if pet.sleepiness.positive?
    when 'playing'
      pet.interest += 1 if pet.interest <= timer.max_interest
      pet.stomach -= 1 if pet.stomach.positive?
      pet.sleepiness -= 1 if pet.sleepiness.positive?
      timer.random_actions(pet, 'playing', timer)
    when 'cleaning'
      pet.interest -= 1 if pet.interest.positive?
      pet.purity = timer.max_purity
    when 'looking'
      pet.interest -= 1 if pet.interest.positive?
      pet.stomach -= 1 if pet.stomach.positive?
      pet.sleepiness -= 1 if pet.sleepiness.positive?
      pet.intelect -= 1 if pet.intelect.positive?
      pet.purity -= 1 if pet.purity.positive?
      pet.hp -= 1 if pet.hp.positive?
    when 'walking'
      pet.interest += 1 if pet.interest <= timer.max_interest
      pet.stomach -= 1 if pet.stomach.positive?
      pet.purity -= 1 if pet.purity.positive?
      timer.random_actions(pet, 'walking', timer)
    when 'sleeping'
      pet.interest -= 1 if pet.interest.positive?
      pet.stomach -= 1 if pet.stomach.positive?
      pet.sleepiness = timer.max_sleepiness
      pet.intelect -= 1 if rand(1..3) == 2 && pet.intelect.positive?
      pet.purity -= 1 if pet.purity.positive?
    when 'power_up'
      pet.intelect += 1 if pet.intelect <= timer.max_intelect
      pet.stomach -= 1 if pet.stomach.positive?
      timer.random_actions(pet, 'power_up', timer)
    end
  end
end

# start game--------------------------------------

def dayli(pet, timer)
  if timer.day_time != 3 && $game_over != true
    puts "

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
        pet.out_stat(pet, timer)
      puts "    !!!!!!!!!!!!!!!!!!!!!!!!
    !! Type corect number !!
    !!!!!!!!!!!!!!!!!!!!!!!!".bg_red.black
      dayli(pet, timer)
    end
  elsif  $game_over != true

    puts "
Its to late you can only sleep
        1.put_to_sleep

Comand: "
    input_action = gets.chomp.to_f
    if input_action == 1
      pet.put_to_sleep(pet, timer)
    else
      pet.out_stat(pet, timer)
      puts "    !!!!!!!!!!!!!!!!!!!!!!!!
    !! Type corect number !!
    !!!!!!!!!!!!!!!!!!!!!!!!".bg_red.black
    end
  end

end

def start_game
  $game_over = false
  print ' chose you animal name:  '.green.underline
  input_pet_name = gets.chomp
  pet = Pet.new('dog', input_pet_name.capitalize, 5, 6, 4, 4, 2, 6)
  timer = Timer.new(1)
  puts " #{pet.render}"
  puts "#{pet.name} say #{pet.voice}"
  puts " #{pet.name}  status
Time = #{timer.day_period}
---------------------------------------------
|hp| = #{pet.hp}     |stomach| = #{pet.stomach}    |purity| = #{pet.purity}
|interes| = #{pet.interest} |sleepiness| = #{pet.sleepiness} |intelect| = #{pet.intelect}
--------------------------------------------- ".cyan

  game(pet, timer)
end

def game(pet, timer)

  pet.geme_over(pet, timer)
  unless $game_over
    timer.danger_moments(pet)
    dayli(pet, timer)
    game(pet, timer)
  end
end

start_game
puts 'pres ENTER to start new game'
enter_button = gets.chomp
start_game if enter_button == enter_button
