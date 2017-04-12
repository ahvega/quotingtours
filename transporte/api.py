from rest_framework import viewsets, permissions, filters

from .models import TipoDeVehiculo, Parametro, Item, NivelDePrecio, Cotizacion, Cliente, Itinerario, \
    CotizacionDetalle, Vehiculo, Tramo, Lugar, Conductor
from . import serializers


class TipoDeVehiculoViewSet(viewsets.ModelViewSet):
    """ViewSet for the TipoDeVehiculo class"""

    queryset = TipoDeVehiculo.objects.all()
    serializer_class = serializers.TipoDeVehiculoSerializer
    permission_classes = [permissions.IsAuthenticated]


class ParametroViewSet(viewsets.ModelViewSet):
    """ViewSet for the Parametro class"""

    queryset = Parametro.objects.all()
    serializer_class = serializers.ParametroSerializer
    permission_classes = (permissions.IsAuthenticated,)
    filter_backends = (filters.DjangoFilterBackend,)
    filter_fields = ('annio','slug')

# class ParametroList(generics.ListAPIView):
#     queryset = Parametro.objects.all()
#     serializer_class = serializers.ParametroSerializer
#     # permission_classes = [permissions.IsAuthenticated]
#     filter_backends = filters.DjangoFilterBackend
#     filter_fields = ['annio']


class ItemViewSet(viewsets.ModelViewSet):
    """ViewSet for the Item class"""

    queryset = Item.objects.all()
    serializer_class = serializers.ItemSerializer
    permission_classes = [permissions.IsAuthenticated]


class NivelDePrecioViewSet(viewsets.ModelViewSet):
    """ViewSet for the NivelDePrecio class"""

    queryset = NivelDePrecio.objects.all()
    serializer_class = serializers.NivelDePrecioSerializer
    permission_classes = [permissions.IsAuthenticated]


class CotizacionViewSet(viewsets.ModelViewSet):
    """ViewSet for the Cotizacion class"""

    queryset = Cotizacion.objects.all()
    serializer_class = serializers.CotizacionSerializer
    permission_classes = [permissions.IsAuthenticated]


class ClienteViewSet(viewsets.ModelViewSet):
    """ViewSet for the Cliente class"""

    queryset = Cliente.objects.all()
    serializer_class = serializers.ClienteSerializer
    permission_classes = [permissions.IsAuthenticated]


class ItinerarioViewSet(viewsets.ModelViewSet):
    """ViewSet for the Itinerario class"""

    queryset = Itinerario.objects.all()
    serializer_class = serializers.ItinerarioSerializer
    permission_classes = [permissions.IsAuthenticated]


class CotizacionDetalleViewSet(viewsets.ModelViewSet):
    """ViewSet for the CotizacionDetalle class"""

    queryset = CotizacionDetalle.objects.all()
    serializer_class = serializers.CotizacionDetalleSerializer
    permission_classes = [permissions.IsAuthenticated]


class VehiculoViewSet(viewsets.ModelViewSet):
    """ViewSet for the Vehiculo class"""

    queryset = Vehiculo.objects.all()
    serializer_class = serializers.VehiculoSerializer
    permission_classes = [permissions.IsAuthenticated]


class TramoViewSet(viewsets.ModelViewSet):
    """ViewSet for the Tramo class"""

    queryset = Tramo.objects.all()
    serializer_class = serializers.TramoSerializer
    permission_classes = [permissions.IsAuthenticated]


class LugarViewSet(viewsets.ModelViewSet):
    """ViewSet for the Lugar class"""

    queryset = Lugar.objects.all()
    serializer_class = serializers.LugarSerializer
    permission_classes = [permissions.IsAuthenticated]


class ConductorViewSet(viewsets.ModelViewSet):
    """ViewSet for the Conductor class"""

    queryset = Conductor.objects.all()
    serializer_class = serializers.ConductorSerializer
    permission_classes = [permissions.IsAuthenticated]
