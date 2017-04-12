from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.auth import views as auth_views
from rest_framework import routers
from rest_framework.authtoken import views as authviews
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token

from transporte import api
from transporte import views
from transporte.views import indice

admin.autodiscover()
router = routers.DefaultRouter()
router.register(r'tipodevehiculo', api.TipoDeVehiculoViewSet)
router.register(r'parametro', api.ParametroViewSet)
router.register(r'item', api.ItemViewSet)
router.register(r'niveldeprecio', api.NivelDePrecioViewSet)
router.register(r'cotizacion', api.CotizacionViewSet)
router.register(r'cliente', api.ClienteViewSet)
router.register(r'itinerario', api.ItinerarioViewSet)
router.register(r'cotizaciondetalle', api.CotizacionDetalleViewSet)
router.register(r'vehiculo', api.VehiculoViewSet)
router.register(r'tramo', api.TramoViewSet)
router.register(r'lugar', api.LugarViewSet)
router.register(r'conductor', api.ConductorViewSet)

urlpatterns = [
    url(r'^login/$', auth_views.login, name='iniciar'),
    url(r'^logout/$', auth_views.logout, name='salir'),
    url(r'^admin/', admin.site.urls),
    url(r'^$', indice, name='home'),
    url(r'^tabla/$', views.ItinerarioDataTable.as_view(),
        name='transporte_itinerario_table'),
]

urlpatterns += [
    # urls for Django Rest Framework API
    url(r'^api/v1/', include(router.urls)),
]

urlpatterns += [
    url(r'^docs/', include('rest_framework_docs.urls')),
]

urlpatterns += [
    url(r'^api-token/', authviews.obtain_auth_token),
]

urlpatterns += [
    url(r'^api-token-auth/', obtain_jwt_token),
]

urlpatterns += [
    url(r'^api-token-refresh/', refresh_jwt_token),
]

urlpatterns += [
    # urls for TipoDeVehiculo
    url(r'^transporte/tipodevehiculo/$', views.TipoDeVehiculoListView.as_view(),
        name='transporte_tipodevehiculo_list'),
    url(r'^transporte/tipodevehiculo/create/$', views.TipoDeVehiculoCreateView.as_view(),
        name='transporte_tipodevehiculo_create'),
    url(r'^transporte/tipodevehiculo/detail/(?P<slug>\S+)/$', views.TipoDeVehiculoDetailView.as_view(),
        name='transporte_tipodevehiculo_detail'),
    url(r'^transporte/tipodevehiculo/update/(?P<slug>\S+)/$', views.TipoDeVehiculoUpdateView.as_view(),
        name='transporte_tipodevehiculo_update'),
]

urlpatterns += [
    # urls for Parametro
    url(r'^transporte/parametro/$', views.ParametroListView.as_view(),
        name='transporte_parametro_list'),
    url(r'^transporte/parametro/create/$', views.ParametroCreateView.as_view(),
        name='transporte_parametro_create'),
    url(r'^transporte/parametro/detail/(?P<slug>\S+)/$', views.ParametroDetailView.as_view(),
        name='transporte_parametro_detail'),
    url(r'^transporte/parametro/update/(?P<slug>\S+)/$', views.ParametroUpdateView.as_view(),
        name='transporte_parametro_update'),
]

urlpatterns += [
    # urls for Item
    url(r'^transporte/item/$', views.ItemListView.as_view(),
        name='transporte_item_list'),
    url(r'^transporte/item/create/$', views.ItemCreateView.as_view(),
        name='transporte_item_create'),
    url(r'^transporte/item/detail/(?P<slug>\S+)/$', views.ItemDetailView.as_view(),
        name='transporte_item_detail'),
    url(r'^transporte/item/update/(?P<slug>\S+)/$', views.ItemUpdateView.as_view(),
        name='transporte_item_update'),
]

urlpatterns += [
    # urls for NivelDePrecio
    url(r'^transporte/niveldeprecio/$', views.NivelDePrecioListView.as_view(),
        name='transporte_niveldeprecio_list'),
    url(r'^transporte/niveldeprecio/create/$', views.NivelDePrecioCreateView.as_view(),
        name='transporte_niveldeprecio_create'),
    url(r'^transporte/niveldeprecio/detail/(?P<slug>\S+)/$',
        views.NivelDePrecioDetailView.as_view(),
        name='transporte_niveldeprecio_detail'),
    url(r'^transporte/niveldeprecio/update/(?P<slug>\S+)/$',
        views.NivelDePrecioUpdateView.as_view(),
        name='transporte_niveldeprecio_update'),
]

urlpatterns += [
    # urls for Cotizacion
    url(r'^transporte/cotizacion/$', views.CotizacionListView.as_view(),
        name='transporte_cotizacion_list'),
    url(r'^transporte/cotizacion/create/$', views.CotizacionCreateView.as_view(),
        name='transporte_cotizacion_create'),
    url(r'^transporte/cotizacion/detail/(?P<slug>\S+)/$', views.CotizacionDetailView.as_view(),
        name='transporte_cotizacion_detail'),
    url(r'^transporte/cotizacion/update/(?P<slug>\S+)/$', views.CotizacionUpdateView.as_view(),
        name='transporte_cotizacion_update'),
]

urlpatterns += [
    # urls for Cliente
    url(r'^transporte/cliente/$', views.ClienteListView.as_view(),
        name='transporte_cliente_list'),
    url(r'^transporte/cliente/create/$', views.ClienteCreateView.as_view(),
        name='transporte_cliente_create'),
    url(r'^transporte/cliente/detail/(?P<slug>\S+)/$', views.ClienteDetailView.as_view(),
        name='transporte_cliente_detail'),
    url(r'^transporte/cliente/update/(?P<slug>\S+)/$', views.ClienteUpdateView.as_view(),
        name='transporte_cliente_update'),
]

urlpatterns += [
    # urls for Itinerario
    url(r'^transporte/itinerario/$', views.ItinerarioListView.as_view(),
        name='transporte_itinerario_list'),
    url(r'^transporte/itinerario/create/$', views.ItinerarioCreateView.as_view(),
        name='transporte_itinerario_create'),
    url(r'^transporte/itinerario/detail/(?P<slug>\S+)/$', views.ItinerarioDetailView.as_view(),
        name='transporte_itinerario_detail'),
    url(r'^transporte/itinerario/update/(?P<slug>\S+)/$', views.ItinerarioUpdateView.as_view(),
        name='transporte_itinerario_update'),
]

urlpatterns += [
    # urls for CotizacionDetalle
    url(r'^transporte/cotizaciondetalle/$', views.CotizacionDetalleListView.as_view(),
        name='transporte_cotizaciondetalle_list'),
    url(r'^transporte/cotizaciondetalle/create/$', views.CotizacionDetalleCreateView.as_view(),
        name='transporte_cotizaciondetalle_create'),
    url(r'^transporte/cotizaciondetalle/detail/(?P<slug>\S+)/$',
        views.CotizacionDetalleDetailView.as_view(),
        name='transporte_cotizaciondetalle_detail'),
    url(r'^transporte/cotizaciondetalle/update/(?P<slug>\S+)/$',
        views.CotizacionDetalleUpdateView.as_view(),
        name='transporte_cotizaciondetalle_update'),
]

urlpatterns += [
    # urls for Vehiculo
    url(r'^transporte/vehiculo/$', views.VehiculoListView.as_view(),
        name='transporte_vehiculo_list'),
    url(r'^transporte/vehiculo/create/$', views.VehiculoCreateView.as_view(),
        name='transporte_vehiculo_create'),
    url(r'^transporte/vehiculo/detail/(?P<slug>\S+)/$', views.VehiculoDetailView.as_view(),
        name='transporte_vehiculo_detail'),
    url(r'^transporte/vehiculo/update/(?P<slug>\S+)/$', views.VehiculoUpdateView.as_view(),
        name='transporte_vehiculo_update'),
]

urlpatterns += [
    # urls for Tramo
    url(r'^transporte/tramo/$', views.TramoListView.as_view(),
        name='transporte_tramo_list'),
    url(r'^transporte/tramo/create/$', views.TramoCreateView.as_view(),
        name='transporte_tramo_create'),
    url(r'^transporte/tramo/detail/(?P<slug>\S+)/$', views.TramoDetailView.as_view(),
        name='transporte_tramo_detail'),
    url(r'^transporte/tramo/update/(?P<slug>\S+)/$', views.TramoUpdateView.as_view(),
        name='transporte_tramo_update'),
]

urlpatterns += [
    # urls for Lugar
    url(r'^transporte/lugar/$', views.LugarListView.as_view(),
        name='transporte_lugar_list'),
    url(r'^transporte/lugar/create/$', views.LugarCreateView.as_view(),
        name='transporte_lugar_create'),
    url(r'^transporte/lugar/detail/(?P<slug>\S+)/$', views.LugarDetailView.as_view(),
        name='transporte_lugar_detail'),
    url(r'^transporte/lugar/update/(?P<slug>\S+)/$', views.LugarUpdateView.as_view(),
        name='transporte_lugar_update'),
]

urlpatterns += [
    # urls for Conductor
    url(r'^transporte/conductor/$', views.ConductorListView.as_view(),
        name='transporte_conductor_list'),
    url(r'^transporte/conductor/create/$', views.ConductorCreateView.as_view(),
        name='transporte_conductor_create'),
    url(r'^transporte/conductor/detail/(?P<slug>\S+)/$', views.ConductorDetailView.as_view(),
        name='transporte_conductor_detail'),
    url(r'^transporte/conductor/update/(?P<slug>\S+)/$', views.ConductorUpdateView.as_view(),
        name='transporte_conductor_update'),
]
