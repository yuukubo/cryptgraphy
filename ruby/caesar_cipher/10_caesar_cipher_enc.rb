require "readline"

# ok! mod is working.

key = 0
plaintext = ""
ciphertext = ""
str1 = []
len = 0
ctr1 = 0
str2 = ""
alph = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
ctr2 = 0
str3 = []
ctr3 = 0

puts
key = Readline.readline("type a number in 0 to 9. > ")
puts 'your key is "' + key + '"'

puts
plaintext = Readline.readline("type 3 letters in a to z. > ")
puts 'your plaintext is "' + plaintext + '"'
str1 = plaintext.split ''
len = plaintext.length

puts
while len - 1 >= ctr1 do
	str2 = str1[ctr1]
	while ctr2 <= 25 do
#		str3 << alph[ctr2.to_i + key.to_i] if alph[ctr2] == str2
		if alph[ctr2] == str2
			ctr3 = (ctr2.to_i + key.to_i) % 26
#			if 26 <= ctr3
#				ctr3 = ctr3 - 26
#			end
			str3 << alph[ctr3]
		end
		ctr2 += 1
	end
	ctr2 = 0
	ctr1 += 1
end

puts
ciphertext = 'your ciphertext is "' + str3.join + '"'
puts ciphertext

puts
Readline.readline("Enter to quit! ")
puts 'See you!'
sleep(2)
