# Instructions:
#	1) Open the rom file in Hexplorer
#	2) Ctrl-A to select all
#	3) Go to: Edit -> Copy As -> Hex string
#	4) Paste into a file and save in same folder as this script as tempHexROM.txt
#   5) Run script to get .txt file named hexFile.txt
#	6) Rename .txt file created


with open("tempHexROM.txt") as hexFile:
	lines = hexFile.readlines()
lines = [x.strip("\n") for x in lines]


outFile = open("hexFile.txt", "w")

wordCount = 0
for x in range(0, len(lines)):
	for y in range(0, len(lines[x]), 2):
		outFile.write(lines[x][y] + lines[x][y+1] + "\n")
		wordCount = wordCount + 1

outFile.close()

print ("Number of words: %d " % wordCount)
