class HomeController < ApplicationController
    def index
        puts params[:name]
    end
end