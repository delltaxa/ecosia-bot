import requests
import subprocess

print("""\033[36m
   _____            _    _              
  / ____|          | |  (_)             
 | |     ___   ___ | | ___  ___ ________
 | |    / _ \ / _ \| |/ / |/ _ \_  /_  /
 | |___| (_) | (_) |   <| |  __// / / / 
  \_____\___/ \___/|_|\_\_|\___/___/___|
\033[0m""")


url = input("\033[34m[>]\033[0m Enter the url \033[33m>>\033[0m ")

print("\n\033[34m[*]\033[0m Generating curl payload")
payload = "curl -i \"" + url + "\""

print("\033[34m[*]\033[0m Requesting Server...")
response = subprocess.getoutput(payload)
print("\n\033[32m[+]\033[0m Got response\n")

print("\033[34m[*]\033[0m Extracting Cookies from response\n")
cookie = ""
for x in response.split("\n"):
	if x.startswith("set-cookie:"):
		print("\033[32m[+]\033[0m Found part of cookie")
		nostart = x.replace("set-cookie:", "").strip()
		cookie += nostart + "; "
cookie = cookie.strip()
cookie = cookie[0:cookie.__len__() - 1]

print("\n\033[32m[+] [INFO]\033[0m Genrated cookie: \033[32m" + cookie + "\033[0m")
