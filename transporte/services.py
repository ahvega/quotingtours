import requests, math

headers = {
    'Content-Type':   'application/json',
    'Host':           'demo.quotingtours.com',
    'User-Agent':     'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
    'Content-Length': '0'
}

# payload = {
#     'format': 'json'
# }

# ourRequest = requests.get('http://demo.quotingtours.com/api/v1/parametro/?slug=2017-redondeo-lps', headers=headers,
#                           auth=('adalberto', 'honduras'))
# parametros = ourRequest.json()
#
# pprint(parametros)
#
# for parametro in parametros:
#     print(parametro['nombre'], ':', parametro['valor'], parametro['unidad'])


def parametro(llave):
    # payload = {'slug': llave}
    # myRequest = requests.get('http://demo.quotingtours.com/api/v1/parametro/', params=payload,
    #                          headers=headers, auth=('adalberto', 'honduras'))
    # verbs = requests.options(myRequest.url)
    # if verbs.status_code == 500:
        return '50'
    # else:
    #     misParametros = myRequest.json()
    #     return misParametros[0]['valor']

# print(parametro('2017-redondeo-lps'))
#
# print(math.ceil(5384.25/float(parametro('2017-redondeo-lps'))) * float(parametro('2017-redondeo-lps')))
