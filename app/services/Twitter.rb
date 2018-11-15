require 'dotenv'
require 'twitter'

Dotenv.load

client = Twitter::REST::Client.new do |config|
   config.consumer_key        = ENV["CONSUMER_KEY"]
   config.consumer_secret     = ENV["CONSUMER_SECRET"]
   config.access_token        = ENV["ACCESS_TOKEN"]
   config.access_token_secret = ENV["ACCESS_SECRET"]
 end

    tab_tags = []
    tab_tags << "developpeur"
    tab_user = []while true


tab_tags.each do |tag|
  client.search(tag).take(10).collect do |tweet|
         #puts "#{Time.now.utc} - #{tweet.created_at} -  #{tweet.user.screen_name}: #{tweet.text}"
    tab_user << tweet.user.screen_name
       #puts tab_user
    tab_user.each do |user|
      client.update("Salut, @#{user} viens faire un tour ici : http...")
    end
  end
end
