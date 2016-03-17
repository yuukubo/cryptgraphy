require "readline"

# ###################################
# variable part start
strmode = ""
strinputtype = ""
stroutputtype = ""
strkey = "key"
strinput = ""
stroutput = ""

# ###################################
# def part start

def chooseMode
	strinputtype = ""
	stroutputtype = ""
	getmode = ""

	puts
	puts "choose mode."
	getmode = Readline.readline("encrypt or decrypt? type \"e\" or \"d\". > ")
	case getmode
	when 'e'
		strinputtype = "plaintext"
		stroutputtype = "ciphertext"
	when 'd'
		strinputtype = "ciphertext"
		stroutputtype = "plaintext"
	else
		errExit("mode")
	end
	return getmode, strinputtype, stroutputtype
end

def getInput(gettarget) # gettarget is key or plaintext or ciphertext
	case gettarget
	when 'key'
		getmessage = "type a number in 0 to 9."
		getcheck = /^[0-9]+$/
	when 'plaintext'
		getmessage = "type letters in a to z(like abc)."
		getcheck = /^[a-z]+$/
	when 'ciphertext'
		getmessage = "type letters in a to z(like xyz)."
		getcheck = /^[a-z]+$/
	end
	puts
	getline = Readline.readline("#{getmessage} > ")
	if getline =~ getcheck
		puts "  your #{gettarget} is \"#{getline}\"."
	else
		errExit(gettarget)
	end
	return(getline)
end

def errExit(errpoint)
	errmessage = ""

	case errpoint
	when 'mode'
		errmessage = "\"e\" or \"d\"!"
	when 'key'
		errmessage = "a number!"
	when 'plaintext'
		errmessage = "alphabet only!"
	when 'ciphertext'
		errmessage = "alphabet only!"
	end
	puts "  type #{errmessage} try again! "
	sleep(2)
	exit(99)
end

def getCrypt(strmode,strkey,strinput)
	str1 = [] # work strings to get letter array
	len = 0 # plaintext's length
	ctr1 = 0 # roop counter to the length
	str2 = "" # get each letter
	alph = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
	ctr2 = 0 # roop counter for alph check
	str3 = [] # work cipher array
	ctr3 = 0 # shift alph index
	stroutput = ""

	str1 = strinput.split ''
	len = strinput.length

	while len - 1 >= ctr1 do
		str2 = str1[ctr1]
		while ctr2 <= 25 do
			if alph[ctr2] == str2
				case strmode
				when 'e'
					ctr3 = (ctr2.to_i + strkey.to_i) % 26
				when 'd'
					ctr3 = (ctr2.to_i - strkey.to_i % 26 + 26) % 26
				end
				str3 << alph[ctr3]
			end
			ctr2 += 1
		end
		ctr2 = 0
		ctr1 += 1
	end
	stroutput = str3.join
	return stroutput
end

def putOutput(stroutputtype, stroutput)
	puts
	puts "process is over"
	puts "  your #{stroutputtype} is \"#{stroutput}\"."
end

def nomalEnd
	puts
	Readline.readline("Enter to quit! ")
	puts "See you!"
	sleep(2)
end

# ###################################
# main part start

# choose mode
strmode, strinputtype, stroutputtype = chooseMode

# get key and inputtext
strkey = getInput(strkey)
strinput = getInput(strinputtype)

# start enc or dec
stroutput = getCrypt(strmode,strkey,strinput)

# print outputtext
putOutput(stroutputtype, stroutput)

# nomal end
nomalEnd

# ###################################
# eof ###############################
