#!/usr/bin/python
# -*- coding:  utf-8 -*-
from __future__ import unicode_literals

import datetime

from django.contrib.contenttypes.models import ContentType
from django.core.urlresolvers import reverse
from django.db import models as models
from django.db.models import *
from django.utils.timezone import now
from django.utils.translation import ugettext as _
from django_extensions.db import fields as extension_fields
from djchoices import DjangoChoices, ChoiceItem

from .directions import distancia, duracion, verbage


class TipoDeVehiculo(models.Model):
    # Fields
    nombre = CharField(max_length=20)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True)
    rendimiento = IntegerField()
    costo_por_dia = DecimalField(max_digits=10, decimal_places=2)
    costo_por_km = DecimalField(max_digits=10, decimal_places=2)
    capacidad_nominal = IntegerField()
    capacidad_real = IntegerField()
    galones_tanque = DecimalField(max_digits=6, decimal_places=2)
    activo = BooleanField(default=True)
    creado = DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        ordering = ('-id',)
        verbose_name = _('Tipo de Vehículo')
        verbose_name_plural = _('Tipos de Vehículo')

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def get_absolute_url(self):
        return reverse('transporte_tipodevehiculo_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_tipodevehiculo_update', args=(self.slug,))


class Parametro(models.Model):
    ANNIOS = []
    for r in range(2016, (datetime.datetime.now().year + 2)):
        ANNIOS.append((r, r))
    # Fields
    annio = IntegerField(verbose_name='Año', choices=ANNIOS, default=datetime.datetime.now().year)
    nombre = CharField(max_length=25)
    valor = CharField(max_length=100)
    unidad = CharField(max_length=100)
    orden = IntegerField(default=0)
    slug = extension_fields.AutoSlugField(populate_from=('annio', 'nombre'), blank=True, overwrite=True)
    creado = DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        ordering = ['annio', 'orden', ]
        verbose_name = _('Parámetro')
        verbose_name_plural = _('Parámetros')
        unique_together = ('annio', 'nombre')

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def get_absolute_url(self):
        return reverse('transporte_parametro_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_parametro_update', args=(self.slug,))


class Item(models.Model):
    # Choices
    class TipoItem(DjangoChoices):
        Insumo = ChoiceItem("Insumo")
        Servicio = ChoiceItem("Servicio")
        Subcontratado = ChoiceItem("Subcontratado")
        Cargo = ChoiceItem("Cargo")
        Descuento = ChoiceItem("Descuento")
        Impuesto = ChoiceItem("Impuesto")
        Grupo = ChoiceItem("Grupo")

    # Fields
    nombre = models.CharField(max_length=100)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True)
    tipo_item = models.CharField(max_length=13,
                                 choices=TipoItem.choices,
                                 validators=[TipoItem.validator],
                                 default=TipoItem.Servicio)
    unidad = models.CharField(max_length=50)
    costo = models.DecimalField(max_digits=10, decimal_places=4)
    precio = models.DecimalField(max_digits=10, decimal_places=4)
    descripcion_compra = models.CharField(max_length=50)
    descripcion_venta = models.CharField(max_length=50)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        ordering = ('-id',)
        verbose_name = _('Item')
        verbose_name_plural = _('Items')

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def get_absolute_url(self):
        return reverse('transporte_item_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_item_update', args=(self.slug,))


class NivelDePrecio(models.Model):
    # Choices
    class Tipo(DjangoChoices):
        Porcentaje = ChoiceItem("Porcentaje")
        Valor = ChoiceItem("Valor")

    class Accion(DjangoChoices):
        Incrementa = ChoiceItem("Incrementa")
        Decrementa = ChoiceItem("Decrementa")

    # Fields
    nombre = models.CharField(max_length=50)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True)
    tipo = models.CharField(max_length=10, choices=Tipo.choices, validators=[Tipo.validator], default=Tipo.Porcentaje)
    accion = models.CharField(max_length=10, choices=Accion.choices, validators=[Accion.validator],
                              default=Accion.Incrementa)
    valor = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    _factor = models.DecimalField(max_digits=5, decimal_places=4, db_column='factor', null=True, blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        ordering = ('valor',)
        verbose_name = _('Nivel de Precio')
        verbose_name_plural = _('Niveles de Precio')

    @property
    def factor(self):
        return 1 / (1 - self.valor)

    @factor.setter
    def factor(self, value):
        self._factor = value

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def get_absolute_url(self):
        return reverse('transporte_niveldeprecio_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_niveldeprecio_update', args=(self.slug,))

    @property
    def porciento(self):
        return self.valor * 100.0


class Cliente(models.Model):
    # Fields
    nombre = models.CharField(max_length=100)
    contacto = models.CharField(max_length=100)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True)
    email = models.EmailField(unique=True, db_index=True, null=True)
    tel = models.CharField(max_length=15, null=True)
    ciudad = models.CharField(max_length=50, default='San Pedro Sula')
    pais = models.CharField(max_length=50, default='Honduras')
    rtn = models.CharField(max_length=16)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    nivel_de_precio = models.ForeignKey(NivelDePrecio,
                                        verbose_name='nivel de precio',
                                        on_delete=models.PROTECT,
                                        default=4)

    class Meta:
        ordering = ('-id',)
        verbose_name = _('Cliente')
        verbose_name_plural = _('Clientes')

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def get_absolute_url(self):
        return reverse('transporte_cliente_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_cliente_update', args=(self.slug,))


class Itinerario(models.Model):
    # estatus opciones
    class Status(DjangoChoices):
        Solicitado = ChoiceItem("Solicitado")
        Cotizado = ChoiceItem("Cotizado")
        Confirmado = ChoiceItem("Confirmado")
        Facturado = ChoiceItem("Facturado")
        Cerrado = ChoiceItem("Cerrado")

    # Fields
    nombre = models.CharField(max_length=100)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True)
    fecha_desde = models.DateField(verbose_name='inicia')
    fecha_hasta = models.DateField(verbose_name='termina')
    estatus = models.CharField(max_length=10, choices=Status.choices, validators=[Status.validator],
                               default=Status.Solicitado)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    cliente = models.ForeignKey(Cliente, on_delete=CASCADE, verbose_name='cliente')
    nivel_de_precio = models.ForeignKey(NivelDePrecio,
                                        verbose_name='nivel de precio',
                                        on_delete=models.PROTECT, null=True)

    class Meta:
        ordering = ('-id',)
        verbose_name = _('Itinerario')
        verbose_name_plural = _('Itinerarios')

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def get_absolute_url(self):
        return reverse('transporte_itinerario_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_itinerario_update', args=(self.slug,))


class Cotizacion(models.Model):
    # Fields
    nombre = models.CharField(max_length=100)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True)
    fecha_vence = models.DateField(default=now)
    _subtotal = models.DecimalField(max_digits=10,
                                    decimal_places=2,
                                    null=True,
                                    blank=True,
                                    db_column='subtotal',
                                    default=0)
    _utilidad = models.DecimalField(max_digits=10,
                                    decimal_places=2,
                                    null=True,
                                    blank=True,
                                    db_column='utilidad',
                                    default=0)
    _total = models.DecimalField(max_digits=10,
                                 decimal_places=2,
                                 null=True,
                                 blank=True,
                                 db_column='total',
                                 default=0)
    # utilidad = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    # total = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    itinerario = models.ForeignKey(Itinerario, on_delete=CASCADE, verbose_name='itinerario')
    nivel_de_precio = models.ForeignKey(NivelDePrecio,
                                        verbose_name='nivel de precio',
                                        on_delete=models.PROTECT, null=True)

    class Meta:
        ordering = ('-id',)
        verbose_name = _('Cotización')
        verbose_name_plural = _('Cotizaciones')

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    @property
    def subtotal(self):
        agregado = self.lineas.aggregate(subtotal=Sum('monto'))
        return agregado['subtotal']

    @subtotal.setter
    def subtotal(self, value):
        self._subtotal = value

    @property
    def total(self):
        agregado = self.lineas.aggregate(total=Sum('total'))
        return agregado['total']

    @total.setter
    def total(self, value):
        self._total = value

    @property
    def utilidad(self):
        if self._total == 0:
            return 0
        else:
            return round((self._total - self._subtotal) / self._total, 4)

    @utilidad.setter
    def utilidad(self, value):
        self._utilidad = value

    def get_absolute_url(self):
        return reverse('transporte_cotizacion_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_cotizacion_update', args=(self.slug,))


class CotizacionDetalle(models.Model):
    # Fields
    _descripcion = models.CharField(max_length=100, null=True, blank=True, db_column='descripcion')
    cantidad = models.DecimalField(max_digits=10, decimal_places=2)
    costo = models.DecimalField(max_digits=10,
                                decimal_places=2,
                                default=0, editable=False)
    monto = models.DecimalField(max_digits=10,
                                decimal_places=2,
                                default=0, editable=False)
    markup = models.DecimalField(max_digits=6,
                                 decimal_places=4,
                                 default=0, editable=False)
    total = models.DecimalField(max_digits=10,
                                decimal_places=2,
                                default=0, editable=False)
    slug = extension_fields.AutoSlugField(populate_from='item', blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    cotizacion = models.ForeignKey(Cotizacion, on_delete=CASCADE, verbose_name='cotizacion', related_name='lineas')
    item = models.ForeignKey(Item, verbose_name='item', related_name='item')
    nivel_de_precio = models.ForeignKey(NivelDePrecio,
                                        verbose_name='nivel de precio',
                                        on_delete=models.PROTECT, null=True, blank=True)

    class Meta:
        ordering = ('id',)
        verbose_name = _('Detalle de Cotización')
        verbose_name_plural = _('Detalles de Cotización')

    @property
    def descripcion(self):
        return self.item.descripcion_venta

    @descripcion.setter
    def descripcion(self, value):
        self._descripcion = value

    def save(self, *args, **kwargs):
        self.costo = self.item.costo
        self.monto = self.cantidad * self.costo
        self.markup = round(self.nivel_de_precio.factor - 1, 4)
        self.total = float(self.monto) * (1 + float(self.markup))
        super(CotizacionDetalle, self).save(*args, **kwargs)

    def __str__(self):
        return self._descripcion

    def __unicode__(self):
        return u'%s' % self.slug

    def get_absolute_url(self):
        return reverse('transporte_cotizaciondetalle_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_cotizaciondetalle_update', args=(self.slug,))

        # def get_delete_url(self):
        #     return reverse('transporte_cotizaciondetalle_delete', args=(self.slug,))


class Vehiculo(models.Model):
    # Fields
    nombre = models.CharField(max_length=5)
    placa = models.CharField(max_length=10)
    chofer_fijo = BooleanField()
    fecha_adquirido = models.DateField(null=True, blank=True)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    tipo = models.ForeignKey(TipoDeVehiculo, on_delete=CASCADE, verbose_name='tipo', related_name='vehiculos')

    class Meta:
        ordering = ('-creado',)

    def __unicode__(self):
        return u'%s' % self.nombre

    @property
    def tipo_nombre(self):
        return self.tipo.nombre

    @property
    def costo_por_dia(self):
        return self.tipo.costo_por_dia

    @property
    def costo_por_km(self):
        return self.tipo.costo_por_km

    @property
    def capacidad_nominal(self):
        return self.tipo.capacidad_nominal

    @property
    def capacidad_real(self):
        return self.tipo.capacidad_real

    def get_absolute_url(self):
        return reverse('transporte_vehiculo_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_vehiculo_update', args=(self.slug,))


class Lugar(models.Model):
    class Zona(DjangoChoices):
        Uno = ChoiceItem('1')
        Dos = ChoiceItem('2')
        Tres = ChoiceItem('3')

    # Fields
    codigo = models.CharField(max_length=3, unique=True, )
    nombre = models.CharField(max_length=50)
    pais = models.CharField(max_length=30)
    zona = models.CharField(max_length=4, choices=Zona.choices, validators=[Zona.validator], default=Zona.Uno)
    slug = extension_fields.AutoSlugField(populate_from='codigo', blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        ordering = ('-id',)
        verbose_name_plural = 'Lugares'

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def get_absolute_url(self):
        return reverse('transporte_lugar_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_lugar_update', args=(self.slug,))


class Tramo(models.Model):
    # Fields
    _codigo = models.TextField(max_length=7, db_column='codigo', blank=True)
    _descricpion = models.CharField(max_length=255, blank=True, null=True, db_column='descripcion')
    _kms = models.IntegerField(null=True, blank=True, db_column='kms')
    _hrs = models.DecimalField(max_digits=4, decimal_places=1, null=True, blank=True, db_column='hrs')
    _cruza_frontera = models.BooleanField(db_column='cruza_frontera', default=False)
    _zona_destino = models.CharField(max_length=4, db_column='zona_destino', null=True, blank=True)
    desde_hacia = models.TextField(max_length=100)
    slug = extension_fields.AutoSlugField(populate_from='codigo', blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)
    # Relationship Fields
    desde_lugar = models.ForeignKey(Lugar, verbose_name='origen', related_name='desde')
    hacia_lugar = models.ForeignKey(Lugar, verbose_name='destino', related_name='hacia')

    class Meta:
        ordering = ('-id',)
        unique_together = ('desde_lugar', 'hacia_lugar')

    @property
    def codigo(self):
        return self.desde_lugar.codigo + '-' + self.hacia_lugar.codigo

    @codigo.setter
    def codigo(self, value):
        self._codigo = value

    @property
    def origen(self):
        return self.desde_lugar.nombre

    @property
    def destino(self):
        return self.hacia_lugar.nombre

    @property
    def pais_origen(self):
        return self.desde_lugar.pais

    @property
    def pais_destino(self):
        return self.hacia_lugar.pais

    @property
    def cruza_frontera(self):
        return False if self.desde_lugar.pais == self.hacia_lugar.pais else True

    @cruza_frontera.setter
    def cruza_frontera(self, value):
        self._cruza_frontera = value

    @property
    def zona_destino(self):
        return self.hacia_lugar.zona

    @zona_destino.setter
    def zona_destino(self, value):
        self._zona_destino = value

    @property
    def kms(self):
        return distancia(self.desde_lugar.nombre, self.hacia_lugar.nombre)

    @kms.setter
    def kms(self, value):
        self._kms = value

    @property
    def hrs(self):
        return duracion(self.desde_lugar.nombre, self.hacia_lugar.nombre)

    @hrs.setter
    def hrs(self, value):
        self._hrs = value

    @property
    def descripcion(self):
        return verbage(self.desde_lugar.nombre, self.hacia_lugar.nombre)

    @descripcion.setter
    def descripcion(self, value):
        self._descipcion = value

    def __str__(self):
        return self.codigo

    def __unicode__(self):
        return u'%s' % self.codigo

    def get_absolute_url(self):
        return reverse('transporte_tramo_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_tramo_update', args=(self.slug,))


class Conductor(models.Model):
    # Fields
    nombre = models.CharField(max_length=30)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)
    identidad = models.TextField(max_length=13)
    telefono = models.TextField(max_length=13)
    empleado = models.BooleanField()
    incentivo_por_dia = models.DecimalField(max_digits=6, decimal_places=2)

    class Meta:
        ordering = ('-id',)
        verbose_name_plural = 'Conductores'

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def get_absolute_url(self):
        return reverse('transporte_conductor_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_conductor_update', args=(self.slug,))
