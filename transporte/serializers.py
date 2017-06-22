from rest_framework import serializers

from . import models


class TipoDeVehiculoSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.TipoDeVehiculo
        fields = (
            'id',
            'nombre',
            'rendimiento',
            'costo_por_dia', 
            'costo_por_km',
            'capacidad_nominal',
            'capacidad_real',
            'galones_tanque',
            'slug',
            'creado',
            'actualizado',
        )


class ParametroSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Parametro
        fields = (
            'id',
            'annio',
            'nombre', 
            'valor', 
            'unidad', 
            'orden', 
            'slug',
            'creado',
            'actualizado', 
        )


class ItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Item
        fields = (
            'id',
            'nombre',
            'tipo_item',
            'costo',
            'precio', 
            'descripcion_compra', 
            'descripcion_venta',
            'slug',
            'creado',
            'actualizado',
        )


class NivelDePrecioSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.NivelDePrecio
        fields = (
            'id',
            'nombre',
            'tipo',
            'accion', 
            'valor',
            'factor',
            'slug',
            'creado',
            'actualizado',
        )


class CotizacionSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Cotizacion
        fields = (
            'id',
            'nombre',
            'fecha_vence',
            'descripcion',
            'subtotal', 
            'utilidad',
            'total',
            'slug',
            'creado',
            'actualizado',
        )


class ClienteSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Cliente
        fields = (
            'id',
            'nombre',
            'email',
            'tel',
            'rtn',
            'slug',
            'creado',
            'actualizado', 
        )


class ItinerarioSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Itinerario
        fields = (
            'id',
            'nombre',
            'fecha_desde',
            'fecha_hasta', 
            'estatus',
            'slug',
            'creado',
            'actualizado',
        )


class CotizacionDetalleSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.CotizacionDetalle
        fields = (
            'id',
            'descripcion',
            'cantidad',
            'costo',
            'monto',
            'markup',
            'utilidad',
            'total',
            'slug',
            'creado',
            'actualizado',
        )


class VehiculoSerializer(serializers.ModelSerializer):
    tipo_nombre = serializers.ReadOnlyField()
    costo_por_dia = serializers.ReadOnlyField()
    costo_por_km = serializers.ReadOnlyField()
    capacidad_nominal = serializers.ReadOnlyField()
    capacidad_real = serializers.ReadOnlyField()
    galones_tanque = serializers.ReadOnlyField()

    class Meta:
        model = models.Vehiculo
        fields = (
            'id',
            'nombre',
            'chofer_fijo',
            'fecha_adquirido',
            'placa',
            'tipo',
            'tipo_nombre',
            'costo_por_dia',
            'costo_por_km',
            'capacidad_nominal',
            'capacidad_real',
            'galones_tanque',
            'slug',
            'creado',
            'actualizado',
        )


class TramoEnVehiculoSerializer(serializers.ModelSerializer):
    tramo = serializers.ReadOnlyField()
    vehiculo = serializers.ReadOnlyField()
    descripcion = serializers.ReadOnlyField()
    costo = serializers.ReadOnlyField()
    slug = serializers.ReadOnlyField()

    class Meta:
        model = models.TramoEnVehiculo
        fields = (
            'tramo',
            'vehiculo',
            'nombre',
            'costo',
            'slug',
        )


class TramoSerializer(serializers.ModelSerializer):
    codigo = serializers.ReadOnlyField()
    descripcion = serializers.ReadOnlyField()
    kms = serializers.ReadOnlyField()
    hrs = serializers.ReadOnlyField()
    origen = serializers.ReadOnlyField()
    destino = serializers.ReadOnlyField()

    class Meta:
        model = models.Tramo
        fields = (
            'id',
            'codigo',
            'descripcion',
            'origen',
            'destino',
            'kms',
            'hrs',
            'slug',
            'creado',
            'actualizado',
        )


class LugarSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Lugar
        fields = (
            'id',
            'codigo',
            'nombre',
            'pais',
            'slug',
            'creado',
            'actualizado',
        )


class ConductorSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Conductor
        fields = (
            'id',
            'nombre',
            'identidad',
            'telefono',
            'empleado',
            'incentivo_por_dia',
            'slug',
            'creado',
            'actualizado',
        )
