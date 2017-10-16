# coding=utf-8
from django.contrib import admin
from django.forms.utils import ErrorList
from django import forms
from .filters import DropdownFilterValues, DropdownFilterRelated
import copy
from .models import *
from django.conf.locale.es import formats as es_formats

# es_formats.DATETIME_FORMAT = "d M Y H:i:s"
es_formats.DECIMAL_SEPARATOR = ','
es_formats.THOUSAND_SEPARATOR = '.'
es_formats.NUMBER_GROUPING = 3

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
    form = ItemAdminForm
    list_display = ['nombre', 'tipo_item', 'costo', 'precio', 'descripcion_venta']
    readonly_fields = ['slug', 'creado', 'actualizado']
    search_fields = ['nombre', 'descripcion_compra', 'descripcion_venta']
    list_filter = (('tipo_item', DropdownFilterValues), 'creado')
    date_hierarchy = 'creado'


admin.site.register(Item, ItemAdmin)


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
        cot_copy = copy.copy(cot)
        cot_copy.id = None
        cot_copy.save()  # salvado inicial

        # copiar relacion M2M
        for tramo in cot.tramos.all():
            cot_copy.tramos.add(tramo)

        for linea in cot.lineas.all():
            cot_copy.lineas.add(linea)

        cot_copy.save()

copy_cotizacion.short_description = "Crear Copia de Cotización"


class CotizacionAdmin(admin.ModelAdmin):
    actions = [copy_cotizacion]
    save_on_top = True

    def formfield_for_dbfield(self, db_field, **kwargs):
        formfield = super(CotizacionAdmin, self).formfield_for_dbfield(db_field, **kwargs)
        if db_field.name == 'descripcion':
            formfield.widget = forms.Textarea(attrs=formfield.widget.attrs)
        return formfield

    form = CotizacionAdminForm
    list_display = ['nombre', 'fecha_ida', 'fecha_regreso', 'dias', 'fecha_vence',
                    'descripcion', 'kms_total', 'hrs_total', 'subtotal', 'utilidad', 'total']
    readonly_fields = ['dias', 'kms_total', 'hrs_total', 'subtotal',
                       'utilidad', 'total', 'slug', 'creado', 'actualizado']
    search_fields = ['nombre', 'descripcion']
    list_filter = (('itinerario__cliente', DropdownFilterRelated),
                   ('itinerario', DropdownFilterRelated), 'fecha_ida')
    date_hierarchy = 'fecha_ida'
    ordering = ('itinerario__cliente__codigo', )


admin.site.register(Cotizacion, CotizacionAdmin)


class ClienteAdminForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = '__all__'


class ClienteAdmin(admin.ModelAdmin):
    form = ClienteAdminForm
    list_display = ['nombre', 'contacto', 'email', 'tel', 'rtn', 'nivel_de_precio']
    readonly_fields = ['slug', 'creado', 'actualizado']
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


def cerrar_itinerario(modeladmin, request, queryset):
    queryset.update(estatus='Cerrado')


cerrar_itinerario.short_description = "Marcar como Cerrado"


class ItinerarioAdmin(admin.ModelAdmin):
    form = ItinerarioAdminForm
    list_display = ['nombre', 'cliente', 'fecha_desde', 'fecha_hasta', 'estatus']
    readonly_fields = ['slug', 'creado', 'actualizado']
    search_fields = ['cliente', 'nombre', 'fecha_desde']
    list_filter = (('estatus', DropdownFilterValues), ('cliente', DropdownFilterRelated), 'fecha_desde',)
    ordering = ['cliente', 'fecha_desde']
    date_hierarchy = 'fecha_desde'
    actions = [cerrar_itinerario]


admin.site.register(Itinerario, ItinerarioAdmin)


class RutaDetalleAdminForm(forms.ModelForm):
    class Meta:
        model = RutaDetalle
        fields = ['tramo', 'cotizacion']


class RutaDetalleAdmin(admin.ModelAdmin):
    form = RutaDetalleAdminForm
    list_display = ['tramo', 'desde', 'hacia', 'kms', 'hrs']
    readonly_fields = ['desde', 'hacia', 'kms', 'hrs', 'creado', 'actualizado']
    search_fields = ['tramo', 'desde', ' hacia']
    list_filter = (('cotizacion', DropdownFilterRelated),)
    ordering = ['id']


admin.site.register(RutaDetalle, RutaDetalleAdmin)


class CotizacionDetalleAdminForm(forms.ModelForm):
    class Meta:
        model = CotizacionDetalle
        fields = ['item', 'cotizacion', 'cantidad', 'nivel_de_precio']


class CotizacionDetalleAdmin(admin.ModelAdmin):
    save_as = True
    form = CotizacionDetalleAdminForm
    list_display = ['cliente', 'itinerario', 'cotizacion', 'descripcion',
                    'cantidad', 'costo', 'monto', 'utilidad', 'markup', 'total']
    list_display_links = ['descripcion']
    readonly_fields = ['descripcion', 'costo', 'monto', 'utilidad', 'markup', 'total', 'slug', 'creado', 'actualizado']
    search_fields = ['descripcion']
    list_filter = (('cotizacion__itinerario__cliente', DropdownFilterRelated),
                   ('cotizacion__itinerario', DropdownFilterRelated),
                   ('cotizacion', DropdownFilterRelated),)
    ordering = ['cotizacion__itinerario__cliente__codigo', 'cotizacion__fecha_ida','id']


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
        tramo_copy = copy.copy(tramo)
        tramo_copy.id = None
        tramo_origen_copy = tramo_copy.desde_lugar
        tramo_copy.desde_lugar = tramo_copy.hacia_lugar
        tramo_copy.hacia_lugar = tramo_origen_copy
        tramo_copy.save() # grabado inicial

        # copiar foreign relations
        for vehiculo in tramo_copy.vehiculos.all():
            tramo_copy.vehiculos.add(vehiculo)

        tramo_copy.save()  # grabado definitivo con campos relacionados

copy_tramo_regreso.short_description = "Crear Tramo de Regreso"


class TramoAdmin(admin.ModelAdmin):
    actions = [copy_tramo_regreso]
    save_on_top = True

    form = TramoAdminForm
    list_display = ['codigo', 'descripcion', 'desde_lugar', 'hacia_lugar', 'kms', 'hrs', 'slug', 'creado',
                    'actualizado', ]
    readonly_fields = ['descripcion', 'kms', 'hrs', 'slug', 'creado', 'actualizado', ]
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
