#!/usr/local/bin/python
# coding=iso-8859-1

import googlemaps
import math

gmaps = googlemaps.Client(key='AIzaSyBbYU7-6GDjiGSWrpw5a1xKd1AUJMX5lnU')

# gmaps = googlemaps.Client(key='AIzaSyCVEN7Yja8dYfKfR56374wCoSrSmSkD_Ao')


def distancia(origen, destino):
    directions = gmaps.directions(origen, destino, language='es')
    direcciones = directions[0]['legs'][0]
    distancia_valor = math.ceil(direcciones['distance']['value']) / 1000
    return round(distancia_valor, 0)


def duracion(origen, destino):
    directions = gmaps.directions(origen, destino, language='es')
    direcciones = directions[0]['legs'][0]
    duracion_valor = math.floor(direcciones['duration']['value']) / 3600
    return round(duracion_valor, 2)


def verbage(origen, destino):
    directions = gmaps.directions(origen, destino, language='es')
    direcciones = directions[0]['legs'][0]
    distancia_text = direcciones['distance']['text']
    duracion_text = direcciones['duration']['text']
    return u'Desde: '+origen+u' Hacia: '+destino+u' son '+distancia_text+u', (en '+duracion_text+u') por vía'


# print(distancia('San Pedro Sula, Honduras', 'Tegucigalpa, Honduras'))
# print(duracion('San Pedro Sula, Honduras', 'Tegucigalpa, Honduras'))
# print(verbage('San Pedro Sula, Honduras', 'Tegucigalpa, Honduras'))
#
# mdirections = gmaps.directions('San Pedro Sula, Honduras', 'Copan Ruinas, Honduras', language='es')
# mdirecciones = directions[0]['legs'][0]
#
# desde = direcciones['start_address']
# hacia = direcciones['end_address']
# distancia = direcciones['distance']['text']
# distancia_v = direcciones['distance']['value']
# duracion = direcciones['duration']['text']
# duracion_v = direcciones['duration']['value']
# steps = direcciones['steps']
#
# print(desde)
# print(hacia)
# print(distancia)
# print(distancia_v)
# print(duracion)
# print(duracion_v)
#
# for step in steps:
#     print(step['html_instructions'])
