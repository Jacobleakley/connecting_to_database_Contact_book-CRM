gem 'activerecord', '=4.2.10'
gem 'sqlite3', '=1.3.13'
require 'active_record'
require 'mini_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'cookbook.sqlite3'
)

class Recipe < ActiveRecord::Base
    field :name, as: :string
    field :prep_time, as: :integer
    field :description, as: :text
    field :picture, as: :string
end 

Recipe.auto_upgrade!

at_exit do 
    ActiveRecord::Base.connection.close
end


