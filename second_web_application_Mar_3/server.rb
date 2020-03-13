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
    @contact = {
        :name => "Jacob Blakely",
        :email => "jacob.b@gmail.com",
        :address => "41 Meadowbrook Road, Suite 5, Toronto, Ontario, M6B 2S5",
        :phone => '416-210-1576'
    }
    erb :contact
end 

get '/recipes' do
    @title = 'Recipes'
    @recipes = Recipe.all

    erb :recipes
end 

get '/recipes/:id' do
    id = params[:id]

    @recipe = Recipe.find(id)
    @title = @recipe.name
    
    erb :recipe
end 

get '/submit' do
    @title = "Submit Your Recipe Here"

    erb :form
end 
