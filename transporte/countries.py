#!/usr/bin/python
# -*- coding:  utf-8 -*-
import requests

def info_pais(pais):
    headers = {
        "Accept":  "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Encoding": "gzip, deflate, br",
        "Accept-Language": "en-US",
        "Connection": "keep-alive",
        "Host": "restcountries.eu",
        "Upgrade-Insecure-Requests": "1",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3055.0 Safari/537.36"
    }

    request = requests.get('http://restcountries.eu/rest/v2/name/'+pais, headers=headers)

    lospaises = request.json()

    paises = []

    for country in lospaises:
        paises.append({
            'nombre': country[u'translations'][u'es'],
            'codigo2': country[u'alpha2Code'],
            'codigo3': country[u'alpha3Code']
        })

    nombre = lospaises[0][u'translations'][u'es']
    codigo2 = lospaises[0][u'alpha2Code']
    codigo3 = lospaises[0][u'alpha3Code']

    return lospaises

    # if parametro == 'codigo2':
    #     return codigo2
    #
    # if parametro == 'codigo3':
    #     return codigo3
    #
    # if parametro == 'nombre':
    #     return nombre


# print info_pais('nombre','Panama')
# print info_pais('codigo2', 'Panama')
# print info_pais('codigo3', 'Honduras')
