import sys
import json

try:
	jso = ""
	
	try:
		jso = sys.argv[1]
	except:
		print("\033[1;31m[-] [ERROR]\033[0;0m Couldn't get the counter")
		exit()

	jsn = json.loads(jso)
	trees = jsn["personal_counter"]

	print("\033[0;32m[+] [INFO]\033[0;0m total: \033[0;32m" + str(trees) + "\033[0;0m")
except json.decoder.JSONDecodeError:
	print("\033[1;31m[-] [ERROR]\033[0;0m Couldn't decode the counter")