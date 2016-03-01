#!/usr/bin python

import urllib2
from base64 import b64encode

parameters = {}
parameters["baseurl"] = 'http://ovh.com/nic/update?system=dyndns&hostname='
parameters["hostname"] = "my.host.tld"		# use your own hostname here
parameters["id"] = "ovh-id"					# use your own id here
parameters["password"] = "password"			# use your own password here

try:
	request = urllib2.Request(parameters["baseurl"]+parameters["hostname"])
	request.add_header('Authorization', 'Basic' + b64encode(parameters["id"] + ':' + parameters["password"]))
	r = urllib2.urlopen(request)
except urllib2.HTTPError as e:
	print e

