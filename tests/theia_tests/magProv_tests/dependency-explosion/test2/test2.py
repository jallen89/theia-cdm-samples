import urllib2
f =  urllib2.urlopen("http://facebook.com")


f2 = urllib2.urlopen("http://google.com")
f3 = urllib2.urlopen("http://yahoo.com")

#Overwrite
f =  urllib2.urlopen("http://uic.edu")


f4 = urllib2.urlopen("http://bing.com")
f5 = urllib2.urlopen("http://apple.com")


out = open('out.html', 'w')
out.write(f.read())
out.close()