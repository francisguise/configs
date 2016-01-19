#!/usr/bin/env python
from keyboard_alike import reader
import time
import sys
import re
import subprocess
import os
import signal

reader = reader.Reader(0x08ff, 0x0009, 84, 16, should_reset=False)

def main():
	card_id = "1851655304"
	reader.initialize()
	p = subprocess.Popen("exec i3lock -n ; killall rfid_login.py", stdout=subprocess.PIPE, shell=True)
	while True:
		RFID_input = reader.read().strip()
		if RFID_input == card_id:
			print "Access Granted" 
			p.kill()
			print "Read uuid from RFID reader:{0}".format(RFID_input)
                        sys.exit()
		else:
			print "Access Denied"
			print "Read uuid from RFID reader:{0}".format(RFID_input)
if __name__ == '__main__':
	main()
