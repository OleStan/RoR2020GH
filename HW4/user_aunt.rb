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
    a = {"methods_sadmin"=>
             {"Role"=>"super_admin",
              "Password"=>1234,
              "Email"=>"1234@gmail.com",
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
    a = {"methods_sadmin"=>
             {"Role"=>"admin",
              "Password"=>1234,
              "Email"=>"1234@gmail.com",
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
  def safe_progres_u(pet, timer, account)
    a = {"methods_sadmin"=>
             {"Role"=>"user",
              "Password"=>1234,
              "Email"=>"1234@gmail.com",
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
              "Password"=>pass,
              "Email"=>"#{account}",
              "Pet"=>{"type"=>"#{type}",
                      "status"=>
                          {"day"=>timer.day_time,
                           "name"=>name,
                           "hp"=>pet.hp,
                           "interest"=>pet.interest,
                           "stomach"=>pet.stomach,
                           "sleepiness"=>pet.sleepiness,
                           "intelect"=>pet.intelect,
                           "purity"=>pet.purity}}}}
    File.open("data_server/#{account}.yml", "w") { |file| file.write(a.to_yaml) }
  end











  end