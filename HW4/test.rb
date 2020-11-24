require 'yaml'

test_pass = YAML.load(File.open("data_server/user_sa.yml"))

puts  test_pass["methods"]["Password"]



