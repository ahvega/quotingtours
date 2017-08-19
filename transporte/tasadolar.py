import requests


def tasa(pais, tipo):
    headers = {
        'Content-Type':   'application/json',
        'Host':           'www.baccredomatic.com',
        'User-Agent':     'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3055.0 Safari/537.36',
        'Content-Length': '0'
    }

    request = requests.get('https://www.baccredomatic.com/en/bac/exchange-rate-ajax/es-' + pais, headers=headers)

    tasas = request.json()
    venta = tasas[u'saleRateUSD']
    compra = tasas[u'buyRateUSD']
    country = tasas[u'country']

    print(country)

    if tipo == 'compra':
        print 'Tasa Compra'
        print compra
        return compra
    elif tipo == 'venta':
        print "Tasa Venta "
        print venta
        return venta

tasa('hn','compra')