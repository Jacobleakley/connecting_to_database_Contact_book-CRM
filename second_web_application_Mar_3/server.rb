require 'sinatra'
require_relative 'recipes'

get '/' do 
    redirect to('/recipes')
end

get '/about' do
    @title = 'About Us'
    erb :about
end

get '/contact' do
    @title = 'Contact Us'
    erb :contact
end 

get '/recipes' do
    @title = 'Recipes'
    @recipes = Recipes.all

    erb :recipes
end 

