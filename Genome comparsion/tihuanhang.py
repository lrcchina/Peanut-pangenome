import sys
import getopt
import string
from optparse import OptionParser
import re
parser = OptionParser()
parser.add_option("-i", "--inFile", dest="inFile",help="A SAM file or standard input (-i stdin).",metavar="FILE")
(opts, args) = parser.parse_args()
#print(opts.inFile)
if opts.inFile == "stdin":
	data = sys.stdin
content=""
for line in data:
	conts = line.strip()
	contss=conts.split("\n")
	content=content+contss[0]
print(content)

