# frozen_string_literal: true
require_relative 'user_aunt'
require 'yaml'
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
    case @animal
    when 'dog'
    "         ,
            |`-.__
            / ' _/
           ****`
          /    }
         /  1 /
     1 /`   lll
     `l     /_ll
       `~~~~~``~`"
    when 'cat'
      "       _
       l`*-.
        )  _`-.
       .  : `. .
       : _   '  l
       ; *` _.   `*-._
       `-.-'          `-.
         ;       `       `.
         :.       .        l
         . l  .   :   .-'   .
         '  `+.;  ;  '      :
         :  '  |    ;       ;-.
         ; '   : :`-:     _.`* ;
       .*' /  .*' ; .*`- +'  `*'
      `*-*   `*-*  `*-*'
      "
    when 'hamster'
      "           .     .
            (>l---/<)
            ,'     `.
           /  q   p  l
          (  >(_Y_)<  )
           >-' `-' `-<-.
          /  _.== ,=.,- l
         /,    )`  '(    )
        ; `._.'      `--<
       :     l        |  )
       l      )       ;_/  hjw
        `._ _/_  ___.'-lll
           `--lll
      "
  end
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
    puts "#{pet.name} hp is #{pet.hp} and it's to low. Feed #{pet.name}".red if ill?
    puts "#{pet.name} stomach is #{pet.stomach} and it's to low. Feed #{pet.name}".red if hungry?
    puts "#{pet.name} purity is #{pet.purity} and it's to low. Wash #{pet.name}".red if dirty?
    puts "#{pet.name} interest is #{pet.interest} and it's to low. Play or walk with #{pet.name} ".red if interest?
    puts "#{pet.name} sleepiness is #{pet.sleepiness} and it's to low. #{pet.name} need a rest ".red if sleepy?
    puts "#{pet.name} intelect is #{pet.intelect} and it's to low. Train #{pet.name}".red if stupid?
  end

  def status(pet, timer)
    system "clear" or system "cls"
    puts "#{pet.render}"
    danger_notification(pet)
    puts"---------------------------------------------------
#{$notification_event}
#{$notification_action}"
   puts "
#{pet.name}  status

Time = #{timer.day_period}
----------------------------------------------------------
|  hp   | = #{pet.hp} / #{timer.max_hp}  |  stomach | = #{pet.stomach} / #{timer.max_stomach} | purity | = #{pet.purity} / #{timer.max_purity}
|interes| = #{pet.interest} / #{timer.max_interest}  |sleepiness| = #{pet.sleepiness} / #{timer.max_sleepiness} |intelect| = #{pet.intelect} / #{timer.max_intelect}
---------------------------------------------------------- ".cyan
  end
end

class Timer
  attr_accessor :day_time, :game_over
  attr_reader :max_hp, :max_interest, :max_stomach, :max_sleepiness, :max_intelect, :max_purity, :finish_game

  def initialize(day_time, pet)
    @day_time = day_time.to_f
    @day_count = 0
    case  pet.animal
    when    'dog'
    @max_hp = 6
    @max_interest = 5
    @max_stomach = 4
    @max_sleepiness = 3
    @max_intelect = 6
    @max_purity = 4
    when    'cat'
    @max_hp = 9
    @max_interest = 4
    @max_stomach = 4
    @max_sleepiness = 3
    @max_intelect = 6
    @max_purity = 7
    when 'hamster'
    @max_hp = 4
    @max_interest = 3
    @max_stomach = 4
    @max_sleepiness = 3
    @max_intelect = 3
    @max_purity = 3
    end
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
        $notification_event = "When you walking your pet found trash and eat it. It's hurts....(-3 stomach and -1 hp)".bg_brown.black.italic
      when 3
        pet.stomach += 2
        pet.stomach = timer.max_stomach if pet.stomach < timer.max_stomach - 3
        pet.hp += 1 if pet.hp != timer.max_hp
        $notification_event = 'When you walking your pet normal food. Next time be careful you may catch something dangerous
(+2 stomach and +1 hp)'.bg_brown.black.italic
      when 5
        pet.stomach = timer.max_stomach
        pet.hp = timer.max_hp
        $notification_event = "During your walkin #{pet.name} breathed freash air and it feel nice(max stomach and max hp)".bg_brown.black.italic
      end
    when 'power_up'

      case situation
      when 1
        pet.hp -= 2
        $notification_event = 'When you trained your pet, you were inattentive. It hurts .... ( -2 hp)'.bg_brown.black.italic
      when 3
        pet.intelect += 1 if pet.intelect <= timer.max_intelect - 1
        pet.hp += 1 if pet.hp != timer.max_hp - 1
        $notification_event = 'Your training is successful. Get extra bonus(+1 intelect and +1 hp)'.bg_brown.black.italic
      when 5
        pet.intelect += 2 if pet.intelect <= timer.max_intelect - 3
        pet.hp += 2 if pet.hp != timer.max_hp - 2
        $notification_event = 'Your training is very successful. Get mega bonus(+2 intelect and +2 hp)'.bg_brown.black.italic
      end
    when 'playing'
      if 1
        pet.hp -= 2
        $notification_event = 'When you play with your pet, you were inattentive. It hurts .... (-2 hp)'.bg_brown.black.italic
      elsif 3
        pet.intelect += 1 if pet.intelect <= timer.max_intelect - 1
        pet.hp += 1 if pet.hp != timer.max_hp - 1
        $notification_event = 'Your playing is successful. Get extra bonus(+1 intelect and +1 hp)'.bg_brown.black.italic
      elsif 5
        pet.interest += 1 if pet.interest <= timer.max_interest - 2
        pet.intelect += 1 if pet.intelect <= timer.max_intelect - 2
        pet.hp += 2 if pet.hp != timer.max_hp - 2
        $notification_event = 'Your playing is very successful. Get mega bonus(+ 1 interest and +1 intelect and +1 hp)'.bg_brown.black.italic
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
def help_output(pet, timer)
  system "clear" or system "cls"
  puts"
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
  esc_b = gets.chomp
  system "clear" or system "cls"
  pet.after_h(pet, timer)
  game(pet, timer)






end


def dayli(pet, timer)
  if timer.day_time != 3 && $game_over != true
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
      pet.walk(pet, timer)
    when 6
      pet.train(pet, timer)
    when 7
      help_output(pet, timer)
    else
      if input_action.delete(' ') == 'help' or input_action.delete(' ') == 'h'
        help_output(pet, timer)
      else
        pet.out_stat(pet, timer)
      puts "    !!!!!!!!!!!!!!!!!!!!!!!!
    !! Type corect number !!
    !!!!!!!!!!!!!!!!!!!!!!!!".bg_red.black
      dayli(pet, timer)
      end
      end
  elsif  $game_over != true

    puts "
Its to late you can only sleep
        1.put_to_sleep
        7.HELP or put help or h'

Comand: "
    input_action = gets.chomp
    if  input_action.delete(' ') == 'help' or input_action.delete(' ') == 'h'
      help_output(pet, timer)
    elsif input_action.to_f == 1
      pet.put_to_sleep(pet, timer)
    else
      pet.out_stat(pet, timer)
      puts " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 !!Its to late you can only sleep!!
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!".bg_red.black
    end
  end
  end


def start_game (acc, pet, timer)
  $game_over = false
  puts " #{pet.render}"
  puts "#{pet.name} #{pet.voice}s : Hello!"
  puts " #{pet.name}  status
Time = #{timer.day_period}
----------------------------------------------------------
|  hp   | = #{pet.hp} / #{timer.max_hp}  |  stomach | = #{pet.stomach} / #{timer.max_stomach} | purity | = #{pet.purity} / #{timer.max_purity}
|interes| = #{pet.interest} / #{timer.max_interest}  |sleepiness| = #{pet.sleepiness} / #{timer.max_sleepiness} |intelect| = #{pet.intelect} / #{timer.max_intelect}
---------------------------------------------------------- ".cyan

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

def authorization
  puts'Enter your login'
  $login = gets.chomp
  puts'Enter your password'
  $pass = gets.chomp
end
def register
  case gets.chomp.to_i
  when 1
    print "puts you login:"
    $login = gets.chomp
    print "puts you password:"
    $pass = gets.chomp
    print "puts you pet name:"
    name = gets.chomp
    print "puts you pet type:"
    type = gets.chomp
    acc = UserAunt.new("user")
    data = acc.data
    stomach = data["methods"]["Pet"]["status"]["stomach"]
    hp = data["methods"]["Pet"]["status"]["hp"]
    interest = data["methods"]["Pet"]["status"]["interest"]
    sleepines = data["methods"]["Pet"]["status"]["sleepines"]
    intelect = data["methods"]["Pet"]["status"]["intelect"]
    purity = data["methods"]["Pet"]["status"]["purity"]
    pet = Pet.new(type, name, stomach, hp, interest, sleepines, intelect, purity)
    timer = Timer.new(data["methods"]["Pet"]["status"]["day"], pet)
    acc.create_u(pet, timer, $login, name, type, $pass)
    start_game(acc, pet, timer)
  when 2
    login_check
    pass_check
    puts $login
    acc = UserAunt.new("#{$login}")
    type = acc.data["methods"]["Pet"]["type"]
    name = acc.data["methods"]["Pet"]["status"]["name"]
    stomach = acc.data["methods"]["Pet"]["status"]["stomach"]
    hp = acc.data["methods"]["Pet"]["status"]["hp"]
    interest = acc.data["methods"]["Pet"]["status"]["interest"]
    sleepines = acc.data["methods"]["Pet"]["status"]["sleepines"]
    intelect = acc.data["methods"]["Pet"]["status"]["intelect"]
    purity = acc.data["methods"]["Pet"]["status"]["purity"]
    pet = Pet.new(type, name, stomach, hp, interest, sleepines, intelect, purity)
    timer = Timer.new(acc.data["methods"]["Pet"]["status"]["day"], pet)
    start_game(acc, pet, timer)
  else
    puts "try again"
    register
  end
end
def login_check
  begin
    print "puts you login:"
    $login = gets.chomp
    test_log = YAML.load(File.open("data_server/#{$login}.yml"))
  rescue
    puts"No login #{$login}"
    login_check
  end
end
def pass_check
    test_pass = YAML.load(File.open("data_server/#{$login}.yml"))
    print "puts you password:"
    $pass = gets.chomp
    unless $pass == test_pass["methods"]["Password"].to_s
        puts"wrong password try again"
        pass_check
    end
end


puts "If you new bay press 1 to registration
If you have account press 2 to autorisate"
register


























puts 'pres ENTER to start new game
                   or
0 and ENTER to escape '
enter_button = gets.chomp
start_game if enter_button != 0
