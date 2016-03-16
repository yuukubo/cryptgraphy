require "readline"

key = 0
plaintext = 0
# ciphertext = 0

puts ""
key = Readline.readline("type a number in 0 to 9. > ")
puts 'your key is "' + key + '"'

puts ""
plaintext = Readline.readline("type 3 letters in a to z. > ")
puts 'your plaintext is "' + plaintext + '"'






puts ""
Readline.readline("Enter to quit! ")
puts 'See you!'
