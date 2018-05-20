# Pip
pip3 list							# show all packages
pip3 install --upgrade pip			# upgrade pip itself
pip3 freeze --local > packages.txt	# create a list of all installed python packages (in "packages.txt")

# VirtualEnv
# work with multiple virtual Python environments ("containers for poor people")

sudo pip3 install virtualenv						# install virtualenv
virtualenv myProjectFolder							# create new virtual environment
virtualenv -p /usr/bin/python2.6 myProjectFolder	# create new virtual environment (with special Python binary)
source myProjectFolder/bin/activate					# activate new environment (see in bash prompt "myProjectFolder")
deactivate											# deactivate environment ("myProjectFolder")

# Einrückung = 4 Spaces / Tab

# Parser-Gerüst:
import sys
import re

f = open(sys.argv[1], "r")
lines = f.readlines()
f.close()

f2 = open(sys.argv[2], "w")

for line in lines:
    splitting = re.split(',',line)
    f2.write()
    
f2.close()

# Argumente
import sys
sys.argv[0]	# Skriptname
sys.argv[1] # 1.Argument

# Funktion
def myFunction(test):
    test = test+42
    return test

# IF
if condition==0:
    #...

# FOR-EACH
for element in dataStructure:
    #...
	
# File lesen/schreiben
f = open('file.txt', "r")
lines = f.readlines()
f.close()

f = open('file.txt', "w")
f.write('Mein Text')
f.close()

#CSV - Writer
import csv
filename = 'test.csv'
f = open(filename, 'w', newline="");
myWriter = csv.writer(f, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
myWriter.writerow(line)

# String - Splitting
import re
splitting = re.split(';',myString)

# ###########################

myString = "papa"

found = "pa" in myString		# very basic regex matching

myString.startswith("pa")
myString.endswith("pa")

myString[:-1]					# cut off last character	

myStringMultiLine = """papa"""						

# ###########################

# String - Operations
myStringNew = myStringold.replace('mama','papa')			# replaces ALL occurences
myStringInUpperCase = myString.upper()

myStringWithNewLine = "My line.\n"
myStringWithoutNewLine = myStringWithNewLine.strip()		# trailing and leading whitespace chars removed


# String - Tricks
print "Hallo"*3 	# HalloHalloHallo

#MySQL - https://github.com/petehunt/PyMySQL
import pymysql
conn = pymysql.connect(host='[DB-Adresse]', port=3306, user='[User-Name]', passwd='[Password]', db='[DB-Name]') 
cur = conn.cursor()
cmd = "SELECT * FROM table"
cur.execute(cmd)
for r in cur.fetchall():
    #print(r)
    #temp = list(r)
    #line = [str(x) for x in temp]
cur.close()
conn.close()

#Liste
myList = []
myList.append(element)
myList[:-1] 		# alles bis auf das letzte Zeichen
myList[-8:]			# die letzten 8 Zeichen
myList[1:]			# alles bis auf das erste/0. Element

#Dictionary
mydict = {}
mydict['key'] = value

# Hash
import hashlib
hashedDestIP    = hashlib.sha256(str.encode(myString)).hexdigest()

# Interpret binary data - data kann aus file gelesen werden z.B.
field_names = ('field1','field2','field3')
values = struct.unpack('!HHH',data[0:6])
header = dict(zip(field_names, values))

#http://vislab-ccom.unh.edu/~schwehr/Classes/2011/esci895-researchtools/python-binary-files.html