import sys
import requests
import os

def check_endpoints(base_url, wordlist):
    try:
        with open(wordlist, 'r') as f:
            for endpoint in f:
                endpoint = endpoint.strip()
                url = base_url + endpoint
                response = requests.get(url)
                if response.status_code == 200:
                    print(f'[+] FOUND {url}')
                else:
                    pass
    except FileNotFoundError:
        print(f'Error: {wordlist} does not exist or the path is incorrect')
        wordlist = input('Enter the correct path to the wordlist file: ')
        if os.path.exists(wordlist):
            check_endpoints(base_url, wordlist)
        else:
            print(f'Error: {wordlist} does not exist or the path is incorrect')

try:
    base_url = sys.argv[1]
    wordlist = sys.argv[2]
except IndexError:
    print("Please provide the wordlist file path and base url as command line arguments or provide the inputs below:")
    base_url = input('Enter the base URL: ')
    wordlist = input('Enter the path to the wordlist file: ')

check_endpoints(base_url, wordlist)
