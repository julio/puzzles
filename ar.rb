# $ irb
# >> require "ar"
# => expect results
 
require "rubygems"
require "mysql"
require "activerecord"
connection = ActiveRecord::Base.establish_connection(
  :username => "root",
  :password => "",
  :adapter  => "mysql",
  :database => "microplace_dev",
  :host     => "localhost")

models = %w[User Investment Interest]

models.each do |model|
  klass = Class.new ActiveRecord::Base
  Object.const_set model, klass
end

p models.last.constantize.first
