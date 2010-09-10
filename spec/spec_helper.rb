$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
gem 'rspec'

require 'mm-lockdown'
require 'spec'

MongoMapper.database = 'mm-lockdown-spec'

class Locked
  include MongoMapper::Document

  plugin MongoMapper::Plugins::Lockdown

  key :title,       String
  key :body,        String
end

class Unlocked
  include MongoMapper::Document

  key :title,       String
  key :body,        String
end

Spec::Runner.configure do |config|
end
