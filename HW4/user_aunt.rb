class UserAunt
  attr_accessor :user, :data
  def initialize(login)
    @user
    @data = YAML.load(File.read("data_server/#{login}.yml"))
  end
  def super_admin
    puts "hello super admin"
    @user = "super_admin"
  end
  def admin
    puts "hello admin"
    @user = "admin"
  end
  def user
    puts "hello user"
    @user = "user"
  end
  def safe_progres_sa(pet, timer)
    a = {"methods"=>
             {"Role"=>"super_admin",
              "Password"=>$pass.to_i,
              "Email"=>"#{$login}gmail.com",
              "Pet"=>{"type"=>"#{pet.animal}",
                      "status"=>
                          {"day"=>timer.day_time,
                           "name"=>pet.name,
                           "hp"=>pet.hp,
                           "interest"=>pet.interest,
                           "stomach"=>pet.stomach,
                           "sleepines"=>pet.sleepiness,
                           "intelect"=>pet.intelect,
                           "purity"=>pet.purity}}}}
    File.open("data_server/user_sa.yml", "w") { |file| file.write(a.to_yaml) }
  end
  def safe_progres_a(pet, timer)
    a = {"methods"=>
             {"Role"=>"admin",
              "Password"=>$pass.to_i,
              "Email"=>"#{$login}gmail.com",
              "Pet"=>{"type"=>"#{pet.animal}",
                      "status"=>
                          {"day"=>timer.day_time,
                           "name"=>pet.name,
                           "hp"=>pet.hp,
                           "interest"=>pet.interest,
                           "stomach"=>pet.stomach,
                           "sleepines"=>pet.sleepiness,
                           "intelect"=>pet.intelect,
                           "purity"=>pet.purity}}}}
    File.open("data_server/user_a.yml", "w") { |file| file.write(a.to_yaml) }
  end
  def safe_progres_u(pet, timer, account)
    a = {"methods"=>
             {"Role"=>"user",
              "Password"=>$pass.to_i,
              "Email"=>"#{account}gmail.com",
              "Pet"=>{"type"=>"#{pet.animal}",
                      "status"=>
                          {"day"=>timer.day_time,
                           "name"=>pet.name,
                           "hp"=>pet.hp,
                           "interest"=>pet.interest,
                           "stomach"=>pet.stomach,
                           "sleepines"=>pet.sleepiness,
                           "intelect"=>pet.intelect,
                           "purity"=>pet.purity}}}}
    File.open("data_server/#{account}.yml", "w") { |file| file.write(a.to_yaml) }
  end
  def create_u(pet, timer, account, name, type, pass)


    a = {"methods"=>
             {"Role"=>"user",
              "Password"=>$pass.to_i,
              "Email"=>"#{account}",
              "Pet"=>{"type"=>"#{type}",
                      "status"=>
                          {"day"=>timer.day_time,
                           "name"=>name,
                           "hp"=>timer.max_hp,
                           "interest"=>timer.max_interest,
                           "stomach"=>timer.max_stomach,
                           "sleepiness"=>timer.max_sleepiness,
                           "intelect"=>timer.max_intelect,
                           "purity"=>timer.max_purity}}}}
    File.open("data_server/#{account}.yml", "w") { |file| file.write(a.to_yaml) }
    def open_file
    end
  end


def change_pname(pet, timer, acc)
  puts "enter new name"
  pet.name = gets.chomp.capitalize
  if acc.data["methods"]["Role"] == "super_admin"
  safe_progres_sa(pet, timer)
  elsif acc.data["methods"]["Role"] == "admin"
  safe_progres_a(pet, timer)
  end
end

def change_ptype(pet, timer, acc)
  puts "enter 1 for dog
      2 for cat
      3 for hamster"
  case gets.chomp.to_i
  when 1
    pet.animal = "dog"
  when 2
    pet.animal = 'cat'
  when 3
    pet.animal = 'hamster'
  else
    puts "enter corect number"
    change_ptype(pet, timer, acc)
  end
  if acc.data["methods"]["Role"] == "super_admin"
    safe_progres_sa(pet, timer)
  elsif acc.data["methods"]["Role"] == "admin"
    safe_progres_a(pet, timer)
  end
end

  def change_pstatus(pet, timer, acc)
    puts "
      1. change pet hp
      2. change pet interest
      3. change pet stomach
      4. change pet sleepiness
      5. change pet intelect
      6. change pet purity

"
    case gets.chomp.to_i
    when 1
      puts "input new hp"
      pet.hp = gets.chomp.to_i
    when 2
      puts "input new interest"
      pet.interest = gets.chomp.to_i
    when 3
      puts "input new stomach"
      pet.stomach = gets.chomp.to_i
    when 4
      puts "input new sleepiness"
      pet.sleepiness = gets.chomp.to_i
    when 5
      puts "input new intelect"
      pet.intelect = gets.chomp.to_i
    when 6
      puts "input new purity"
      pet.purity = gets.chomp.to_i
    else
      puts "enter corect number"
      change_pstatus(pet, timer, acc)
    end
    safe_progres_sa(pet, timer)
    puts "something else ?
puts 'yes' to change some thing else
press enter to exit"
    change_pstatus(pet, timer, acc) if gets.chomp == 'yes'
  end









end