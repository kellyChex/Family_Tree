require 'active_record'
require 'rspec'

require 'task'


database_configuration = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configuration["test"]
ActiveRecord::Base.establish_connection(test_configuration)

# RSpec.configure do |config|
#   config.after(:each) do
#     Task.all.each { |task| task.destroy }
#   end
# end

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
