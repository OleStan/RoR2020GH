class Pet
  def initialize (animal, name, stomach, hp, interest, sleepiness, intelect, purity)
    @animal = animal
    @name = name
    @hp = hp
    @interest = interest
    @stomach = stomach
    @sleepiness = sleepiness
    @intelect = intelect
    @purity = purity
  end

  def voice
    case @animal
    when "cat"
      'meow'
    when "dog"
      'bark'
    when "hamster"
      'pee-pee'
    end
  end

  # action------------------------------------------
  def feed()

  end
  def play

  end
  def wash

  end
  def look_at

  end
  def walk

  end
  def put_to_sleep

  end
  def train

  end







end


class Timer

end


class Dog < Pet
  def voice
    "Bark"
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
end

class Cat < Pet
  def voice
    "Meiw"
  end
  def render
    "       ,
       l`-._           __
        \\  `-..____,.'  `.
         :`.         /    l`.
         :  )       :      : l
          ;'        '   ;  |  :
          )..      .. .:.`.;  :
         /::...  .:::...   ` ;
         ; _ '    __        /:l
         `:o>   /lo_>      ;:. `.
        `-`.__ ;   __..--- /:.   l
        === l_/   ;=====_.':.     ;
         ,/'`--'...`--....        ;
              ;                    ;
            .'                      ;
          .'                        ;
        .'     ..     ,      .       ;
       :       ::..  /      ;::.     |
      /      `.;::.  |       ;:..    ;
     :         |:.   :       ;:.    ;
     :         ::     ;:..   |.    ;
      :       :;      :::....|     |
      /l     ,/ l      ;:::::;     ;
    .:. l:..|    :     ; '.--|     ;
   ::.  :''  `-.,,;     ;'   ;     ;
.-'. _.'l      / `;      l,__:      l
`---'    `----'   ;      /    l,.,,,/
                   `----`"
  end
end

class Humster < Pet
  def voice
    "peek-peek"
  end
  def render
    "             .     .
            (>l---/<)
            ,'     `.
           /  q   p  l
          (  >(_Y_)<  )
           >-' `-' `-<-.
          /  _.== ,=.,- l
         /,    )`  '(    )
        ; `._.'      `--<
       :     l        |  )
       l      )       ;_/
        `._ _/_  ___.'-l
           `--l"
  end
end















# action------------------------------------------
def feed

end
def play

end
def wash

end
def look_at

end
def walk

end
def put_to_sleep

end
def train

end



# start game--------------------------------------
def start_game

end



def game

end






print " chose you animal"
input_pet_choise = gets.chomp

case input_pet_choise
when 1
  pet = Dog.new('dog', 'sdsd', )
when 2
  pet = Humster.new('cat', 'sdsd')
when 3
  pet = Humster.new('humster', 'sdsd')
end



pet = Humster.new('cat', 'sdsd')
puts " #{pet.voice}"
puts " #{pet.render}"