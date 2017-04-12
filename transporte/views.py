from django.shortcuts import render
from django.views.generic import DetailView, ListView, UpdateView, CreateView

from .forms import TipoDeVehiculoForm, ParametroForm, ItemForm, NivelDePrecioForm, CotizacionForm, ClienteForm, \
    ItinerarioForm, CotizacionDetalleForm, VehiculoForm, LugarForm, TramoForm, ConductorForm
from .models import TipoDeVehiculo, Parametro, Item, NivelDePrecio, Cotizacion, Cliente, Itinerario, \
    CotizacionDetalle, Vehiculo, Tramo, Lugar, Conductor


def indice(request):
    """
    :param request:
    :return: Listado de TipoDeVehiculos
    """

    tipos_de_vehiculo = TipoDeVehiculo.objects.all()
    return render(request, "transporte/index.html", {'tipos_de_vehiculo': tipos_de_vehiculo})


class ItinerarioDataTable(ListView):
    model = Itinerario
    template_name = 'transporte/itinerario_datatable.html'

    def get_queryset(self):
        return Itinerario.objects.all()


class TipoDeVehiculoListView(ListView):
    model = TipoDeVehiculo


class TipoDeVehiculoCreateView(CreateView):
    model = TipoDeVehiculo
    form_class = TipoDeVehiculoForm


class TipoDeVehiculoDetailView(DetailView):
    model = TipoDeVehiculo


class TipoDeVehiculoUpdateView(UpdateView):
    model = TipoDeVehiculo
    form_class = TipoDeVehiculoForm


class ParametroListView(ListView):
    model = Parametro


class ParametroCreateView(CreateView):
    model = Parametro
    form_class = ParametroForm


class ParametroDetailView(DetailView):
    model = Parametro


class ParametroUpdateView(UpdateView):
    model = Parametro
    form_class = ParametroForm


class ItemListView(ListView):
    model = Item


class ItemCreateView(CreateView):
    model = Item
    form_class = ItemForm


class ItemDetailView(DetailView):
    model = Item


class ItemUpdateView(UpdateView):
    model = Item
    form_class = ItemForm


class NivelDePrecioListView(ListView):
    model = NivelDePrecio


class NivelDePrecioCreateView(CreateView):
    model = NivelDePrecio
    form_class = NivelDePrecioForm


class NivelDePrecioDetailView(DetailView):
    model = NivelDePrecio


class NivelDePrecioUpdateView(UpdateView):
    model = NivelDePrecio
    form_class = NivelDePrecioForm


class CotizacionListView(ListView):
    model = Cotizacion


class CotizacionCreateView(CreateView):
    model = Cotizacion
    form_class = CotizacionForm


class CotizacionDetailView(DetailView):
    model = Cotizacion


class CotizacionUpdateView(UpdateView):
    model = Cotizacion
    form_class = CotizacionForm


class ClienteListView(ListView):
    model = Cliente


class ClienteCreateView(CreateView):
    model = Cliente
    form_class = ClienteForm


class ClienteDetailView(DetailView):
    model = Cliente


class ClienteUpdateView(UpdateView):
    model = Cliente
    form_class = ClienteForm


class ItinerarioListView(ListView):
    model = Itinerario


class ItinerarioCreateView(CreateView):
    model = Itinerario
    form_class = ItinerarioForm


class ItinerarioDetailView(DetailView):
    model = Itinerario


class ItinerarioUpdateView(UpdateView):
    model = Itinerario
    form_class = ItinerarioForm


class CotizacionDetalleListView(ListView):
    model = CotizacionDetalle


class CotizacionDetalleCreateView(CreateView):
    model = CotizacionDetalle
    form_class = CotizacionDetalleForm


class CotizacionDetalleDetailView(DetailView):
    model = CotizacionDetalle


class CotizacionDetalleUpdateView(UpdateView):
    model = CotizacionDetalle
    form_class = CotizacionDetalleForm


class VehiculoListView(ListView):
    model = Vehiculo


class VehiculoCreateView(CreateView):
    model = Vehiculo
    form_class = VehiculoForm


class VehiculoDetailView(DetailView):
    model = Vehiculo


class VehiculoUpdateView(UpdateView):
    model = Vehiculo
    form_class = VehiculoForm


class TramoListView(ListView):
    model = Tramo


class TramoCreateView(CreateView):
    model = Tramo
    form_class = TramoForm


class TramoDetailView(DetailView):
    model = Tramo


class TramoUpdateView(UpdateView):
    model = Tramo
    form_class = TramoForm


class LugarListView(ListView):
    model = Lugar


class LugarCreateView(CreateView):
    model = Lugar
    form_class = LugarForm


class LugarDetailView(DetailView):
    model = Lugar


class LugarUpdateView(UpdateView):
    model = Lugar
    form_class = LugarForm


class ConductorListView(ListView):
    model = Conductor


class ConductorCreateView(CreateView):
    model = Conductor
    form_class = ConductorForm


class ConductorDetailView(DetailView):
    model = Conductor


class ConductorUpdateView(UpdateView):
    model = Conductor
    form_class = ConductorForm
