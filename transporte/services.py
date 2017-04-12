from pprint import pprint
import requests

headers = {
    'Content-Type':   'application/json',
    'Host':           'demo.quotingtours.com',
    'User-Agent':     'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3055.0 Safari/537.36',
    'Content-Length': '0'
}

# payload = {
#     'format': 'json'
# }

ourRequest = requests.get('http://demo.quotingtours.com/api/v1/parametro/', headers=headers, auth=('adalberto','honduras'))
parametros = ourRequest.json()

pprint(parametros)

for parametro in parametros:
    print parametro['nombre'],':', parametro['valor'], parametro['unidad']
