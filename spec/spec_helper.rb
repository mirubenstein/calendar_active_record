require 'date'
require 'bundler/setup'
Bundler.require(:test, :default)

Dir['./lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Event.all.each { |event| event.destroy }
  end
end
