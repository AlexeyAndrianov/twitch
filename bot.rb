require 'socket'

TWITCH_HOST = "irc.twitch.tv"
TWITCH_PORT = 6667

class TwitchBot
  attr_reader :socket

  def initialize
    @nickname = "estarielbot"
    @password = "oauth:lib1esf88ufeco9kuwqmk2ijn2xpry"
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

  def run
    write_to_chat('qwe')
    until @socket.eof? do
      message = @socket.gets
      puts message
    end
  end
end


# require 'socket'
# require 'pry'
GET https://id.twitch.tv/oauth2/authorize?client_id=jfflzki62tlvxxwnbc1kj3i8lmrpqg&redirect_uri=http://localhost&response_type=viewing_activity_read

# CLIENT_ID = 'jfflzki62tlvxxwnbc1kj3i8lmrpqg'
# CLIENT_SECRET = '7be4r6b2716iy8u09hupj9yrx25cxh'
# ACCESS_TOKEN = '9nwqcanizwl8pljuqusv3oyuoc6agf'
# # TOKEN = 'bbgom5ksv4oc2qznyki52ywzh31qx5'
# NICKNAME = "estarielbot"

# puts 'preparing to connect..'

# socket = TCPSocket.new('irc.chat.twitch.tv', 6667)
# running = true

# puts 'connected ...'

# socket.puts("PASS oauth:#{ACCESS_TOKEN}")
# socket.puts("NICK #{NICKNAME}")

# puts 'passed!'

# Thread.start do
#   while (running) do
#     ready = IO.select([socket])

#     ready[0].each do |s|
#       line = s.gets
#       puts s.gets
#     end
#   end
# end
# while (running) do
#   command = gets.chomp

#   if command == 'quit'
#     running = false
#     socket.puts command
#   else
#     puts "< #{command}"
#     socket.puts(command)
#   end
# end

# puts 'exited.'



#PRIVMSG #estariel :hi hi

# curl -H 'Client-ID: jfflzki62tlvxxwnbc1kj3i8lmrpqg' \
# -X GET 'https://api.twitch.tv/helix/streams?user_login=hiko'
# POST https://id.twitch.tv/oauth2/token?client_id=jfflzki62tlvxxwnbc1kj3i8lmrpqg&client_secret=7be4r6b2716iy8u09hupj9yrx25cxh&grant_type=client_credentials
# POST https://id.twitch.tv/oauth2/token?client_id=jfflzki62tlvxxwnbc1kj3i8lmrpqg&client_secret=7be4r6b2716iy8u09hupj9yrx25cxh&grant_type=client_credentials&scope=analytics:read:games

# POST https://id.twitch.tv/oauth2/token?response_type=token&client_id=jfflzki62tlvxxwnbc1kj3i8lmrpqg&client_secret=7be4r6b2716iy8u09hupj9yrx25cxh&grant_type=client_credentials&scope=analytics:read:games



# TWITCH_CHAT_TOKEN = 'hrzayhfroomkkzik2d8jw1z739ayr3'
# TWITCH_USER       = 'estariel'

# require 'socket'
# require 'logger'

# Thread.abort_on_exception = true

# class Twitch
#   attr_reader :logger, :running, :socket

#   def initialize(logger = nil)
#     @logger  = logger || Logger.new(STDOUT)
#     @running = false
#     @socket  = nil
#   end

#   def send(message)
#     logger.info "< #{message}"
#     socket.puts(message)
#   end

#   def run
#     logger.info 'Preparing to connect...'

#     @socket = TCPSocket.new('irc.chat.twitch.tv', 6667)
#     @running = true

#     socket.puts("PASS #{TWITCH_CHAT_TOKEN}")
#     socket.puts("NICK #{TWITCH_USER}")

#     logger.info 'Connected...'

#     Thread.start do
#       while (running) do
#         ready = IO.select([socket])

#         ready[0].each do |s|
#           line    = s.gets
#           match   = line.match(/^:(.+)!(.+) PRIVMSG #(\w+) :(.+)$/)
#           message = match && match[4]

#           if message =~ /^!hello/
#             user = match[1]
#             logger.info "USER COMMAND: #{user} - !hello"
#             send "PRIVMSG #open_mailbox :Hello, #{user} from Mailbot!"
#           end

#           logger.info "> #{line}"
#         end
#       end
#     end
#   end

#   def stop
#     @running = false
#   end
# end

# if TWITCH_CHAT_TOKEN.empty? || TWITCH_USER.empty?
#   puts "You need to fill in your own Twitch credentials!"
#   exit(1)
# end

# bot = Twitch.new
# bot.run

# while (bot.running) do
#   command = gets.chomp

#   if command == 'quit'
#     bot.stop
#   else
#     bot.send(command)
#   end
# end

# puts 'Exited.'
