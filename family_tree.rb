require 'active_record'
require './lib/task'

database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Let's create your family tree."
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add a person, 'v' to view all, 's' to search for a person, 'e' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'v'
      view
    when 's'
      search
    when 'e'
      puts "Thanks for visiting! Good bye."
    else
      puts "I didn't understand that request."
    end
  end
end

def add
  puts "What is your given name?"
  given_name = gets.chomp
  puts "What is your family name?"
  family_name = gets.chomp
  full_name = Family.new(:given_name => given_name, :family_name => family_name)
  full_name.save
  puts "'#{given_name} #{family_name}' has been added to the family tree."
end

def view
  puts "Here is the tree so far."
  tree = Family.all
  tree.each {|name| puts "#{name.given_name} #{name.family_name}"}
end

def search
  puts "Enter first name of the person you'd like to search for."
  search_first_name = gets.chomp
  # puts "Enter last name of the person you'd like to search for"
  # search_last_name = gets.chomp
  puts Family.exists?(:given_name => "#{search_first_name}")
end

welcome
