######################
### Initialization ###
######################

#create some files
f = open('in1', 'w')
f.write("hello world!")
f.close()

##################
###### Test ######
##################

f = open('in1', 'r')
s = f.read()
f.close()



a=s.split()
b=a[ord(s[0]) % len(a)]
c=1+ord(b[0])
d=c**c / (c+1)
e="293847236424518412"



out = open('out', 'w')
out.write(e)
out.close()

