from django.contrib import admin
from django.forms.utils import ErrorList
from django import forms

from .models import *


class TipoDeVehiculoAdminForm(forms.ModelForm):
    class Meta:
        model = TipoDeVehiculo
        fields = '__all__'


class TipoDeVehiculoAdmin(admin.ModelAdmin):
    form = TipoDeVehiculoAdminForm
    list_display = [
        'nombre',
        'rendimiento',
        'costo_por_dia',
        'costo_por_km',
        'capacidad_nominal',
        'capacidad_real',
        'galones_tanque'
    ]
    readonly_fields = ['creado', 'actualizado', 'slug']
    search_fields = ['nombre']


admin.site.register(TipoDeVehiculo, TipoDeVehiculoAdmin)


class ParametroAdminForm(forms.ModelForm):
    class Meta:
        model = Parametro
        fields = '__all__'


class ParametroAdmin(admin.ModelAdmin):
    form = ParametroAdminForm
    list_display = [
        'annio',
        'nombre',
        'valor',
        'unidad',
        'orden'
    ]
    readonly_fields = ['creado', 'actualizado', 'slug']
    search_fields = ['nombre']
    list_filter = ['annio']


admin.site.register(Parametro, ParametroAdmin)


class ItemAdminForm(forms.ModelForm):
    class Meta:
        model = Item
        fields = '__all__'


class ItemAdmin(admin.ModelAdmin):
    form = ItemAdminForm
    list_display = [
        'nombre',
        'tipo_item',
        'unidad',
        'costo',
        'precio',
        'descripcion_venta'
    ]
    readonly_fields = ['slug', 'creado', 'actualizado']
    search_fields = ['nombre', 'descripcion_compra', 'descripcion_venta']


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
        fields = ['itinerario', 'nombre', 'nivel_de_precio', 'fecha_vence']


class CotizacionAdmin(admin.ModelAdmin):
    form = CotizacionAdminForm
    list_display = ['nombre', 'fecha_vence', 'subtotal', 'utilidad', 'total']
    readonly_fields = ['subtotal', 'utilidad', 'total', 'slug', 'creado', 'actualizado']
    search_fields = ['nombre']
    list_filter = ['fecha_vence']
    date_hierarchy = 'fecha_vence'


admin.site.register(Cotizacion, CotizacionAdmin)


class ClienteAdminForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = '__all__'


class ClienteAdmin(admin.ModelAdmin):
    form = ClienteAdminForm
    list_display = ['nombre', 'contacto', 'email', 'tel', 'nivel_de_precio']
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


class ItinerarioAdmin(admin.ModelAdmin):
    form = ItinerarioAdminForm
    list_display = ['cliente', 'nombre', 'fecha_desde', 'fecha_hasta', 'estatus']
    readonly_fields = ['slug', 'creado', 'actualizado']
    search_fields = ['cliente', 'nombre', 'fecha_desde']
    list_filter = ['fecha_desde', 'fecha_hasta', 'estatus']
    ordering = ['cliente', 'fecha_desde']
    date_hierarchy = 'fecha_desde'


admin.site.register(Itinerario, ItinerarioAdmin)


class CotizacionDetalleAdminForm(forms.ModelForm):
    class Meta:
        model = CotizacionDetalle
        fields = ['cotizacion', 'item', 'cantidad', 'nivel_de_precio']


class CotizacionDetalleAdmin(admin.ModelAdmin):
    form = CotizacionDetalleAdminForm
    list_display = ['cotizacion', 'descripcion', 'cantidad', 'costo', 'monto', 'markup', 'total']
    readonly_fields = ['descripcion', 'costo', 'monto', 'markup', 'total', 'slug', 'creado', 'actualizado']
    search_fields = ['descripcion']


admin.site.register(CotizacionDetalle, CotizacionDetalleAdmin)


class VehiculoAdminForm(forms.ModelForm):
    class Meta:
        model = Vehiculo
        fields = '__all__'


class VehiculoAdmin(admin.ModelAdmin):
    form = VehiculoAdminForm
    list_display = ['nombre', 'placa', 'fecha_adquirido', 'chofer_fijo']
    readonly_fields = ['slug', 'creado', 'actualizado']


admin.site.register(Vehiculo, VehiculoAdmin)


class TramoAdminForm(forms.ModelForm):
    class Meta:
        model = Tramo
        fields = [
            'desde_lugar',
            'hacia_lugar',
        ]


class TramoAdmin(admin.ModelAdmin):
    form = TramoAdminForm
    list_display = [
        'codigo',
        'descripcion',
        'desde_lugar',
        'hacia_lugar',
        'kms',
        'hrs',
        'slug',
        'creado',
        'actualizado',
    ]
    readonly_fields = [
        'descripcion',
        'kms',
        'hrs',
        'slug',
        'creado',
        'actualizado',
    ]


admin.site.register(Tramo, TramoAdmin)


class LugarAdminForm(forms.ModelForm):
    class Meta:
        model = Lugar
        fields = '__all__'

    def clean_codigo(self):
        return self.cleaned_data["codigo"].upper()


class LugarAdmin(admin.ModelAdmin):
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
    list_display = [
        'nombre',
        'slug',
        'creado',
        'actualizado',
        'identidad',
        'telefono',
        'empleado',
        'incentivo_por_dia'
    ]
    readonly_fields = [
        'nombre',
        'slug',
        'creado',
        'actualizado'
    ]


admin.site.register(Conductor, ConductorAdmin)
