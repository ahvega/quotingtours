from functools import partial

from django import forms
from django.forms.utils import ErrorList

from .models import TipoDeVehiculo, Parametro, Item, NivelDePrecio, Cotizacion, Cliente, Itinerario, \
    CotizacionDetalle, Vehiculo, Tramo, Lugar, Conductor, TramoEnVehiculo

DateInput = partial(forms.DateInput, {'class': 'datepicker'})


class TipoDeVehiculoForm(forms.ModelForm):
    class Meta:
        model = TipoDeVehiculo
        fields = ['nombre', 'rendimiento', 'costo_por_dia', 'costo_por_km',
                  'capacidad_nominal', 'capacidad_real', 'galones_tanque', 'activo']


class ParametroForm(forms.ModelForm):
    class Meta:
        model = Parametro
        fields = ['nombre', 'valor', 'unidad', 'orden']


class ItemForm(forms.ModelForm):
    class Meta:
        model = Item
        fields = ['nombre', 'costo', 'precio', 'descripcion_compra', 'descripcion_venta', 'tipo_item']


class NivelDePrecioForm(forms.ModelForm):
    class Meta:
        model = NivelDePrecio
        fields = ['nombre', 'tipo', 'accion', 'valor']


class CotizacionForm(forms.ModelForm):
    class Meta:
        model = Cotizacion
        fields = ['itinerario', 'nombre', 'descripcion', 'fecha_vence']
        widgets = {'fecha_vence': DateInput(), }


class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ['nombre', 'contacto', 'rtn', 'email', 'tel', 'nivel_de_precio']


class ItinerarioForm(forms.ModelForm):
    class Meta:
        model = Itinerario
        fields = ['nombre', 'fecha_desde', 'fecha_hasta', 'estatus']
        widgets = {
            'fecha_desde': DateInput(),
            'fecha_hasta': DateInput(),
        }


def clean(self):
    if self.cleaned_data['fecha_desde'] > self.cleaned_data['fecha_hasta']:
        msg = 'La fecha de inicio no puede ser mayor que la fecha de final.'
        self._errors['fecha_desde'] = ErrorList([msg])
        del self.cleaned_data['fecha_desde']

    return self.cleaned_data


class CotizacionDetalleForm(forms.ModelForm):
    class Meta:
        model = CotizacionDetalle
        fields = ['item', 'cantidad', 'nivel_de_precio']

        # def __init__(self, *args, **kwargs):
        #     super(CotizacionDetalleForm, self).__init__(*args, **kwargs)
        #     self.fields["cotizacion"] = forms.CharField(widget=forms.HiddenInput())
        #


class VehiculoForm(forms.ModelForm):
    class Meta:
        model = Vehiculo
        fields = ['nombre', 'placa', 'tipo', 'chofer_fijo', 'fecha_adquirido', ]
        widgets = {
            'fecha_adquirido': DateInput(),
        }


class TramoForm(forms.ModelForm):
    class Meta:
        model = Tramo
        fields = ['desde_lugar', 'hacia_lugar', ]


class TramoEnVehiculoForm(forms.ModelForm):
    class Meta:
        model = TramoEnVehiculo
        fields = ['vehiculo', ]


class LugarForm(forms.ModelForm):
    class Meta:
        model = Lugar
        fields = ['codigo', 'nombre', 'pais']


class ConductorForm(forms.ModelForm):
    class Meta:
        model = Conductor
        fields = ['nombre', 'identidad', 'telefono', 'empleado', 'incentivo_por_dia']
