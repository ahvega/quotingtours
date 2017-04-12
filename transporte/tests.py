# import unittest
# from django.core.urlresolvers import reverse
# from django.test import Client
# from .models import TipoDeVehiculo, Parametro, Item, NivelDePrecio, Cotizacion, Cliente, Itinerario, CotizacionDetalle
# from django.contrib.auth.models import User
# from django.contrib.auth.models import Group
# from django.contrib.contenttypes.models import ContentType
#
#
# def create_django_contrib_auth_models_user(**kwargs):
#     defaults = {}
#     defaults["username"] = "username"
#     defaults["email"] = "username@tempurl.com"
#     defaults.update(**kwargs)
#     return User.objects.create(**defaults)
#
#
# def create_django_contrib_auth_models_group(**kwargs):
#     defaults = {}
#     defaults["name"] = "group"
#     defaults.update(**kwargs)
#     return Group.objects.create(**defaults)
#
#
# def create_django_contrib_contenttypes_models_contenttype(**kwargs):
#     defaults = {}
#     defaults.update(**kwargs)
#     return ContentType.objects.create(**defaults)
#
#
# def create_tipodevehiculo(**kwargs):
#     defaults = {}
#     defaults["nombre"] = "nombre"
#     defaults["slug"] = "slug"
#     defaults["rendimiento"] = "rendimiento"
#     defaults["costo_por_dia"] = "costo_por_dia"
#     defaults["costo_por_km"] = "costo_por_km"
#     defaults["capacidad_nominal"] = "capacidad_nominal"
#     defaults["capacidad_real"] = "capacidad_real"
#     defaults["chofer_fijo"] = "chofer_fijo"
#     defaults["activo"] = "activo"
#     defaults.update(**kwargs)
#     return TipoDeVehiculo.objects.create(**defaults)
#
#
# def create_parametro(**kwargs):
#     defaults = {}
#     defaults["nombre"] = "nombre"
#     defaults["slug"] = "slug"
#     defaults["valor"] = "valor"
#     defaults["unidad"] = "unidad"
#     defaults["orden"] = "orden"
#     defaults.update(**kwargs)
#     return Parametro.objects.create(**defaults)
#
#
# def create_item(**kwargs):
#     defaults = {}
#     defaults["nombre"] = "nombre"
#     defaults["slug"] = "slug"
#     defaults["tipo_item"] = "tipo_item"
#     defaults["unidad"] = "unidad"
#     defaults["costo"] = "costo"
#     defaults["precio"] = "precio"
#     defaults["descripcion_compra"] = "descripcion_compra"
#     defaults["descripcion_venta"] = "descripcion_venta"
#     defaults.update(**kwargs)
#     return Item.objects.create(**defaults)
#
#
# def create_niveldeprecio(**kwargs):
#     defaults = {}
#     defaults["nombre"] = "nombre"
#     defaults["slug"] = "slug"
#     defaults["tipo"] = "tipo"
#     defaults["accion"] = "accion"
#     defaults.update(**kwargs)
#     return NivelDePrecio.objects.create(**defaults)
#
#
# def create_cotizacion(**kwargs):
#     defaults = {}
#     defaults["nombre"] = "nombre"
#     defaults["slug"] = "slug"
#     defaults["fecha_vence"] = "fecha_vence"
#     defaults["subtotal"] = "subtotal"
#     defaults["markup"] = "markup"
#     defaults["total"] = "total"
#     defaults.update(**kwargs)
#     if "cotizacion_itinerario" not in defaults:
#         defaults["cotizacion_itinerario"] = create_'transporte.itinerario'()
#     return Cotizacion.objects.create(**defaults)
#
#
# def create_cliente(**kwargs):
#     defaults = {}
#     defaults["nombre"] = "nombre"
#     defaults["slug"] = "slug"
#     defaults["email"] = "email"
#     defaults["tel"] = "tel"
#     defaults.update(**kwargs)
#     if "cliente_niveldeprecio" not in defaults:
#         defaults["cliente_niveldeprecio"] = create_'transporte.niveldeprecio'()
#     return Cliente.objects.create(**defaults)
#
#
# def create_itinerario(**kwargs):
#     defaults = {}
#     defaults["nombre"] = "nombre"
#     defaults["slug"] = "slug"
#     defaults["fecha_desde"] = "fecha_desde"
#     defaults["fecha_hasta"] = "fecha_hasta"
#     defaults["estatus"] = "estatus"
#     defaults.update(**kwargs)
#     if "itinerario_cliente" not in defaults:
#         defaults["itinerario_cliente"] = create_'transporte.cliente'()
#     return Itinerario.objects.create(**defaults)
#
#
# def create_cotizaciondetalle(**kwargs):
#     defaults = {}
#     defaults["descripcion"] = "descripcion"
#     defaults["slug"] = "slug"
#     defaults["cantidad"] = "cantidad"
#     defaults["precio"] = "precio"
#     defaults["_monto"] = "_monto"
#     defaults["markup"] = "markup"
#     defaults["_total"] = "_total"
#     defaults.update(**kwargs)
#     if "detalle_cotizacion" not in defaults:
#         defaults["detalle_cotizacion"] = create_'transporte.cotizacion'()
#     if "detalle_item" not in defaults:
#         defaults["detalle_item"] = create_'transporte.item'()
#     return CotizacionDetalle.objects.create(**defaults)
#
#
# class TipoDeVehiculoViewTest(unittest.TestCase):
#     '''
#     Tests for TipoDeVehiculo
#     '''
#     def setUp(self):
#         self.client = Client()
#
#     def test_list_tipodevehiculo(self):
#         url = reverse('transporte_tipodevehiculo_list')
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_create_tipodevehiculo(self):
#         url = reverse('transporte_tipodevehiculo_create')
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "rendimiento": "rendimiento",
#             "costo_por_dia": "costo_por_dia",
#             "costo_por_km": "costo_por_km",
#             "capacidad_nominal": "capacidad_nominal",
#             "capacidad_real": "capacidad_real",
#             "chofer_fijo": "chofer_fijo",
#             "activo": "activo",
#         }
#         response = self.client.post(url, data=data)
#         self.assertEqual(response.status_code, 302)
#
#     def test_detail_tipodevehiculo(self):
#         tipodevehiculo = create_tipodevehiculo()
#         url = reverse('transporte_tipodevehiculo_detail', args=[tipodevehiculo.slug,])
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_update_tipodevehiculo(self):
#         tipodevehiculo = create_tipodevehiculo()
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "rendimiento": "rendimiento",
#             "costo_por_dia": "costo_por_dia",
#             "costo_por_km": "costo_por_km",
#             "capacidad_nominal": "capacidad_nominal",
#             "capacidad_real": "capacidad_real",
#             "chofer_fijo": "chofer_fijo",
#             "activo": "activo",
#         }
#         url = reverse('transporte_tipodevehiculo_update', args=[tipodevehiculo.slug,])
#         response = self.client.post(url, data)
#         self.assertEqual(response.status_code, 302)
#
#
# class ParametroViewTest(unittest.TestCase):
#     '''
#     Tests for Parametro
#     '''
#     def setUp(self):
#         self.client = Client()
#
#     def test_list_parametro(self):
#         url = reverse('transporte_parametro_list')
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_create_parametro(self):
#         url = reverse('transporte_parametro_create')
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "valor": "valor",
#             "unidad": "unidad",
#             "orden": "orden",
#         }
#         response = self.client.post(url, data=data)
#         self.assertEqual(response.status_code, 302)
#
#     def test_detail_parametro(self):
#         parametro = create_parametro()
#         url = reverse('transporte_parametro_detail', args=[parametro.slug,])
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_update_parametro(self):
#         parametro = create_parametro()
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "valor": "valor",
#             "unidad": "unidad",
#             "orden": "orden",
#         }
#         url = reverse('transporte_parametro_update', args=[parametro.slug,])
#         response = self.client.post(url, data)
#         self.assertEqual(response.status_code, 302)
#
#
# class ItemViewTest(unittest.TestCase):
#     '''
#     Tests for Item
#     '''
#     def setUp(self):
#         self.client = Client()
#
#     def test_list_item(self):
#         url = reverse('transporte_item_list')
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_create_item(self):
#         url = reverse('transporte_item_create')
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "tipo_item": "tipo_item",
#             "unidad": "unidad",
#             "costo": "costo",
#             "precio": "precio",
#             "descripcion_compra": "descripcion_compra",
#             "descripcion_venta": "descripcion_venta",
#         }
#         response = self.client.post(url, data=data)
#         self.assertEqual(response.status_code, 302)
#
#     def test_detail_item(self):
#         item = create_item()
#         url = reverse('transporte_item_detail', args=[item.slug,])
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_update_item(self):
#         item = create_item()
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "tipo_item": "tipo_item",
#             "unidad": "unidad",
#             "costo": "costo",
#             "precio": "precio",
#             "descripcion_compra": "descripcion_compra",
#             "descripcion_venta": "descripcion_venta",
#         }
#         url = reverse('transporte_item_update', args=[item.slug,])
#         response = self.client.post(url, data)
#         self.assertEqual(response.status_code, 302)
#
#
# class NivelDePrecioViewTest(unittest.TestCase):
#     '''
#     Tests for NivelDePrecio
#     '''
#     def setUp(self):
#         self.client = Client()
#
#     def test_list_niveldeprecio(self):
#         url = reverse('transporte_niveldeprecio_list')
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_create_niveldeprecio(self):
#         url = reverse('transporte_niveldeprecio_create')
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "tipo": "tipo",
#             "accion": "accion",
#         }
#         response = self.client.post(url, data=data)
#         self.assertEqual(response.status_code, 302)
#
#     def test_detail_niveldeprecio(self):
#         niveldeprecio = create_niveldeprecio()
#         url = reverse('transporte_niveldeprecio_detail', args=[niveldeprecio.slug,])
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_update_niveldeprecio(self):
#         niveldeprecio = create_niveldeprecio()
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "tipo": "tipo",
#             "accion": "accion",
#         }
#         url = reverse('transporte_niveldeprecio_update', args=[niveldeprecio.slug,])
#         response = self.client.post(url, data)
#         self.assertEqual(response.status_code, 302)
#
#
# class CotizacionViewTest(unittest.TestCase):
#     '''
#     Tests for Cotizacion
#     '''
#     def setUp(self):
#         self.client = Client()
#
#     def test_list_cotizacion(self):
#         url = reverse('transporte_cotizacion_list')
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_create_cotizacion(self):
#         url = reverse('transporte_cotizacion_create')
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "fecha_vence": "fecha_vence",
#             "subtotal": "subtotal",
#             "markup": "markup",
#             "total": "total",
#             "cotizacion_itinerario": create_'transporte.itinerario'().id,
#         }
#         response = self.client.post(url, data=data)
#         self.assertEqual(response.status_code, 302)
#
#     def test_detail_cotizacion(self):
#         cotizacion = create_cotizacion()
#         url = reverse('transporte_cotizacion_detail', args=[cotizacion.slug,])
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_update_cotizacion(self):
#         cotizacion = create_cotizacion()
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "fecha_vence": "fecha_vence",
#             "subtotal": "subtotal",
#             "markup": "markup",
#             "total": "total",
#             "cotizacion_itinerario": create_'transporte.itinerario'().id,
#         }
#         url = reverse('transporte_cotizacion_update', args=[cotizacion.slug,])
#         response = self.client.post(url, data)
#         self.assertEqual(response.status_code, 302)
#
#
# class ClienteViewTest(unittest.TestCase):
#     '''
#     Tests for Cliente
#     '''
#     def setUp(self):
#         self.client = Client()
#
#     def test_list_cliente(self):
#         url = reverse('transporte_cliente_list')
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_create_cliente(self):
#         url = reverse('transporte_cliente_create')
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "email": "email",
#             "tel": "tel",
#             "cliente_niveldeprecio": create_'transporte.niveldeprecio'().id,
#         }
#         response = self.client.post(url, data=data)
#         self.assertEqual(response.status_code, 302)
#
#     def test_detail_cliente(self):
#         cliente = create_cliente()
#         url = reverse('transporte_cliente_detail', args=[cliente.slug,])
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_update_cliente(self):
#         cliente = create_cliente()
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "email": "email",
#             "tel": "tel",
#             "cliente_niveldeprecio": create_'transporte.niveldeprecio'().id,
#         }
#         url = reverse('transporte_cliente_update', args=[cliente.slug,])
#         response = self.client.post(url, data)
#         self.assertEqual(response.status_code, 302)
#
#
# class ItinerarioViewTest(unittest.TestCase):
#     '''
#     Tests for Itinerario
#     '''
#     def setUp(self):
#         self.client = Client()
#
#     def test_list_itinerario(self):
#         url = reverse('transporte_itinerario_list')
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_create_itinerario(self):
#         url = reverse('transporte_itinerario_create')
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "fecha_desde": "fecha_desde",
#             "fecha_hasta": "fecha_hasta",
#             "estatus": "estatus",
#             "itinerario_cliente": create_'transporte.cliente'().id,
#         }
#         response = self.client.post(url, data=data)
#         self.assertEqual(response.status_code, 302)
#
#     def test_detail_itinerario(self):
#         itinerario = create_itinerario()
#         url = reverse('transporte_itinerario_detail', args=[itinerario.slug,])
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_update_itinerario(self):
#         itinerario = create_itinerario()
#         data = {
#             "nombre": "nombre",
#             "slug": "slug",
#             "fecha_desde": "fecha_desde",
#             "fecha_hasta": "fecha_hasta",
#             "estatus": "estatus",
#             "itinerario_cliente": create_'transporte.cliente'().id,
#         }
#         url = reverse('transporte_itinerario_update', args=[itinerario.slug,])
#         response = self.client.post(url, data)
#         self.assertEqual(response.status_code, 302)
#
#
# class CotizacionDetalleViewTest(unittest.TestCase):
#     '''
#     Tests for CotizacionDetalle
#     '''
#     def setUp(self):
#         self.client = Client()
#
#     def test_list_cotizaciondetalle(self):
#         url = reverse('transporte_cotizaciondetalle_list')
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_create_cotizaciondetalle(self):
#         url = reverse('transporte_cotizaciondetalle_create')
#         data = {
#             "descripcion": "descripcion",
#             "slug": "slug",
#             "cantidad": "cantidad",
#             "precio": "precio",
#             "_monto": "_monto",
#             "markup": "markup",
#             "_total": "_total",
#             "detalle_cotizacion": create_'transporte.cotizacion'().id,
#             "detalle_item": create_'transporte.item'().id,
#         }
#         response = self.client.post(url, data=data)
#         self.assertEqual(response.status_code, 302)
#
#     def test_detail_cotizaciondetalle(self):
#         cotizaciondetalle = create_cotizaciondetalle()
#         url = reverse('transporte_cotizaciondetalle_detail', args=[cotizaciondetalle.slug,])
#         response = self.client.get(url)
#         self.assertEqual(response.status_code, 200)
#
#     def test_update_cotizaciondetalle(self):
#         cotizaciondetalle = create_cotizaciondetalle()
#         data = {
#             "descripcion": "descripcion",
#             "slug": "slug",
#             "cantidad": "cantidad",
#             "precio": "precio",
#             "_monto": "_monto",
#             "markup": "markup",
#             "_total": "_total",
#             "detalle_cotizacion": create_'transporte.cotizacion'().id,
#             "detalle_item": create_'transporte.item'().id,
#         }
#         url = reverse('transporte_cotizaciondetalle_update', args=[cotizaciondetalle.slug,])
#         response = self.client.post(url, data)
#         self.assertEqual(response.status_code, 302)
