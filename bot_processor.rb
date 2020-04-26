require 'pry'
def require_files
  Dir["*.rb"].each {|file| require_relative file }
end

require_files
bot = TwitchBot.new
bot.run
