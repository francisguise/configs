#!/usr/bin/env python
from keyboard_alike import reader
import time
import sys
import re
import subprocess

reader = reader.Reader(0x08ff, 0x0009, 84, 16, should_reset=False)

def get_chan(reader_id):
	device_re = re.compile("Bus\s+(?P<bus>\d+)\s+Device\s+(?P<device>\d+).+ID\s(?P<id>"+reader_id+")\s(?P<tag>.+)$", re.I)
	df = subprocess.check_output("lsusb", shell=True)
	for i in df.split('\n'):
		if i:
			info = device_re.match(i)
			if info:
				dinfo = info.groupdict()
				chan = '/dev/bus/usb/%s/%s' % (dinfo.pop('bus'), dinfo.pop('device'))
	return chan

def main():
	#reader_id = '08ff:0009'
	#chan = get_chan(reader_id)
	#with open(chan, 'r') as tty:
	card_id = "1851655304"
	reader.initialize()
	while True:
		#RFID_input = input()			
		#for RFID_input in s:
		#RFID_input = tty.readline().rstrip()
		RFID_input = reader.read().strip()
		if RFID_input == card_id:
			print "Access Granted" 
			print "Read uuid from RFID reader:{0}".format(RFID_input)
		else:
			print "Access Denied"
			print "Read uuid from RFID reader:{0}".format(RFID_input)
if __name__ == '__main__':
	main()
