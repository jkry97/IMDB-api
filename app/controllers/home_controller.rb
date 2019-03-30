class HomeController < ApplicationController
    require 'net/http'
    def index
        title = ""
        year = ""
        if request.post? 
            puts "===========> " +params[:search].present?.to_s 
            puts params[:search].inspect

            title = "&t=#{params[:search]["title"]}" if params[:search]["title"].present? 
            year =  "&y=#{params[:search]["year"]}" if params[:search]["year"].present?
        end
        uri = URI("http://www.omdbapi.com/?i=tt3896198&apikey=2437fe75#{title}#{year}")
        result = Net::HTTP.get(uri)
        @result = JSON.parse(result)
    end
end
