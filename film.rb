gem 'activerecord','=4.2.10' #Instructs to utilize specific (previous) version of Active Record gem (compatible with our non-Rails earlier version)
gem 'sqlite3', '=1.3.13'
require 'active_record' #provides the ORM (Object Relationship Mapping) connection between Ruby & our Database (sqlite3)
require 'mini_record' #Helps to add columns to the table **** required only within our temporary non-Rails environment

# Establishes the connection to the Databse SQLite3
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'film.sqlite3')

class Film < ActiveRecord::Base
    field :title, as: :text
    field :country, as: :text
    field :genre, as: :text
    field :rating, as: :integer
    field :description, as: :text

end 
Film.auto_upgrade! #method in mini_record to update field changes in class Film to the table in the associated database
