# Instructions:
#	1) Open the rom file in Hexplorer
#	2) Ctrl-A to select all
#	3) Go to: Edit -> Copy As -> Hex string
#	4) Paste into a file and save in same folder as this script as tempHexROM.txt
#	5) Adjust WIDTH, DEPTH, ADDRESS_RADIX and DATA_RADIX variables below (if needed)
#   6) Run script to get mif file named mifFile.mif
#	7) Renmae .mif file created


WIDTH = 8    # Width in bits of a word
DEPTH = 4096 # Number of words
ADDRESS_RADIX = "UNS" # Address Radix
DATA_RADIX = "HEX"    # Data Radix

with open("tempHexROM.txt") as hexFile:
	lines = hexFile.readlines()
lines = [x.strip("\n") for x in lines]


mifFile = open("mifFile.mif", "w")
mifFile.write("WIDTH=%d;\n" % WIDTH)
mifFile.write("DEPTH=%d;\n" % DEPTH)
mifFile.write("\n")
mifFile.write("ADDRESS_RADIX=" + ADDRESS_RADIX + ";\n")
mifFile.write("DATA_RADIX=" + DATA_RADIX + ";\n")
mifFile.write("\n")
mifFile.write("CONTENT BEGIN\n")

lineNum = 0
for x in range(0, len(lines)):
	for y in range(0, len(lines[x]), 2):
		mifFile.write("\t" + str(lineNum) + "\t" + ":" + "\t" + lines[x][y] + lines[x][y+1] + ";\n")
		lineNum = lineNum + 1

while (lineNum < DEPTH):
	mifFile.write("\t" + str(lineNum) + "\t" + ":" + "\t00;\n")
	lineNum = lineNum + 1

mifFile.write("END;\n")
mifFile.close()