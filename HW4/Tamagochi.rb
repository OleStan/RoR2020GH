# frozen_string_literal: true

require_relative 'user_aunt'
require_relative 'pet'
require_relative 'timer'
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

# start game--------------------------------------
def help_output(pet, timer, acc, role)
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
  esc_b = gets.chomp
  system 'clear' or system 'cls'
  pet.after_h(pet, timer)
  game(pet, timer, acc, role)
end

def super_admin_panel(pet, timer, acc, choise)
  case choise
  when 1
    acc.change_ptype(pet, timer, acc)
  when 2
    acc.change_pname(pet, timer, acc)
  when 3
    pet.hp = -2
  when 4
    to_def(pet, timer, acc)
  when 5
    acc.change_pstatus(pet, timer, acc)
  end
  system 'clear' or system 'cls'
  pet.after_h(pet, timer)
end

def admin_panel(pet, timer, acc, choise)
  case choise
  when 1
    acc.change_ptype(pet, timer, acc)
  when 2
    acc.change_pname(pet, timer, acc)
  end

  system 'clear' or system 'cls'
  pet.after_h(pet, timer)
end

def to_def(pet, timer, acc)
  pet.hp = timer.max_hp
  pet.interest = timer.max_interest
  pet.stomach = timer.max_stomach
  pet.sleepiness = timer.max_sleepiness
  pet.intelect = timer.max_intelect
  pet.purity = timer.max_purity
  acc.safe_progres_a(pet, timer)
end

def dayli(pet, timer, acc, role)
  puts "You are #{role}. Enter 8 to open #{role} panel" if (role == 'super_admin') || (role == 'admin')
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
      help_output(pet, timer, acc, role)
    when 8
      system 'clear' or system 'cls'
      case role
      when 'super_admin'
        puts "
             1. change pet type
             2. change pet name
             3. kill pet
             4. reset to defolt
             5. change pet status
skip enter"
        super_admin_panel(pet, timer, acc, gets.chomp.to_i)
      when "admin"
        puts "
             1. change pet type
             2. change pet name
skip enter"
        admin_panel(pet, timer, acc, gets.chomp.to_i)
      else
        pet.out_stat(pet, timer)
        puts "    !!!!!!!!!!!!!!!!!!!!!!!!
    !! Type corect number !!
    !!!!!!!!!!!!!!!!!!!!!!!!".bg_red.black
        dayli(pet, timer, acc, role)
      end
    else
      if (input_action.delete(' ') == 'help') || (input_action.delete(' ') == 'h')
        help_output(pet, timer, acc, role)
      else
        pet.out_stat(pet, timer)
        puts "    !!!!!!!!!!!!!!!!!!!!!!!!
    !! Type corect number !!
    !!!!!!!!!!!!!!!!!!!!!!!!".bg_red.black
        dayli(pet, timer, acc, role)
      end
    end
  elsif  $game_over != true

    puts "
Its to late you can only sleep
        1.put_to_sleep
        7.HELP or put help or h'

Comand: "
    input_action = gets.chomp
    if (input_action.delete(' ') == 'help') || (input_action.delete(' ') == 'h')
      help_output(pet, timer, acc, role)
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

def start_game(acc, pet, timer)
  $game_over = false
  role = acc.data['methods']['Role']
  puts " #{pet.render}"
  puts "#{pet.name} #{pet.voice}s : Hello!"
  puts " #{pet.name}  status
Time = #{timer.day_period}
----------------------------------------------------------
|  hp   | = #{pet.hp} / #{timer.max_hp}  |  stomach | = #{pet.stomach} / #{timer.max_stomach} | purity | = #{pet.purity} / #{timer.max_purity}
|interes| = #{pet.interest} / #{timer.max_interest}  |sleepiness| = #{pet.sleepiness} / #{timer.max_sleepiness} |intelect| = #{pet.intelect} / #{timer.max_intelect}
---------------------------------------------------------- ".cyan

  game(pet, timer, acc, role)
end

def game(pet, timer, acc, role)
  case role
  when "super_admin"
    acc.safe_progres_sa(pet, timer)
  when "admin"
    acc.safe_progres_a(pet, timer)
  else
    acc.safe_progres_u(pet, timer, $login)
  end
  pet.geme_over(pet, timer)
  unless $game_over
    timer.danger_moments(pet)
    dayli(pet, timer, acc, role)
    game(pet, timer, acc, role)
  end
end

def authorization
  puts 'Enter your login'
  $login = gets.chomp
  puts 'Enter your password'
  $pass = gets.chomp
end

def register
  case gets.chomp.to_i
  when 1
    print 'puts you login:'
    $login = gets.chomp
    print 'puts you password:'
    $pass = gets.chomp
    print 'puts you pet name:'
    name = gets.chomp
    print "chose you pet type:
      1 for dog
      2 for cat
      3 for hamster"
    case gets.chomp.to_f
    when 1
      anim = "dog"
    when 2
      anim = 'cat'
    when 3
      anim = 'hamster'
    else
      puts "enter corect number"
      change_ptype(pet, timer, acc)
    end
    type = anim
    acc = UserAunt.new('user')
    data = acc.data
    stomach = data['methods']['Pet']['status']['stomach']
    hp = data['methods']['Pet']['status']['hp']
    interest = data['methods']['Pet']['status']['interest']
    sleepines = data['methods']['Pet']['status']['sleepines']
    intelect = data['methods']['Pet']['status']['intelect']
    purity = data['methods']['Pet']['status']['purity']
    pet = Pet.new(type, name, stomach, hp, interest, sleepines, intelect, purity)
    timer = Timer.new(data['methods']['Pet']['status']['day'], pet)
    acc.create_u(pet, timer, $login, name, type, $pass)

  when 2
    login_check
    pass_check
    acc = UserAunt.new($login.to_s)
    type = acc.data['methods']['Pet']['type']
    name = acc.data['methods']['Pet']['status']['name']
    stomach = acc.data['methods']['Pet']['status']['stomach']
    hp = acc.data['methods']['Pet']['status']['hp']
    interest = acc.data['methods']['Pet']['status']['interest']
    sleepines = acc.data['methods']['Pet']['status']['sleepines']
    intelect = acc.data['methods']['Pet']['status']['intelect']
    purity = acc.data['methods']['Pet']['status']['purity']
    pet = Pet.new(type, name, stomach, hp, interest, sleepines, intelect, purity)
    timer = Timer.new(acc.data['methods']['Pet']['status']['day'], pet)
  else
    puts 'try again'
    register
  end
  start_game(acc, pet, timer)
end

def login_check
  print 'puts you login:'
  $login = gets.chomp
  test_log = YAML.safe_load(File.open("data_server/#{$login}.yml"))
rescue StandardError
  puts "No login #{$login}"
  login_check
end

def pass_check
  test_pass = YAML.safe_load(File.open("data_server/#{$login}.yml"))
  print 'puts you password:'
  $pass = gets.chomp
  unless $pass == test_pass['methods']['Password'].to_s
    puts 'wrong password try again'
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
start_game(acc, pet, timer) if enter_button != 0
