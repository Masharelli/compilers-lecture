#A01633090
#Rocha Avila Hugo Masharelli

import sys

def main():
	print("Lab 1 Compilers")
	print("Code Results:")
	scriptPath =  sys.argv[1]
	functionList = []
	dCommands = {}
	with open(scriptPath) as file:
		for line in file:
			if line[0]=='0':
				words =  line.split(" ")
				functionList.append(words)
			else:
				words = line.split("\t")
				if len(words)>2:
					commands = words[2].split(" ")
					if len(commands) >0: 
						if commands[0] in dCommands:
							dCommands[commands[0]] = dCommands[commands[0]]+1
						else:
							dCommands[commands[0]] = 1

	print("You have {0} kind of instructions in this obj. file:".format(len(dCommands)))
	for comm in dCommands:
		print("  {0}\t: Executed {1} times ".format(comm, dCommands[comm]))
	print("You have {0} functions:".format(len(functionList)))
	for x in  functionList:
		print("  {0}".format( x[1][1:-3] ), end='' )
		space =(24-len(x[1][1:-3])) * ' '
		print(space, end='')
		print(": Located at {0} address".format(x[0][-4:] ))

if __name__ == '__main__':
	main()