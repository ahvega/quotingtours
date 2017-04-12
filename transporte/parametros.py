import requests
from pprint import pprint

headers = {
    'Authorization': 'Basic YWRhbGJlcnRvOmhvbmR1cmFz',
    'Content-Type':   'application/json',
    'Host':           'demo.quotingtours.com',
    'User-Agent':     'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3055.0 Safari/537.36',
    'Content-Length': '0'
}

request = requests.get('http://demo.quotingtours.com/api/v1/parametro/?slug=2017-redondeo-lps', headers=headers)
parametros = request.json()
pprint(parametros)
print(parametros[0]['valor'])

def getparametro(llave):
    pass