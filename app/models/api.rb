require 'uri'
require 'net/http'
require 'json'
class Api < ApplicationRecord
    def self.load_data

        uri = URI("http://api.mediastack.com/v1/news?access_key=5b56e94b2e2f9d2a796e4a32261030ff&countries=us&sort=published_desc&limit=100")
        
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        
        data["data"].each do |d|
            if !Article.exists?(d)
                @article = Article.create(d)
                
            
            end
          
        end
        
    end
    
end