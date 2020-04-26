require 'socket'
require 'pry'

TWITCH_HOST = "irc.twitch.tv"
TWITCH_PORT = 6667

class TwitchBot
  attr_reader :socket

  def initialize
    @nickname = "estarielbot"
    @password = "oauth:1zejgddmm3kxldpk80timytnppyqmo"
    @channel = "estariel"
    @socket = TCPSocket.open(TWITCH_HOST, TWITCH_PORT)

    write_to_system "PASS #{@password}"
    write_to_system "NICK #{@nickname}"
    write_to_system "USER #{@nickname} 0 * #{@nickname}"
    write_to_system "JOIN ##{@channel}"
  end

  def write_to_system(message)
    @socket.puts message
  end

  def write_to_chat(message)
    write_to_system "PRIVMSG ##{@channel} :#{message}"
  end

  def spam
    sleep 1
    write_to_chat("TriHard 7 ----> #{Time.now}")
  end

  def run
    until @socket.eof? do
      message = @socket.gets
      puts message
    end
  end
end

bot = TwitchBot.new
# bot.run
bot.spam

# !!!
# curl -H "Authorization: OAuth 122t92t69rl8s9uq0291ctv915r82a" https://id.twitch.tv/oauth2/validate
