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