from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.auth import views as auth_views
from django_filters.views import FilterView
from rest_framework import routers
from rest_framework.authtoken import views as authviews
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token

from django.conf import settings
from transporte import api
from transporte.filters import UserFilter
from transporte.views import TipoDeVehiculoListView, TipoDeVehiculoCreateView, \
    TipoDeVehiculoDetailView, TipoDeVehiculoUpdateView, ParametroList, ParametroCreate, ParametroDetail, \
    ParametroUpdate, ItemListView, ItemCreateView, ItemDetailView, ItemUpdateView, NivelDePrecioListView, \
    NivelDePrecioCreateView, NivelDePrecioDetailView, NivelDePrecioUpdateView, CotizacionCreate, CotizacionDetail, \
    CotizacionUpdate, CotizacionDelete, ClienteListView, \
    ClienteCreateView, ClienteDetailView, ClienteUpdateView, ItinerarioListView, ItinerarioCreate, \
    ItinerarioDetailView, ItinerarioUpdateView, ItinerarioDeleteView, CotizacionDetalleListView, \
    CotizacionDetalleCreateView, CotizacionDetalleDetailView, CotizacionDetalleUpdateView, \
    CotizacionDetalleDeleteView, VehiculoListView, VehiculoCreateView, VehiculoDetailView, VehiculoUpdateView, \
    TramoListView, TramoCreateView, TramoDetailView, TramoUpdateView, LugarListView, LugarCreateView, \
    LugarDetailView, LugarUpdateView, ConductorListView, ConductorCreateView, \
    ConductorDetailView, ConductorUpdateView, indice, CotizacionTable, TramoEnVehiculoUpdate, TramoEnVehiculoDetail, \
    TramoEnVehiculoCreate, TramoEnVehiculoList, TramoEnVehiculoDelete, RutaDetalleListView, RutaDetalleCreateView, \
    RutaDetalleDetailView, RutaDetalleUpdateView, RutaDetalleDeleteView, ItemGrupoListView, ItemGrupoCreateView, \
    ItemGrupoDetailView, ItemGrupoUpdateView, ItemGrupoLineaUpdateView, ItemGrupoLineaDetailView, \
    ItemGrupoLineaCreateView, ItemGrupoLineaListView, ItemGrupoLineaDeleteView, ItemGrupoDeleteView, ItemDeleteView

admin.autodiscover()
router = routers.DefaultRouter()
router.register(r'tipodevehiculo', api.TipoDeVehiculoViewSet)
router.register(r'parametro', api.ParametroViewSet)
router.register(r'item', api.ItemViewSet)
router.register(r'itemgrupo', api.ItemGrupoViewSet)
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
    url(r'^search/$', FilterView.as_view(filterset_class=UserFilter,
                                         template_name='search/user_list.html'), name='search'),
]

if settings.DEBUG:
    import debug_toolbar

    urlpatterns = [
                      url(r'^__debug__/', include(debug_toolbar.urls)),
                  ] + urlpatterns

urlpatterns += [
    # urls for Django Rest Framework API
    url(r'^api/v1/', include(router.urls)),
]

urlpatterns += [
    url(r'^docs/', include('rest_framework_docs.urls')),
]

urlpatterns += [
    url(r'^api-token/', authviews.obtain_auth_token),
    url(r'^api-token-auth/', obtain_jwt_token),
    url(r'^api-token-refresh/', refresh_jwt_token),
]

urlpatterns += [
    # urls for TipoDeVehiculo
    url(r'^transporte/tipodevehiculo/$', TipoDeVehiculoListView.as_view(),
        name='transporte_tipodevehiculo_list'),
    url(r'^transporte/tipodevehiculo/create/$', TipoDeVehiculoCreateView.as_view(),
        name='transporte_tipodevehiculo_create'),
    url(r'^transporte/tipodevehiculo/detail/(?P<slug>\S+)/$', TipoDeVehiculoDetailView.as_view(),
        name='transporte_tipodevehiculo_detail'),
    url(r'^transporte/tipodevehiculo/update/(?P<slug>\S+)/$', TipoDeVehiculoUpdateView.as_view(),
        name='transporte_tipodevehiculo_update'),
]

urlpatterns += [
    # urls for Parametro
    url(r'^transporte/parametro/$', ParametroList.as_view(),
        name='transporte_parametro_list'),
    url(r'^transporte/parametro/create/$', ParametroCreate.as_view(),
        name='transporte_parametro_create'),
    url(r'^transporte/parametro/detail/(?P<slug>\S+)/$', ParametroDetail.as_view(),
        name='transporte_parametro_detail'),
    url(r'^transporte/parametro/update/(?P<slug>\S+)/$', ParametroUpdate.as_view(),
        name='transporte_parametro_update'),
]

urlpatterns += [
    # urls for Item
    url(r'^transporte/item/$', ItemListView.as_view(),
        name='transporte_item_list'),
    url(r'^transporte/item/create/$', ItemCreateView.as_view(),
        name='transporte_item_create'),
    url(r'^transporte/item/detail/(?P<slug>\S+)/$', ItemDetailView.as_view(),
        name='transporte_item_detail'),
    url(r'^transporte/item/update/(?P<slug>\S+)/$', ItemUpdateView.as_view(),
        name='transporte_item_update'),
    url(r'^transporte/item/delete/(?P<slug>\S+)/$', ItemDeleteView.as_view(),
        name='transporte_item_delete'),
]

urlpatterns += [
    # urls for ItemGrupo
    url(r'^transporte/itemgrupo/$', ItemGrupoListView.as_view(),
        name='transporte_itemgrupo_list'),
    url(r'^transporte/itemgrupo/create/$', ItemGrupoCreateView.as_view(),
        name='transporte_itemgrupo_create'),
    url(r'^transporte/itemgrupo/detail/(?P<slug>\S+)/$', ItemGrupoDetailView.as_view(),
        name='transporte_itemgrupo_detail'),
    url(r'^transporte/itemgrupo/update/(?P<slug>\S+)/$', ItemGrupoUpdateView.as_view(),
        name='transporte_itemgrupo_update'),
    url(r'^transporte/itemgrupo/delete/(?P<slug>\S+)/$', ItemGrupoDeleteView.as_view(),
        name='transporte_itemgrupo_delete'),
]

urlpatterns += [
    # urls for ItemGrupoLinea
    url(r'^transporte/itemgrupolinea/$', ItemGrupoLineaListView.as_view(),
        name='transporte_itemgrupolinea_list'),
    url(r'^transporte/itemgrupolinea/create/(?P<itemgrupo_id>\d+)/$', ItemGrupoLineaCreateView.as_view(),
        name='transporte_itemgrupolinea_create'),
    url(r'^transporte/itemgrupolinea/detail/(?P<slug>\S+)/$', ItemGrupoLineaDetailView.as_view(),
        name='transporte_itemgrupolinea_detail'),
    url(r'^transporte/itemgrupolinea/update/(?P<slug>\S+)/$', ItemGrupoLineaUpdateView.as_view(),
        name='transporte_itemgrupolinea_update'),
    url(r'^transporte/itemgrupolinea/delete/(?P<slug>\S+)/$', ItemGrupoLineaDeleteView.as_view(),
        name='transporte_itemgrupolinea_delete'),
]

urlpatterns += [
    # urls for NivelDePrecio
    url(r'^transporte/niveldeprecio/$', NivelDePrecioListView.as_view(),
        name='transporte_niveldeprecio_list'),
    url(r'^transporte/niveldeprecio/create/$', NivelDePrecioCreateView.as_view(),
        name='transporte_niveldeprecio_create'),
    url(r'^transporte/niveldeprecio/detail/(?P<slug>\S+)/$', NivelDePrecioDetailView.as_view(),
        name='transporte_niveldeprecio_detail'),
    url(r'^transporte/niveldeprecio/update/(?P<slug>\S+)/$',
        NivelDePrecioUpdateView.as_view(),
        name='transporte_niveldeprecio_update'),
]

urlpatterns += [
    # urls for Cotizacion
    url(r'^transporte/cotizacion/$', CotizacionTable.as_view(),
        name='transporte_cotizacion_list'),
    url(r'^transporte/cotizacion/create/(?P<itinerario_id>\d+)/$', CotizacionCreate.as_view(),
        name='transporte_cotizacion_create'),
    url(r'^transporte/cotizacion/detail/(?P<slug>\S+)/$', CotizacionDetail.as_view(),
        name='transporte_cotizacion_detail'),
    url(r'^transporte/cotizacion/update/(?P<slug>\S+)/$', CotizacionUpdate.as_view(),
        name='transporte_cotizacion_update'),
    url(r'^transporte/cotizacion/delete/(?P<slug>\S+)/$', CotizacionDelete.as_view(),
        name='transporte_cotizacion_delete'),
]

urlpatterns += [
    # urls for Cliente
    url(r'^transporte/cliente/$', ClienteListView.as_view(),
        name='transporte_cliente_list'),
    url(r'^transporte/cliente/create/$', ClienteCreateView.as_view(),
        name='transporte_cliente_create'),
    url(r'^transporte/cliente/detail/(?P<slug>\S+)/$', ClienteDetailView.as_view(),
        name='transporte_cliente_detail'),
    url(r'^transporte/cliente/update/(?P<slug>\S+)/$', ClienteUpdateView.as_view(),
        name='transporte_cliente_update'),
]

urlpatterns += [
    # urls for Itinerario
    url(r'^transporte/itinerario/$', ItinerarioListView.as_view(),
        name='transporte_itinerario_list'),
    url(r'^transporte/itinerario/create/(?P<cliente_id>\d+)/$', ItinerarioCreate.as_view(),
        name='transporte_itinerario_create'),
    url(r'^transporte/itinerario/detail/(?P<slug>\S+)/$', ItinerarioDetailView.as_view(),
        name='transporte_itinerario_detail'),
    url(r'^transporte/itinerario/update/(?P<slug>\S+)/$', ItinerarioUpdateView.as_view(),
        name='transporte_itinerario_update'),
    url(r'^transporte/itinerario/delete/(?P<slug>\S+)/$', ItinerarioDeleteView.as_view(),
        name='transporte_itinerario_delete'),
]

urlpatterns += [
    # urls for RutaDetalle
    url(r'^transporte/rutadetalle/$', RutaDetalleListView.as_view(),
        name='transporte_rutadetalle_list'),
    url(r'^transporte/rutadetalle/create/(?P<cotizacion_id>\d+)/$', RutaDetalleCreateView.as_view(),
        name='transporte_rutadetalle_create'),
    url(r'^transporte/rutadetalle/detail/(?P<slug>\S+)/$', RutaDetalleDetailView.as_view(),
        name='transporte_rutadetalle_detail'),
    url(r'^transporte/rutadetalle/update/(?P<slug>\S+)/$', RutaDetalleUpdateView.as_view(),
        name='transporte_rutadetalle_update'),
    url(r'^transporte/rutadetalle/delete/(?P<slug>\S+)/$', RutaDetalleDeleteView.as_view(),
        name='transporte_rutadetalle_delete'),
]

urlpatterns += [
    # urls for CotizacionDetalle
    url(r'^transporte/cotizaciondetalle/$', CotizacionDetalleListView.as_view(),
        name='transporte_cotizaciondetalle_list'),
    url(r'^transporte/cotizaciondetalle/create/(?P<cotizacion_id>\d+)/$', CotizacionDetalleCreateView.as_view(),
        name='transporte_cotizaciondetalle_create'),
    url(r'^transporte/cotizaciondetalle/detail/(?P<slug>\S+)/$', CotizacionDetalleDetailView.as_view(),
        name='transporte_cotizaciondetalle_detail'),
    url(r'^transporte/cotizaciondetalle/update/(?P<slug>\S+)/$', CotizacionDetalleUpdateView.as_view(),
        name='transporte_cotizaciondetalle_update'),
    url(r'^transporte/cotizaciondetalle/delete/(?P<slug>\S+)/$', CotizacionDetalleDeleteView.as_view(),
        name='transporte_cotizaciondetalle_delete'),
]

urlpatterns += [
    # urls for Vehiculo
    url(r'^transporte/vehiculo/$', VehiculoListView.as_view(),
        name='transporte_vehiculo_list'),
    url(r'^transporte/vehiculo/create/$', VehiculoCreateView.as_view(),
        name='transporte_vehiculo_create'),
    url(r'^transporte/vehiculo/detail/(?P<slug>\S+)/$', VehiculoDetailView.as_view(),
        name='transporte_vehiculo_detail'),
    url(r'^transporte/vehiculo/update/(?P<slug>\S+)/$', VehiculoUpdateView.as_view(),
        name='transporte_vehiculo_update'),
]

urlpatterns += [
    # urls for Tramo
    url(r'^transporte/tramo/$', TramoListView.as_view(),
        name='transporte_tramo_list'),
    url(r'^transporte/tramo/create/$', TramoCreateView.as_view(),
        name='transporte_tramo_create'),
    url(r'^transporte/tramo/detail/(?P<slug>\S+)/$', TramoDetailView.as_view(),
        name='transporte_tramo_detail'),
    url(r'^transporte/tramo/update/(?P<slug>\S+)/$', TramoUpdateView.as_view(),
        name='transporte_tramo_update'),
]

urlpatterns += [
    # urls for TramoEnVehiculo
    url(r'^transporte/tramoenvehiculo/$', TramoEnVehiculoList.as_view(),
        name='transporte_tramoenvehiculo_list'),
    url(r'^transporte/tramoenvehiculo/create/(?P<tramo_id>\d+)/$', TramoEnVehiculoCreate.as_view(),
        name='transporte_tramoenvehiculo_create'),
    url(r'^transporte/tramoenvehiculo/detail/(?P<slug>\S+)/$', TramoEnVehiculoDetail.as_view(),
        name='transporte_tramoenvehiculo_detail'),
    url(r'^transporte/tramoenvehiculo/update/(?P<slug>\S+)/$', TramoEnVehiculoUpdate.as_view(),
        name='transporte_tramoenvehiculo_update'),
    url(r'^transporte/tramoenvehiculo/delete/(?P<slug>\S+)/$', TramoEnVehiculoDelete.as_view(),
        name='transporte_tramoenvehiculo_delete'),
]

urlpatterns += [
    # urls for Lugar
    url(r'^transporte/lugar/$', LugarListView.as_view(),
        name='transporte_lugar_list'),
    url(r'^transporte/lugar/create/$', LugarCreateView.as_view(),
        name='transporte_lugar_create'),
    url(r'^transporte/lugar/detail/(?P<slug>\S+)/$', LugarDetailView.as_view(),
        name='transporte_lugar_detail'),
    url(r'^transporte/lugar/update/(?P<slug>\S+)/$', LugarUpdateView.as_view(),
        name='transporte_lugar_update'),
]

urlpatterns += [
    # urls for Conductor
    url(r'^transporte/conductor/$', ConductorListView.as_view(),
        name='transporte_conductor_list'),
    url(r'^transporte/conductor/create/$', ConductorCreateView.as_view(),
        name='transporte_conductor_create'),
    url(r'^transporte/conductor/detail/(?P<slug>\S+)/$', ConductorDetailView.as_view(),
        name='transporte_conductor_detail'),
    url(r'^transporte/conductor/update/(?P<slug>\S+)/$', ConductorUpdateView.as_view(),
        name='transporte_conductor_update'),
]
