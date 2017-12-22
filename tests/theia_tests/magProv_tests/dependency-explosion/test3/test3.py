#!/usr/bin/python

######################
### Initialization ###
######################

#create some files
f = open('/home/yang/tests/dependency-explosion/test3/in1', 'w')
f.write("hello world!")
f.close()

##################
###### Test ######
##################

f = open('/home/yang/tests/dependency-explosion/test3/in1', 'r')
s = f.read()
f.close()



a=s.split()
b=a[ord(s[0]) % len(a)]
c=1+ord(b[0])
d=c**c / (c+1)
e="293847236424518412"+str(d)



out = open('/home/yang/tests/dependency-explosion/test3/out', 'w')
out.write(e)
out.close()

