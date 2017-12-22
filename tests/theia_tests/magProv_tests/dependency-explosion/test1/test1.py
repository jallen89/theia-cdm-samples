#!/usr/bin/python

######################
### Initialization ###
######################

#create some files
f1 = open('/home/yang/tests/dependency-explosion/test1/in1', 'w')
f1.write("hello world!")
f1.close()
f2 = open('/home/yang/tests/dependency-explosion/test1/in2', 'w')
f2.write("hello world!")
f2.close()
f3 = open('/home/yang/tests/dependency-explosion/test1/in3', 'w')
f3.write("hello world!")
f3.close()
f4 = open('/home/yang/tests/dependency-explosion/test1/in4', 'w')
f4.write("hello world!")
f4.close()


##################
###### Test ######
##################

f1 = open('/home/yang/tests/dependency-explosion/test1/in1', 'r')
f2 = open('/home/yang/tests/dependency-explosion/test1/in2', 'r')
f3 = open('/home/yang/tests/dependency-explosion/test1/in3', 'r')
f4 = open('/home/yang/tests/dependency-explosion/test1/in4', 'r')
out = open('/home/yang/tests/dependency-explosion/test1/out', 'w')

#read
s1 = f1.read()
s2 = f2.read()
s3 = f3.read()
s4 = f4.read()

#write
out.write(s2)
f1.close()
f2.close()
f3.close()
f4.close()
out.close()

print "done"
