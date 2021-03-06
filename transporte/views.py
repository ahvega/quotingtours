from django.shortcuts import render, get_object_or_404
from django.views.generic import DetailView, ListView, UpdateView, CreateView, DeleteView
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
# from django.shortcuts import render
from .filters import UserFilter

from .forms import TipoDeVehiculoForm, ParametroForm, ItemForm, NivelDePrecioForm, CotizacionForm, ClienteForm, \
    ItinerarioForm, CotizacionDetalleForm, VehiculoForm, LugarForm, TramoForm, ConductorForm, TramoEnVehiculoForm, \
    RutaDetalleForm, ItemGrupoForm, ItemGrupoLineaForm
from .models import TipoDeVehiculo, Parametro, Item, NivelDePrecio, Cotizacion, Cliente, Itinerario, \
    CotizacionDetalle, Vehiculo, Tramo, Lugar, Conductor, TramoEnVehiculo, RutaDetalle, ItemGrupo, ItemGrupoLinea


def indice(request):
    """
    :param request:
    :return: Listado de TipoDeVehiculos
    """

    tipos_de_vehiculo = TipoDeVehiculo.objects.all()
    return render(request, "transporte/index.html", {'tipos_de_vehiculo': tipos_de_vehiculo})


def search(request):
    user_list = User.objects.all()
    user_filter = UserFilter(request.GET, queryset=user_list)
    return render(request, 'search/user_list.html', {'filter': user_filter})


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


class ParametroList(ListView):
    model = Parametro


class ParametroCreate(CreateView):
    model = Parametro
    form_class = ParametroForm


class ParametroDetail(DetailView):
    model = Parametro


class ParametroUpdate(UpdateView):
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


class ItemDeleteView(DeleteView):
    model = Item

    def get_success_url(self):
        if 'after' in self.request.POST:
            return self.request.POST.get('after')
        else:
            slug = self.object.item.slug

        return reverse('transporte_item_list')


class ItemGrupoListView(ListView):
    model = ItemGrupo


class ItemGrupoCreateView(CreateView):
    model = ItemGrupo
    form_class = ItemGrupoForm

class ItemGrupoDetailView(DetailView):
    model = ItemGrupo


class ItemGrupoUpdateView(UpdateView):
    model = ItemGrupo
    form_class = ItemGrupoForm


class ItemGrupoDeleteView(DeleteView):
    model = ItemGrupo

    def get_success_url(self):
        if 'after' in self.request.POST:
            return self.request.POST.get('after')
        else:
            slug = self.object.item_grupo.slug

        return reverse('transporte_itemgrupo_list')


class ItemGrupoLineaListView(ListView):
    model = ItemGrupoLinea


class ItemGrupoLineaCreateView(CreateView):
    model = ItemGrupoLinea
    form_class = ItemGrupoLineaForm

    def form_valid(self, form):
        itemgrupolinea = form.save(commit=False)
        itemgrupo_id = form.data['itemgrupo']
        itemgrupo = get_object_or_404(ItemGrupo, id=itemgrupo_id)
        itemgrupolinea.item_grupo = itemgrupo
        return super(ItemGrupoLineaCreateView, self).form_valid(form)

    def get_context_data(self, **kwargs):
        context = super(ItemGrupoLineaCreateView, self).get_context_data(**kwargs)
        context['g_id'] = self.kwargs['itemgrupo_id']
        return context

    def get_success_url(self):
        if 'after' in self.request.POST:
            return self.request.POST.get('after')
        else:
            slug = self.object.item_grupo.slug
        return reverse('transporte_itemgrupo_detail', kwargs={'slug': slug})


class ItemGrupoLineaDetailView(DetailView):
    model = ItemGrupoLinea


class ItemGrupoLineaUpdateView(UpdateView):
    model = ItemGrupoLinea
    form_class = ItemGrupoLineaForm

    def get_success_url(self):
        if 'after' in self.request.POST:
            return self.request.POST.get('after')
        else:
            slug = self.object.item_grupo.slug
        return reverse('transporte_itemgrupo_detail', kwargs={'slug': slug})


class ItemGrupoLineaDeleteView(DeleteView):
    model = ItemGrupoLinea

    def get_success_url(self):
        if 'after' in self.request.POST:
            return self.request.POST.get('after')
        else:
            slug = self.object.item_grupo.slug

        return reverse('transporte_itemgrupo_detail', kwargs={'slug': slug})


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


class CotizacionTable(ListView):
    model = Cotizacion
    # template_name = 'transporte/cotizacion_table.html'
    #
    # def get_queryset(self):
    #     return Cotizacion.objects.all()


class CotizacionCreate(CreateView):
    model = Cotizacion
    form_class = CotizacionForm

    def form_valid(self, form):
        cotizacion = form.save(commit=False)
        itinerario_id = form.data['itinerario']
        itinerario = get_object_or_404(Itinerario, id=itinerario_id)
        cotizacion.itinerario = itinerario
        return super(CotizacionCreate, self).form_valid(form)

    def get_context_data(self, **kwargs):
        context = super(CotizacionCreate, self).get_context_data(**kwargs)
        context['i_id'] = self.kwargs['itinerario_id']
        return context

    def get_success_url(self):
        if 'slug' in self.kwargs:
            slug = self.kwargs['slug']
        else:
            slug = self.object.itinerario.slug
        return reverse('transporte_itinerario_detail', kwargs={'slug': slug})


class CotizacionDetail(DetailView):
    model = Cotizacion


class CotizacionUpdate(UpdateView):
    model = Cotizacion
    form_class = CotizacionForm


class CotizacionDelete(DeleteView):
    model = Cotizacion

    def get_success_url(self):
        # if 'after' in self.request.POST:
        #     return self.request.POST.get('after')
        # else:
        slug = self.object.itinerario.slug
        return reverse('transporte_itinerario_detail', kwargs={'slug': slug})


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


class ItinerarioCreate(CreateView):
    model = Itinerario
    form_class = ItinerarioForm

    def form_valid(self, form):
        itinerario = form.save(commit=False)
        cliente_id = form.data['cliente']
        cliente = get_object_or_404(Cliente, id=cliente_id)
        itinerario.cliente = cliente
        return super(ItinerarioCreate, self).form_valid(form)

    def get_context_data(self, **kwargs):
        context = super(ItinerarioCreate, self).get_context_data(**kwargs)
        context['c_id'] = self.kwargs['cliente_id']
        return context

    def get_success_url(self):
        if 'slug' in self.kwargs:
            slug = self.kwargs['slug']
        else:
            slug = self.object.cliente.slug
        return reverse('transporte_cliente_detail', kwargs={'slug': slug})


class ItinerarioDetailView(DetailView):
    model = Itinerario


class ItinerarioUpdateView(UpdateView):
    model = Itinerario
    form_class = ItinerarioForm


class ItinerarioDeleteView(DeleteView):
    model = Itinerario

    def get_success_url(self):
        if 'after' in self.request.POST:
            return self.request.POST.get('after')
        else:
            slug = self.object.cliente.slug
        return reverse('transporte_cliente_detail', kwargs={'slug': slug})


class RutaDetalleListView(ListView):
    model = RutaDetalle


class RutaDetalleTable(ListView):
    model = RutaDetalle
    template_name = 'transporte/cotizacion_table.html'

    def get_queryset(self):
        return RutaDetalle.objects.all()


class RutaDetalleCreateView(CreateView):
    model = RutaDetalle
    form_class = RutaDetalleForm

    def form_valid(self, form):
        rutadetalle = form.save(commit=False)
        cotizacion_id = form.data['cotizacion']
        cotizacion = get_object_or_404(Cotizacion, id=cotizacion_id)
        rutadetalle.cotizacion = cotizacion
        return super(RutaDetalleCreateView, self).form_valid(form)

    def get_context_data(self, **kwargs):
        context = super(RutaDetalleCreateView, self).get_context_data(**kwargs)
        context['c_id'] = self.kwargs['cotizacion_id']
        return context

    def get_success_url(self):
        if 'slug' in self.kwargs:
            slug = self.kwargs['slug']
        else:
            slug = self.object.cotizacion.slug
        return reverse('transporte_cotizacion_detail', kwargs={'slug': slug})


class RutaDetalleDetailView(DetailView):
    model = RutaDetalle


class RutaDetalleUpdateView(UpdateView):
    model = RutaDetalle
    form_class = RutaDetalleForm

    def get_success_url(self):
        slug = self.object.cotizacion.slug
        return reverse('transporte_cotizacion_detail', kwargs={'slug': slug})


class RutaDetalleDeleteView(DeleteView):
    model = RutaDetalle

    def get_success_url(self):
        if 'after' in self.request.POST:
            return self.request.POST.get('after')
        else:
            slug = self.object.cotizacion.slug
        return reverse('transporte_cotizacion_detail', kwargs={'slug': slug})


class CotizacionDetalleListView(ListView):
    model = CotizacionDetalle


class CotizacionDetalleTable(ListView):
    model = CotizacionDetalle
    template_name = 'transporte/cotizacion_table.html'

    def get_queryset(self):
        return CotizacionDetalle.objects.all()


class CotizacionDetalleCreateView(CreateView):
    model = CotizacionDetalle
    form_class = CotizacionDetalleForm

    def form_valid(self, form):
        cotizaciondetalle = form.save(commit=False)
        cotizacion_id = form.data['cotizacion']
        cotizacion = get_object_or_404(Cotizacion, id=cotizacion_id)
        cotizaciondetalle.cotizacion = cotizacion
        return super(CotizacionDetalleCreateView, self).form_valid(form)

    def get_context_data(self, **kwargs):
        context = super(CotizacionDetalleCreateView, self).get_context_data(**kwargs)
        context['c_id'] = self.kwargs['cotizacion_id']
        return context

    def get_success_url(self):
        if 'slug' in self.kwargs:
            slug = self.kwargs['slug']
        else:
            slug = self.object.cotizacion.slug
        return reverse('transporte_cotizacion_detail', kwargs={'slug': slug})


class CotizacionDetalleDetailView(DetailView):
    model = CotizacionDetalle


class CotizacionDetalleUpdateView(UpdateView):
    model = CotizacionDetalle
    form_class = CotizacionDetalleForm

    def get_success_url(self):
        slug = self.object.cotizacion.slug
        return reverse('transporte_cotizacion_detail', kwargs={'slug': slug})


class CotizacionDetalleDeleteView(DeleteView):
    model = CotizacionDetalle

    def get_success_url(self):
        if 'after' in self.request.POST:
            return self.request.POST.get('after')
        else:
            slug = self.object.cotizacion.slug
        return reverse('transporte_cotizacion_detail', kwargs={'slug': slug})


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


class TramoEnVehiculoList(ListView):
    model = TramoEnVehiculo


class TramoEnVehiculoCreate(CreateView):
    model = TramoEnVehiculo
    form_class = TramoEnVehiculoForm

    def form_valid(self, form):
        tramoenvehiculo = form.save(commit=False)
        tramo_id = form.data['tramo']
        tramo = get_object_or_404(Tramo, id=tramo_id)
        tramoenvehiculo.tramo = tramo
        return super(TramoEnVehiculoCreate, self).form_valid(form)

    def get_context_data(self, **kwargs):
        context = super(TramoEnVehiculoCreate, self).get_context_data(**kwargs)
        context['t_id'] = self.kwargs['tramo_id']
        return context

    def get_success_url(self):
        if 'slug' in self.kwargs:
            slug = self.kwargs['slug']
        else:
            slug = self.object.tramo.slug
        return reverse('transporte_tramo_detail', kwargs={'slug': slug})


class TramoEnVehiculoDetail(DetailView):
    model = TramoEnVehiculo


class TramoEnVehiculoUpdate(UpdateView):
    model = TramoEnVehiculo
    form_class = TramoEnVehiculoForm


class TramoEnVehiculoDelete(DeleteView):
    model = TramoEnVehiculo

    def get_success_url(self):
        if 'after' in self.request.POST:
            return self.request.POST.get('after')
        else:
            slug = self.object.tramo.slug
        return reverse('transporte_tramo_detail', kwargs={'slug': slug})


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
