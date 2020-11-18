$chose = nil
require 'html_tam'
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

  def walk(pet, timer, a)
    timer.day_time += 1
    $notification_action = "You walk with #{pet.name} and now #{timer.day_period}"
    timer.status_counting(pet, timer, 'walking')
    status(pet, timer)
    timer.endings(pet, timer, 'disappear_b', a) if interest? && rand(1..10) == 3
    timer.endings(pet, timer, 'disappear_s', a) if stupid? && rand(1..10) == 4
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

  def geme_over(pet, timer, a)
    timer.endings(pet, timer, 'die', a) if over?
  end

  def after_h(pet, timer)
    status(pet, timer)
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
    puts "#{pet.name} hp is #{pet.hp} and it's to low. Feed #{pet.name}" if ill?
    puts "#{pet.name} stomach is #{pet.stomach} and it's to low. Feed #{pet.name}" if hungry?
    puts "#{pet.name} purity is #{pet.purity} and it's to low. Wash #{pet.name}" if dirty?
    puts "#{pet.name} interest is #{pet.interest} and it's to low. Play or walk with #{pet.name} " if interest?
    puts "#{pet.name} sleepiness is #{pet.sleepiness} and it's to low. #{pet.name} need a rest " if sleepy?
    puts "#{pet.name} intelect is #{pet.intelect} and it's to low. Train #{pet.name}" if stupid?
  end

  def status(pet, timer)
    system 'clear' or system 'cls'
    puts pet.render.to_s
    danger_notification(pet)
    puts "---------------------------------------------------
#{$notification_event}
        #{$notification_action}"
    puts "
         #{pet.name}  status

Time = #{timer.day_period}
----------------------------------------------------------
|  hp   | = #{pet.hp} / #{timer.max_hp}  |  stomach | = #{pet.stomach} / #{timer.max_stomach} | purity | = #{pet.purity} / #{timer.max_purity}
|interes| = #{pet.interest} / #{timer.max_interest}  |sleepiness| = #{pet.sleepiness} / #{timer.max_sleepiness} |intelect| = #{pet.intelect} / #{timer.max_intelect}
---------------------------------------------------------- "
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

  def endings(pet, timer, reason, a)
    $game_over = true
    case reason
    when 'die'

      timer.ending_title(pet, timer, 'die', a)
    when 'disappear_b'

      timer.ending_title(pet, timer, 'disappear_b', a)
    when 'disappear_s'

      timer.ending_title(pet, timer, 'disappear_s', a)
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
        $notification_event = "When you walking your pet found trash and eat it. It's hurts....(-3 stomach and -1 hp)"
      when 3
        pet.stomach += 2
        pet.stomach = timer.max_stomach if pet.stomach < timer.max_stomach - 3
        pet.hp += 1 if pet.hp != timer.max_hp
        $notification_event = 'When you walking your pet normal food. Next time be careful you may catch something dangerous
(+2 stomach and +1 hp)'
      when 5
        pet.stomach = timer.max_stomach
        pet.hp = timer.max_hp
        $notification_event = "During your walkin #{pet.name} breathed freash air and it feel nice(max stomach and max hp)"
      end
    when 'power_up'

      case situation
      when 1
        pet.hp -= 2
        $notification_event = 'When you trained your pet, you were inattentive. It hurts .... ( -2 hp)'
      when 3
        pet.intelect += 1 if pet.intelect <= timer.max_intelect - 1
        pet.hp += 1 if pet.hp != timer.max_hp - 1
        $notification_event = 'Your training is successful. Get extra bonus(+1 intelect and +1 hp)'
      when 5
        pet.intelect += 2 if pet.intelect <= timer.max_intelect - 3
        pet.hp += 2 if pet.hp != timer.max_hp - 2
        $notification_event = 'Your training is very successful. Get mega bonus(+2 intelect and +2 hp)'
      end
    when 'playing'
      if 1
        pet.hp -= 2
        $notification_event = 'When you play with your pet, you were inattentive. It hurts .... (-2 hp)'
      elsif 3
        pet.intelect += 1 if pet.intelect <= timer.max_intelect - 1
        pet.hp += 1 if pet.hp != timer.max_hp - 1
        $notification_event = 'Your playing is successful. Get extra bonus(+1 intelect and +1 hp)'
      elsif 5
        pet.interest += 1 if pet.interest <= timer.max_interest - 2
        pet.intelect += 1 if pet.intelect <= timer.max_intelect - 2
        pet.hp += 2 if pet.hp != timer.max_hp - 2
        $notification_event = 'Your playing is very successful. Get mega bonus(+ 1 interest and +1 intelect and +1 hp)'
      end
    end
  end

  def ending_title(pet, _timer, reason, a)
    case reason
    when 'die'

      if $game_over
        puts "#{pet.name} die
      ,-=-.
     /  +  l
     | ~~~ |
     |R.I.P|
     |_____|
"
        a.death
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
"
        a.end_over
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
"
        a.end_over
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
def help_output(pet, timer)
  system 'clear' or system 'cls'
  puts "
          |------------------------------------------------HELP-----------------------------------------------|
          |                     To get out press ENTER                                                        |
          |                                                                                                   |
          |-COMANDS:                                                                                          |
          | if you chose                                                                                      |
          | *(play)[interest + 1; stomach - 1; sleepiness -= 1] Starting event where you play with you pet.   |
          |     Be wary it's 10% chance of failure                                                            |
          | *(feed)[ stomach + 1; sleepiness -= 1] Starting event where you feed you pet.                     |
          |     It's 50% chance of +1 hp                                                                      |
          | *(wash)[ interest - 1; purity = max] Starting event where you wash you pet.                       |
          | *(walk)[ interest + 1; purity -= 1 ;stomach - 1] Starting event where you walking with pet.       |
          |     when pet intelect < 2                                                                         |
          |         -20% [stomach - 3; hp - 1] 20%[stomach + 2; hp + 1] 20%[stomach max; hp max]              |
          |     when pet 2 < intelect < 4                                                                     |
          |         - 33%[stomach + 2; hp + 1] 33%[stomach max; hp max]                                       |
          |     when pet intelect > 4                                                                         |
          |         - 50%[stomach max; hp max]                                                                |
          | *(train)[ intelect + 1; stomach - 1] Starting event where you train the pet.                      |
          |         20% [ hp - 2] 20%[intelect + 2; hp + 1] 20%[intelect + 2; hp + 2]                         |
          | *(look_at)[ all stat -1] Starting event where you killing pet.                                    |
          | *(put_to_sleep)[ sleepiness max; interest - 1; stomach - 1;] Active only at night.                |
          |         Starting event where you pet rest and skip day.                                           |
          |         It's 33% to intelect -1                                                                   |
          |                                                                                                   |
          | ELSE:                                                                                             |
          | - When purity or stomach = 0 every day hp -1                                                      |
          | - When intelect or interest < 2 pet can run away                                                  |
          |                                                                                                   |
          |To get out press ENTER                                                                             |
          |----------------------------------------------------------------------------------------------------
"
  a.help
  gets.chomp
  system 'clear' or system 'cls'
  pet.after_h(pet, timer)
  game(pet, timer, a)
end

def dayli(pet, timer)
  if timer.day_time != 3 && $game_over != true
    $chose = "

 Chose what you wanna do
1.feed             4.look at(nothing)
2.play             5.walk
3.wash             6.train
 7.HELP or put help or h
Comand: "
    puts "

 Chose what you wanna do
1.feed             4.look at(nothing)
2.play             5.walk
3.wash             6.train
 7.HELP or put help or h
Comand: "
    input_action = gets.chomp
    case input_action.to_f
    when 1
      pet.feed(pet, timer)
    when 2
      pet.play(pet, timer)
    when 3
      pet.wash(pet, timer)
    when 4
      pet.look_at(pet, timer)
    when 5
      pet.walk(pet, timer, a)
    when 6
      pet.train(pet, timer)
    when 7
      help_output(pet, timer)
    else
      if (input_action.delete(' ') == 'help') || (input_action.delete(' ') == 'h')
        help_output(pet, timer)
      else
        pet.out_stat(pet, timer)
        puts "    !!!!!!!!!!!!!!!!!!!!!!!!
    !! Type corect number !!
    !!!!!!!!!!!!!!!!!!!!!!!!"
        dayli(pet, timer)
      end
    end
  elsif $game_over != true
    $chose = "
Its to late you can only sleep
        1.put_to_sleep
        7.HELP or put help or h'

Comand: "
    puts
    "
Its to late you can only sleep
        1.put_to_sleep
        7.HELP or put help or h'

Comand: "
    input_action = gets.chomp
    if (input_action.delete(' ') == 'help') || (input_action.delete(' ') == 'h')
      help_output(pet, timer)
    elsif input_action.to_f == 1
      pet.put_to_sleep(pet, timer)
    else
      pet.out_stat(pet, timer)
      puts " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 !!Its to late you can only sleep!!
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    end
  end
end

def start_game
  a = Page_creater.new
  $game_over = false
  print ' chose you animal name:  '
  a.welcome
  input_pet_name = gets.chomp
  pet = Pet.new('dog', input_pet_name.capitalize, 5, 6, 4, 4, 2, 6)
  timer = Timer.new(1)

  a.create_page(pet.name, pet, timer)
  puts "#{pet.name} #{pet.voice}s : Hello!"
  puts " #{pet.name}  status
Time = #{timer.day_period}
----------------------------------------------------------
|  hp   | = #{pet.hp} / #{timer.max_hp}  |  stomach | = #{pet.stomach} / #{timer.max_stomach} | purity | = #{pet.purity} / #{timer.max_purity}
|interes| = #{pet.interest} / #{timer.max_interest}  |sleepiness| = #{pet.sleepiness} / #{timer.max_sleepiness} |intelect| = #{pet.intelect} / #{timer.max_intelect}
---------------------------------------------------------- "

  game(pet, timer, a)
end

def game(pet, timer, a)
  a.create_page(pet.name, pet, timer)
  pet.geme_over(pet, timer, a)
  unless $game_over
    timer.danger_moments(pet)
    dayli(pet, timer)
    game(pet, timer, a)
  end
end

start_game
puts 'pres ENTER to start new game
                   or
0 and ENTER to escape '
enter_button = gets.chomp
start_game if enter_button != 0
