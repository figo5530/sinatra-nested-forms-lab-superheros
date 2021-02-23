require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        # binding.pry
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]
        @hero_name = []
        @hero_power = []
        @hero_bio = []
        @hero_members =params[:team][:members]
        @hero_members.each do |attri|
            @hero_name << attri[:name]
            @hero_power << attri[:power]
            @hero_bio << attri[:bio]
        end
        erb :team
    end
end
