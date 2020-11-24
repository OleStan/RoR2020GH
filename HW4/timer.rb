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
