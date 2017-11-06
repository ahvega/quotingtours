# coding=utf-8
from django.contrib import admin, messages
from django.forms import Textarea
from django.forms.utils import ErrorList
from django import forms
from .filters import DropdownFilterValues, DropdownFilterRelated
from copy import deepcopy
from .models import *
from django.conf.locale.es import formats as es_formats

# es_formats.DATETIME_FORMAT = "d M Y H:i:s"
es_formats.DECIMAL_SEPARATOR = ','
es_formats.THOUSAND_SEPARATOR = '.'
es_formats.NUMBER_GROUPING = 3

admin.site.site_title = "Cotizaciones de Transporte"
admin.site.site_header = "Administración - Cotizaciones de Transporte"

class TipoDeVehiculoAdminForm(forms.ModelForm):
    class Meta:
        model = TipoDeVehiculo
        fields = '__all__'


class TipoDeVehiculoAdmin(admin.ModelAdmin):
    form = TipoDeVehiculoAdminForm
    list_display = ['nombre', 'rendimiento', 'costo_por_dia', 'costo_por_km',
                    'capacidad_nominal', 'capacidad_real', 'galones_tanque']
    readonly_fields = ['creado', 'actualizado', 'slug']
    search_fields = ['nombre']


admin.site.register(TipoDeVehiculo, TipoDeVehiculoAdmin)


class ParametroAdminForm(forms.ModelForm):
    class Meta:
        model = Parametro
        fields = '__all__'


class ParametroAdmin(admin.ModelAdmin):
    form = ParametroAdminForm
    list_display = ['annio', 'nombre', 'valor', 'unidad', 'orden']
    readonly_fields = ['creado', 'actualizado', 'slug']
    search_fields = ['nombre']
    list_filter = (('annio', DropdownFilterValues),)


admin.site.register(Parametro, ParametroAdmin)


class ItemAdminForm(forms.ModelForm):
    class Meta:
        model = Item
        fields = '__all__'


class ItemAdmin(admin.ModelAdmin):
    def formfield_for_dbfield(self, db_field, **kwargs):
        formfield = super(ItemAdmin, self).formfield_for_dbfield(db_field, **kwargs)
        if db_field.name == 'descripcion_compra' or db_field.name == 'descripcion_venta':
            formfield.widget = forms.Textarea(attrs={'cols': 80, 'rows': 3})
        return formfield

    form = ItemAdminForm
    list_display = ['nombre', 'tipo_item', 'costo', 'precio', 'descripcion_venta']
    readonly_fields = ['slug', 'creado', 'actualizado']
    search_fields = ['nombre', 'descripcion_compra', 'descripcion_venta']
    list_filter = (('tipo_item', DropdownFilterValues), 'creado')
    date_hierarchy = 'creado'

admin.site.register(Item, ItemAdmin)


class ItemGrupoAdminForm(forms.ModelForm):
    class Meta:
        model = ItemGrupo
        fields = ['nombre', 'descripcion_venta', 'imprimir_detalle']


class ItemGrupoAdmin(admin.ModelAdmin):
    def formfield_for_dbfield(self, db_field, **kwargs):
        formfield = super(ItemGrupoAdmin, self).formfield_for_dbfield(db_field, **kwargs)
        if db_field.name == 'descripcion_compra' or db_field.name == 'descripcion_venta':
            formfield.widget = forms.Textarea(attrs={'cols': 80, 'rows': 3})
        return formfield

    form = ItemGrupoAdminForm
    list_display = ['nombre', 'costo', 'precio', 'descripcion_venta']
    readonly_fields = ['slug', 'creado', 'actualizado']
    search_fields = ['nombre', 'descripcion_venta']
    list_filter = ('creado',)
    date_hierarchy = 'creado'


admin.site.register(ItemGrupo, ItemGrupoAdmin)


def make_cambiar_nivel(nivel):
    def cambiar_nivel(modeladmin, request, queryset):
        for item in queryset:
            item.nivel_de_precio = nivel
            item.save()
            messages.info(request, u"{0} cambiado Nivel de Precio a {1}".format(item.descripcion,
                                                                                nivel.nombre))

    cambiar_nivel.short_description = "Cambiar Nivel de Precio a {0:.1f}%%".format(nivel.valor * 100)
    # We need a different '__name__' for each action - Django
    # uses this as a key in the drop-down box.
    cambiar_nivel.__name__ = "nivel_{0:s}".format(nivel.slug)

    return cambiar_nivel


class ItemGrupoLineaAdminForm(forms.ModelForm):
    class Meta:
        model = ItemGrupoLinea
        fields = '__all__'


class ItemGrupoLineaAdmin(admin.ModelAdmin):
    form = ItemGrupoLineaAdminForm
    list_display = ['nombre', 'descripcion', 'cantidad', 'costo', 'costo_total', 'utilidad', 'markup', 'total']
    list_display_links = ['descripcion']
    list_filter = ('creado', 'item_grupo')
    readonly_fields = ['nombre', 'descripcion', 'costo', 'costo_total', 'utilidad', 'markup', 'total', 'slug', 'creado', 'actualizado']
    search_fields = ['descripcion']
    ordering = ['id']

    def get_actions(self, request):
        actions = super(ItemGrupoLineaAdmin, self).get_actions(request)

        for nivel in NivelDePrecio.objects.all():
            action = make_cambiar_nivel(nivel)
            actions[action.__name__] = (action,
                                        action.__name__,
                                        "Cambiar Nivel de Precio a {0:.1f}%%".format(nivel.valor * 100))

        return actions


admin.site.register(ItemGrupoLinea, ItemGrupoLineaAdmin)


class NivelDePrecioAdminForm(forms.ModelForm):
    class Meta:
        model = NivelDePrecio
        fields = ['nombre', 'tipo', 'accion', 'valor']


class NivelDePrecioAdmin(admin.ModelAdmin):
    form = NivelDePrecioAdminForm
    list_display = ['nombre', 'tipo', 'accion', 'valor', 'factor']
    readonly_fields = ['slug', 'factor', 'creado', 'actualizado']
    search_fields = ['nombre']


admin.site.register(NivelDePrecio, NivelDePrecioAdmin)


class CotizacionAdminForm(forms.ModelForm):
    class Meta:
        model = Cotizacion
        fields = ['itinerario', 'nombre', 'descripcion', 'nivel_de_precio',
                  'fecha_ida', 'fecha_regreso', 'fecha_vence']


def copy_cotizacion(modeladmin, request, queryset):
    # cot es una instancia de Cotizacion
    for cot in queryset:
        cot_copy = deepcopy(cot)
        cot_copy.id = None
        cot_copy.save()  # salvado inicial

        # copiar relacion M2M
        for tramo in cot.tramos.all():
            tramo_copy = deepcopy(tramo)
            tramo_copy.id = None
            tramo_copy.cotizacion_id = cot_copy.id
            tramo_copy.save()
            cot_copy.tramos.add(tramo_copy)

        for linea in cot.lineas.all():
            linea_copy = deepcopy(linea)
            linea_copy.id = None
            linea_copy.cotizacion_id = cot_copy.id
            linea_copy.save()
            cot_copy.lineas.add(linea_copy)

        cot_copy.save()
        messages.info(request, u"Cotizacion {0} copiada.".format(cot_copy.nombre))


copy_cotizacion.short_description = "Crear Copia"


class CotizacionAdmin(admin.ModelAdmin):
    actions = [copy_cotizacion]
    save_on_top = True

    def formfield_for_dbfield(self, db_field, **kwargs):
        formfield = super(CotizacionAdmin, self).formfield_for_dbfield(db_field, **kwargs)
        if db_field.name == 'descripcion':
            formfield.widget = forms.Textarea(attrs={'cols': 80, 'rows': 3})
        return formfield

    form = CotizacionAdminForm
    list_display = ['nombre', 'nivel_de_precio', 'fecha_ida', 'fecha_regreso', 'dias', 'fecha_vence',
                    'descripcion', 'kms_total', 'hrs_total', 'subtotal', 'utilidad', 'total']
    readonly_fields = ['dias', 'kms_total', 'hrs_total', 'subtotal',
                       'utilidad', 'total', 'slug', 'creado', 'actualizado']
    search_fields = ['nombre', 'descripcion']
    list_filter = (('itinerario__cliente', DropdownFilterRelated),
                   ('itinerario', DropdownFilterRelated), 'fecha_ida')
    date_hierarchy = 'fecha_ida'
    ordering = ('itinerario__cliente__codigo',)

    def get_actions(self, request):
        actions = super(CotizacionAdmin, self).get_actions(request)

        for nivel in NivelDePrecio.objects.all():
            action = make_cambiar_nivel(nivel)
            actions[action.__name__] = (action,
                                        action.__name__,
                                        "Cambiar Nivel de Precio a {0:.1f}%%".format(nivel.valor * 100))

        return actions


admin.site.register(Cotizacion, CotizacionAdmin)


class ClienteAdminForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = '__all__'


class ClienteAdmin(admin.ModelAdmin):
    form = ClienteAdminForm
    list_display = ['nombre', 'codigo', 'total_cotizado', 'contacto', 'email', 'tel', 'rtn', 'nivel_de_precio']
    readonly_fields = ['slug', 'creado', 'actualizado',]
    search_fields = ['nombre', 'contacto', 'email', 'tel']


admin.site.register(Cliente, ClienteAdmin)


class ItinerarioAdminForm(forms.ModelForm):
    class Meta:
        model = Itinerario
        fields = ['cliente', 'nivel_de_precio', 'nombre', 'fecha_desde', 'fecha_hasta', 'estatus']

    def clean(self):
        if self.cleaned_data['fecha_desde'] > self.cleaned_data['fecha_hasta']:
            msg = 'La fecha de inicio no puede ser mayor que la fecha de final.'
            self._errors['fecha_desde'] = ErrorList([msg])
            del self.cleaned_data['fecha_desde']

        return self.cleaned_data


def create_action_estatus(estatus):
    def action(modeladmin, request, queryset):
        queryset.update(estatus=estatus)

    name = "mark_%s" % (estatus,)
    return name, (action, name, "Cambiar Estatus: %s " % (estatus,))


class ItinerarioAdmin(admin.ModelAdmin):
    def get_actions(self, request):
        statuses= [ "Solicitado", "Cotizado", "Confirmado", "Facturado", "Cerrado"]
        return dict(create_action_estatus(e) for e in statuses)

    form = ItinerarioAdminForm
    list_display = ['nombre', 'cliente', 'fecha_desde', 'fecha_hasta',
                    'subtotal_cotizado', 'utilidad_cotizada', 'total_cotizado', 'estatus']
    readonly_fields = ['slug', 'creado', 'actualizado', 'subtotal_cotizado', 'utilidad_cotizada', 'total_cotizado']
    search_fields = ['cliente', 'nombre', 'fecha_desde']
    list_filter = (('estatus', DropdownFilterValues), ('cliente', DropdownFilterRelated), 'fecha_desde',)
    ordering = ['cliente', 'fecha_desde']
    date_hierarchy = 'fecha_desde'
    # actions = [cerrar_itinerario]


admin.site.register(Itinerario, ItinerarioAdmin)


class RutaDetalleAdminForm(forms.ModelForm):
    class Meta:
        model = RutaDetalle
        fields = ['orden', 'tramo', 'cotizacion']


class RutaDetalleAdmin(admin.ModelAdmin):
    save_as = True
    form = RutaDetalleAdminForm
    list_display = ['orden', 'tramo', 'desde', 'hacia', 'kms', 'hrs']
    readonly_fields = ['desde', 'hacia', 'kms', 'hrs', 'creado', 'actualizado']
    search_fields = ['tramo', 'desde', ' hacia']
    list_filter = (('cotizacion', DropdownFilterRelated),)
    ordering = ['orden']


admin.site.register(RutaDetalle, RutaDetalleAdmin)


class CotizacionDetalleAdminForm(forms.ModelForm):
    class Meta:
        model = CotizacionDetalle
        fields = ['item', 'cotizacion', 'cantidad', 'nivel_de_precio']


class CotizacionDetalleAdmin(admin.ModelAdmin):
    form = CotizacionDetalleAdminForm
    list_display = ['cliente', 'itinerario', 'cotizacion', 'descripcion',
                    'cantidad', 'costo', 'costo_total', 'utilidad', 'markup', 'total']
    list_display_links = ['descripcion']
    readonly_fields = ['descripcion', 'costo', 'costo_total', 'utilidad', 'markup', 'total', 'slug', 'creado', 'actualizado']
    search_fields = ['descripcion']
    list_filter = (('cotizacion__itinerario__cliente', DropdownFilterRelated),
                   ('cotizacion__itinerario', DropdownFilterRelated),
                   ('cotizacion', DropdownFilterRelated),)
    ordering = ['cotizacion__itinerario__cliente__codigo', 'cotizacion__fecha_ida', 'id']

    def get_actions(self, request):
        actions = super(CotizacionDetalleAdmin, self).get_actions(request)

        for nivel in NivelDePrecio.objects.all():
            action = make_cambiar_nivel(nivel)
            actions[action.__name__] = (action,
                                        action.__name__,
                                        "Cambiar Nivel de Precio a {0:.1f}%%".format(nivel.valor * 100))

        return actions


admin.site.register(CotizacionDetalle, CotizacionDetalleAdmin)


class VehiculoAdminForm(forms.ModelForm):
    class Meta:
        model = Vehiculo
        fields = '__all__'


class VehiculoAdmin(admin.ModelAdmin):
    save_as = True
    form = VehiculoAdminForm
    list_display = ['nombre', 'placa', 'tipo', 'fecha_adquirido', 'chofer_fijo']
    readonly_fields = ['slug', 'creado', 'actualizado']
    list_filter = (('tipo', DropdownFilterRelated),)


admin.site.register(Vehiculo, VehiculoAdmin)


class TramoAdminForm(forms.ModelForm):
    class Meta:
        model = Tramo
        fields = ['desde_lugar', 'hacia_lugar', ]


# TODO: Accion para Crear simétrico de Tramo en admin
def copy_tramo_regreso(modeladmin, request, queryset):
    for tramo in queryset:
        tramo_copy = deepcopy(tramo)
        tramo_copy.id = None
        tramo_origen_copy = tramo_copy.desde_lugar
        tramo_copy.desde_lugar = tramo_copy.hacia_lugar
        tramo_copy.hacia_lugar = tramo_origen_copy
        tramo_copy.save()  # grabado inicial

        # copiar foreign relations
        for vehiculo in tramo.vehiculos.all():
            vehiculo_copy = deepcopy(vehiculo)
            vehiculo_copy.id = None
            vehiculo_copy.tramo_id = tramo_copy.id
            vehiculo_copy.save()
            tramo_copy.vehiculos.add(vehiculo_copy)

        tramo_copy.save()  # grabado definitivo con campos relacionadosimpo
        messages.info(request, u"Tramo {0} creado".format(tramo_copy.codigo))

copy_tramo_regreso.short_description = "Crear Tramo de Regreso"


class TramoAdmin(admin.ModelAdmin):
    actions = [copy_tramo_regreso]
    save_on_top = True

    form = TramoAdminForm
    list_display = ['codigo', 'desde_hacia', 'descripcion', 'desde_lugar', 'hacia_lugar', 'kms', 'hrs', 'slug',
                    'creado',
                    'actualizado', ]
    readonly_fields = ['desde_hacia', 'descripcion', 'kms', 'hrs', 'slug', 'creado', 'actualizado', ]
    list_filter = (('desde_lugar', DropdownFilterRelated), ('hacia_lugar', DropdownFilterRelated))


admin.site.register(Tramo, TramoAdmin)


class TramoEnVehiculoAdminForm(forms.ModelForm):
    class Meta:
        model = TramoEnVehiculo
        fields = ['tramo', 'vehiculo', ]


class TramoEnVehiculoAdmin(admin.ModelAdmin):
    save_as = True
    form = TramoEnVehiculoAdminForm
    list_display = ['nombre', 'tramo', 'vehiculo', 'costo', 'slug', ]
    readonly_fields = ['nombre', 'costo', 'slug', ]
    list_filter = (('vehiculo', DropdownFilterRelated), ('tramo', DropdownFilterRelated),)


admin.site.register(TramoEnVehiculo, TramoEnVehiculoAdmin)


class LugarAdminForm(forms.ModelForm):
    class Meta:
        model = Lugar
        fields = '__all__'

    def clean_codigo(self):
        return self.cleaned_data["codigo"].upper()


class LugarAdmin(admin.ModelAdmin):
    save_as = True
    form = LugarAdminForm
    list_display = ['codigo', 'nombre', 'pais', 'slug', 'creado', 'actualizado']
    readonly_fields = ['slug', 'creado', 'actualizado']


admin.site.register(Lugar, LugarAdmin)


class ConductorAdminForm(forms.ModelForm):
    class Meta:
        model = Conductor
        fields = '__all__'


class ConductorAdmin(admin.ModelAdmin):
    form = ConductorAdminForm
    list_display = ['nombre', 'slug', 'creado', 'actualizado', 'identidad', 'telefono', 'empleado', 'incentivo_por_dia']
    readonly_fields = ['nombre', 'slug', 'creado', 'actualizado']


admin.site.register(Conductor, ConductorAdmin)
