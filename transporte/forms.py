from functools import partial

from django import forms
from django.forms.utils import ErrorList

from .models import TipoDeVehiculo, Parametro, Item, NivelDePrecio, Cotizacion, Cliente, Itinerario, \
    CotizacionDetalle, Vehiculo, Tramo, Lugar, Conductor, TramoEnVehiculo, RutaDetalle

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
    def formfield_for_dbfield(self, db_field, **kwargs):
        formfield = super(CotizacionForm, self).formfield_for_dbfield(db_field, **kwargs)
        if db_field.name == 'descripcion':
            formfield.widget = forms.Textarea(attrs=formfield.widget.attrs)
        return formfield

    class Meta:
        model = Cotizacion
        fields = ['nombre', 'descripcion', 'fecha_ida', 'fecha_regreso', 'fecha_vence']
        widgets = {
            'fecha_vence': DateInput(),
            'fecha_ida': DateInput(),
            'fecha_regreso': DateInput(),
        }

    def clean(self):
        if self.cleaned_data['fecha_ida'] > self.cleaned_data['fecha_regreso']:
            msg = 'La fecha de ida no puede ser mayor que la fecha de regreso.'
            self._errors['fecha_ida'] = ErrorList([msg])
            del self.cleaned_data['fecha_ida']

        return self.cleaned_data


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


class RutaDetalleForm(forms.ModelForm):
    class Meta:
        model = RutaDetalle
        fields = ['tramo', ]


class CotizacionDetalleForm(forms.ModelForm):
    class Meta:
        model = CotizacionDetalle
        fields = ['item', 'cantidad', 'nivel_de_precio']


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
