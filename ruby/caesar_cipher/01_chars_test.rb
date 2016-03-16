require "readline"

str1 = []

puts
input = Readline.readline("type 3 letters in a to z. > ")
puts 'you type "' + input + '"'
str1 = input.split ''
# puts str1

len = input.length
#puts str1[len - 1]
ctr = 0

#a = 2
#p a
#a -= 1
#p a

puts
while len - 1 >= ctr do
	puts str1[ctr]
	ctr += 1
end

puts
Readline.readline("Enter to quit! ")
puts 'See you!'
