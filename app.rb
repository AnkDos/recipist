require "sinatra"
require 'net/http'
require 'json'

get '/' do
   erb:app
end
post "/req" do
    inp=params[:ing].to_s

    @resp=true
    url = "http://food2fork.com/api/search?key=c8075862473a4c230fea0fadf26ceafa&q=#{inp}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @res=JSON.parse(response)
     @count=@res["count"]
    @ar=Array.new
    @im=Array.new
    i=0
     while i<30
      @ar[i]=@res["recipes"][i]["title"]
      @im[i]=@res["recipes"][i]["image_url"] 
      i+=1
     end
    
    erb:app 
    end