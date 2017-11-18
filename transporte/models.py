#!/usr/bin/python
# -*- coding:  utf-8 -*-
from __future__ import unicode_literals

import ast
import math
from decimal import Decimal
from datetime import date

from django.contrib.contenttypes.models import ContentType
from django.core.urlresolvers import reverse
from django.db import models as models
from django.db.models import *
from django.db.models.signals import post_delete
from django.dispatch import receiver
from django.utils.timezone import now
from django.utils.translation import ugettext as _
from django_extensions.db import fields as extension_fields
from djchoices import DjangoChoices, ChoiceItem
from django.db.models.functions import Coalesce

from transporte import countries
from .directions import distancia, duracion, verbage
# from restcountries import RestCountryApi as rapi


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
    for r in range(2016, (date.today().year + 2)):
        ANNIOS.append((r, r))
    # Fields
    annio = IntegerField(verbose_name='Año', choices=ANNIOS, default=date.today().year)
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


def param(parm):
    return Parametro.objects.get(slug=parm).valor


redondeoLps = float(int(ast.literal_eval(param('2017-redondeo-lps'))))
minimoKms = param('2017-minimo-kms')
minimoHrs = param('2017-tiempo-minimo')


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
    tipo = models.CharField(max_length=10, choices=Tipo.choices, validators=[Tipo.validator],
                            default=Tipo.Porcentaje)
    accion = models.CharField(max_length=10, choices=Accion.choices, validators=[Accion.validator],
                              default=Accion.Incrementa)
    valor = models.DecimalField(max_digits=7, decimal_places=4)
    factor = models.DecimalField(max_digits=7, decimal_places=6, null=True, blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        ordering = ('-valor',)
        verbose_name = _('Nivel de Precio')
        verbose_name_plural = _('Niveles de Precio')

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def save(self, *args, **kwargs):
        self.factor = 1 / (1 - self.valor)
        super(NivelDePrecio, self).save()

    def get_absolute_url(self):
        return reverse('transporte_niveldeprecio_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_niveldeprecio_update', args=(self.slug,))


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
    nombre = models.CharField(max_length=100, unique=True)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True)
    tipo_item = models.CharField(max_length=13, choices=TipoItem.choices, validators=[TipoItem.validator],
                                 default=TipoItem.Servicio)
    costo = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    descripcion_compra = models.CharField(max_length=255, blank=True, null=True)
    descripcion_venta = models.CharField(max_length=255, blank=True, null=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        ordering = ('nombre',)
        verbose_name = _('Ítem')
        verbose_name_plural = _('Ítems')

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    def get_absolute_url(self):
        if self.tipo_item == 'Grupo':
            return reverse('transporte_itemgrupo_detail', args=(self.slug,))
        else:
            return reverse('transporte_item_detail', args=(self.slug,))

    def get_update_url(self):
        if self.tipo_item == 'Grupo':
            return reverse('transporte_itemgrupo_update', args=(self.slug,))
        else:
            return reverse('transporte_item_update', args=(self.slug,))

    def get_delete_url(self):
        return reverse('transporte_item_delete', args=(self.slug,))

    def save(self, *args, **kwargs):
        if self.descripcion_venta is None:
            self.descripcion_venta = self.descripcion_compra
        if self.descripcion_compra is None:
            self.descripcion_compra = self.descripcion_venta
        super(Item, self).save(*args, **kwargs)


class ItemGrupo(Item):
    imprimir_detalle = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'Grupo'
        verbose_name_plural = 'Grupos'

    @property
    def subtotal(self):
        if self.grupo_lineas.exists():
            subtotal_agregado = self.grupo_lineas.aggregate(subtotal=Coalesce(Sum('costo_total'), 0))
            return subtotal_agregado['subtotal']
        else:
            return 0

    @property
    def total(self):
        if self.grupo_lineas.exists():
            total_agregado = self.grupo_lineas.aggregate(total=Coalesce(Sum('total'), 0))
            return Decimal(math.ceil(float(total_agregado['total']) / redondeoLps) * redondeoLps).quantize(
                Decimal("0.00"))
        else:
            return 0

    @property
    def utilidad(self):
        if self.grupo_lineas.exists():
            subtotal_agregado = self.grupo_lineas.aggregate(subtotal=Coalesce(Sum('costo_total'), 0))
            utilidad_porcentual = (self.total - Decimal(subtotal_agregado['subtotal'])) / self.total
            return Decimal(utilidad_porcentual).quantize(Decimal("0.0000"))
        else:
            return 0

    @property
    def utilidad_valor(self):
        if self.precio is None:
            return 0
        else:
            return self.total - self.subtotal

    def save(self, *args, **kwargs):
        self.costo = self.subtotal
        self.precio = self.total
        self.tipo_item = 'Grupo'
        super(ItemGrupo, self).save(*args, **kwargs)


def allowed_choices():
    return Q(tipo_item='Insumo') | Q(tipo_item='Servicio') | Q(tipo_item='Subcontratado') | \
           Q(tipo_item='Cargo') | Q(tipo_item='Descuento') | Q(tipo_item='Impuesto')


class ItemGrupoLinea(models.Model):
    nombre = models.CharField(max_length=100, null=True, blank=True)
    descripcion = models.CharField(max_length=255, null=True, blank=True)
    cantidad = models.DecimalField(max_digits=10, decimal_places=2)
    costo = models.DecimalField(max_digits=10, decimal_places=2, default=0, editable=False)
    costo_total = models.DecimalField(max_digits=10, decimal_places=2, default=0, editable=False)
    markup = models.DecimalField(max_digits=6, decimal_places=4, default=0, editable=False)
    utilidad = models.DecimalField(max_digits=6, decimal_places=4, default=0, editable=False)
    total = models.DecimalField(max_digits=10, decimal_places=2, default=0, editable=False)
    slug = extension_fields.AutoSlugField(populate_from='forslug', blank=True, overwrite=True)
    # slug = models.CharField(max_length=255, null=True, blank=True, editable=False)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    item = models.ForeignKey(Item, verbose_name='item', related_name='grupo_item',
                             # limit_choices_to=allowed_choices,
                             on_delete=models.PROTECT)
    item_grupo = models.ForeignKey(ItemGrupo, verbose_name='grupo', related_name='grupo_lineas')
    nivel_de_precio = models.ForeignKey(NivelDePrecio, verbose_name='nivel de precio',
                                        on_delete=models.PROTECT, null=True, blank=True)

    class Meta:
        ordering = ('id',)
        verbose_name = _('Grupo Ítem')
        verbose_name_plural = _('Grupo Ítems')

    @property
    def forslug(self):
        return str(self.item_grupo.id) + '_' + self.item.slug

    def save(self, *args, **kwargs):
        nivel_default = NivelDePrecio.objects.get(nombre='Prepago 15%')
        elgrupo = ItemGrupo.objects.get(id=self.item_grupo.pk)
        # self.slug = str(self.item_grupo.id)+'_'+self.item.slug
        self.nombre = self.item.nombre
        self.descripcion = self.item.descripcion_venta
        self.costo = self.item.costo
        self.costo_total = self.cantidad * self.costo
        if self.nivel_de_precio is None:
            self.nivel_de_precio = nivel_default
        self.markup = Decimal(round(self.nivel_de_precio.factor - 1, 4)).quantize(Decimal("0.0000"))
        self.utilidad = Decimal(self.nivel_de_precio.valor).quantize(Decimal("0.0000"))
        self.total = Decimal(self.costo_total) * (1 + Decimal(self.markup))
        super(ItemGrupoLinea, self).save(*args, **kwargs)
        elgrupo.save()

    @property
    def utilidad_valor(self):
        return self.total - self.costo_total

    def __str__(self):
        return str(self.descripcion)

    def __unicode__(self):
        return u'%s' % self.descripcion

    def get_absolute_url(self):
        return reverse('transporte_itemgrupolinea_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_itemgrupolinea_update', args=(self.slug,))

    def get_delete_url(self):
        return reverse('transporte_itemgrupolinea_delete', args=(self.slug,))

    def get_itemgrupo_url(self):
        return reverse('transporte_itemgrupo_detail', args=(self.item_grupo.slug,))


@receiver(post_delete, sender=ItemGrupoLinea)
def update_grupo_after_delete_linea(sender, instance, **kwargs):
    elgrupo = ItemGrupo.objects.get(id=instance.item_grupo.pk)
    elgrupo.save()


class Cliente(models.Model):
    # Fields
    nombre = models.CharField(max_length=100)
    codigo = models.CharField(unique=True, max_length=4, null=True, blank=True)
    contacto = models.CharField(max_length=100)
    slug = extension_fields.AutoSlugField(populate_from='codigo', blank=True, overwrite=True)
    email = models.EmailField(unique=True, db_index=True, null=True)
    tel = models.CharField(max_length=15, null=True)
    ciudad = models.CharField(max_length=50, default='San Pedro Sula')
    pais = models.CharField(max_length=50, default='Honduras')
    rtn = models.CharField(default='Consum. Final', max_length=16, verbose_name='RTN')
    subtotal_cotizado = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True, default=0)
    utilidad_cotizada = models.DecimalField(max_digits=6, decimal_places=4, null=True, blank=True, default=0)
    total_cotizado = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True, default=0)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    nivel_de_precio = models.ForeignKey(NivelDePrecio, verbose_name='nivel de precio',
                                        on_delete=models.PROTECT, default=4)

    class Meta:
        ordering = ('codigo',)
        verbose_name = _('Cliente')
        verbose_name_plural = _('Clientes')

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    @property
    def sum_subtotal_cotizado(self):
        if self.itinerarios.exists():
            subtotal_agregado = self.itinerarios.aggregate(subtotal=Coalesce(Sum('subtotal_cotizado'), 0))
            return subtotal_agregado['subtotal']
        else:
            return 0

    @property
    def sum_total_cotizado(self):
        if self.itinerarios.exists():
            total_agregado = self.itinerarios.aggregate(total=Coalesce(Sum('total_cotizado'), 0))
            return Decimal(math.ceil(float(total_agregado['total']) / redondeoLps) * redondeoLps).quantize(
                Decimal("0.00"))
        else:
            return 0

    @property
    def sum_utilidad_cotizada(self):
        if self.itinerarios.exists():
            subtotal_agregado = self.itinerarios.aggregate(subtotal=Coalesce(Sum('subtotal_cotizado'), 0))
            total_agregado = self.itinerarios.aggregate(total=Coalesce(Sum('total_cotizado'), 0))
            if total_agregado:
                redondeado = (math.ceil(float(total_agregado['total']) / redondeoLps)) * redondeoLps
                redondeado = Decimal(redondeado).quantize(Decimal("0.00"))
            else:
                redondeado = 0.00
            if redondeado == 0.00:
                return 0.0000
            else:
                utilidad_porcentual = (redondeado - Decimal(subtotal_agregado['subtotal'])) / redondeado
                return Decimal(utilidad_porcentual).quantize(Decimal("0.0000"))
        else:
            return 0

    @property
    def utilidad_cotizada_valor(self):
        if self.itinerarios.exists():
            return self.sum_total_cotizado - self.sum_subtotal_cotizado
        else:
            return 0

    def save(self, *args, **kwargs):
        self.subtotal_cotizado = self.sum_subtotal_cotizado
        self.utilidad_cotizada = self.sum_utilidad_cotizada
        self.total_cotizado = self.sum_total_cotizado
        self.codigo = self.codigo.upper()
        super(Cliente, self).save()

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
    nombre = models.CharField(max_length=255)
    _codigo_cliente = models.CharField(max_length=4, blank=True, null=True, db_column='codigo_cliente')
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True, overwrite=True)
    fecha_desde = models.DateField(verbose_name='Fecha Inicio')
    fecha_hasta = models.DateField(verbose_name='Fecha Final')
    _dias = models.IntegerField(db_column='dias', null=True, blank=True, default=1)

    estatus = models.CharField(max_length=10, choices=Status.choices,
                               validators=[Status.validator], default=Status.Solicitado)
    subtotal_cotizado = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True, default=0)
    utilidad_cotizada = models.DecimalField(max_digits=6, decimal_places=4, null=True, blank=True, default=0)
    total_cotizado = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True, default=0)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    cliente = models.ForeignKey(Cliente, on_delete=CASCADE, verbose_name='cliente',
                                related_name='itinerarios')
    nivel_de_precio = models.ForeignKey(NivelDePrecio, verbose_name='nivel de precio',
                                        on_delete=models.PROTECT, null=True)

    class Meta:
        ordering = ('cliente__codigo', 'estatus', '-fecha_desde',)
        verbose_name = _('Itinerario')
        verbose_name_plural = _('Itinerarios')
        unique_together = ('cliente', 'nombre')

    @property
    def dias(self):
        return (self.fecha_hasta - self.fecha_desde).days + 1

    @dias.setter
    def dias(self, value):
        self._dias = value

    @property
    def sum_subtotal_cotizado(self):
        if self.cotizaciones.exists():
            subtotal_agregado = self.cotizaciones.aggregate(subtotal=Coalesce(Sum('subtotal'), 0))
            return subtotal_agregado['subtotal']
        else:
            return 0

    @property
    def sum_total_cotizado(self):
        if self.cotizaciones.exists():
            total_agregado = self.cotizaciones.aggregate(total=Coalesce(Sum('total'), 0))
            return Decimal(math.ceil(float(total_agregado['total']) / redondeoLps) * redondeoLps).quantize(
                Decimal("0.00"))
        else:
            return 0

    @property
    def sum_utilidad_cotizada(self):
        if self.cotizaciones.exists():
            subtotal_agregado = self.cotizaciones.aggregate(subtotal=Coalesce(Sum('subtotal'), 0))
            total_agregado = self.cotizaciones.aggregate(total=Coalesce(Sum('total'), 0))
            if total_agregado:
                redondeado = (math.ceil(float(total_agregado['total']) / redondeoLps)) * redondeoLps
                redondeado = Decimal(redondeado).quantize(Decimal("0.00"))
            else:
                redondeado = 0.00
            if redondeado == 0.00:
                return 0.0000
            else:
                utilidad_porcentual = (redondeado - Decimal(subtotal_agregado['subtotal'])) / redondeado
                return Decimal(utilidad_porcentual).quantize(Decimal("0.0000"))
        else:
            return 0

    @property
    def utilidad_cotizada_valor(self):
        if self.cotizaciones.exists():
            return self.total_cotizado - self.subtotal_cotizado
        else:
            return 0

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    @property
    def codigo_cliente(self):
        return self.cliente.codigo

    @codigo_cliente.setter
    def codigo_cliente(self, value):
        self._codigo_cliente = value

    @property
    def nombre_expandido(self):
        return unicode(self.fecha_desde.strftime('%y%m')) + '-' + \
               unicode(self.codigo_cliente) + '-' + unicode(self.nombre)

    def save(self, *args, **kwargs):
        elcliente = Cliente.objects.get(id=self.cliente.pk)
        self.subtotal_cotizado = self.sum_subtotal_cotizado
        self.utilidad_cotizada = self.sum_utilidad_cotizada
        self.total_cotizado = self.sum_total_cotizado
        if self.nombre[:10] != self.nombre_expandido[:10]:
            self.nombre = self.nombre_expandido
        if self.nivel_de_precio is None:
            self.nivel_de_precio = self.cliente.nivel_de_precio
        super(Itinerario, self).save()
        elcliente.save()

    def get_absolute_url(self):
        return reverse('transporte_itinerario_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_itinerario_update', args=(self.slug,))


def info_country(name):
    # country_list = rapi.get_countries_by_name(name)
    country_list = countries.info_pais(name)
    country = country_list[0]
    return country


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
    slug = extension_fields.AutoSlugField(populate_from='codigo', blank=True, overwrite=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        ordering = ('pais', 'nombre',)
        verbose_name_plural = 'Lugares'

    def __str__(self):
        return self.nombre

    def __unicode__(self):
        return u'%s' % self.nombre

    @property
    def info_country(pais):
        country = countries.info_pais(pais)
        return country

    @property
    def codigo_pais2(self):
        country = info_country(self.pais)
        return country['alpha2Code']
        # return countries.info_pais('codigo2',self.pais)

    @property
    def nombre_pais(self):
        country = info_country(self.pais)
        return country[u'translations'][u'es']

    def save(self, *args, **kwargs):
        self.codigo = self.codigo.upper()
        self.pais = self.nombre_pais
        try:
            lacomma = self.nombre.rindex(',')
            self.nombre = self.nombre[:lacomma]
        except:
            self.nombre = self.nombre

        self.nombre = self.nombre + ', ' + self.codigo_pais2
        super(Lugar, self).save()

    def get_absolute_url(self):
        return reverse('transporte_lugar_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_lugar_update', args=(self.slug,))


class Tramo(models.Model):
    # Fields
    codigo = models.TextField(max_length=7, blank=True, null=True)
    descripcion = models.CharField(max_length=255, blank=True, null=True)
    kms = models.IntegerField(null=True, blank=True)
    hrs = models.DecimalField(max_digits=4, decimal_places=1, null=True, blank=True)
    cruza_frontera = models.BooleanField(default=False)
    zona_destino = models.CharField(max_length=4, null=True, blank=True)
    desde_hacia = models.TextField(max_length=200)
    slug = extension_fields.AutoSlugField(populate_from='codigo', blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)
    # Relationship Fields
    desde_lugar = models.ForeignKey(Lugar, verbose_name='origen', related_name='desde')
    hacia_lugar = models.ForeignKey(Lugar, verbose_name='destino', related_name='hacia')

    class Meta:
        ordering = ('codigo',)
        unique_together = ('desde_lugar', 'hacia_lugar')

    def save(self, *args, **kwargs):
        self.codigo = self.desde_lugar.codigo + '-' + self.hacia_lugar.codigo
        self.pais_destino = self.hacia_lugar.pais
        self.cruza_frontera = False if self.desde_lugar.pais == self.hacia_lugar.pais else True
        self.zona_destino = self.hacia_lugar.zona
        self.desde_hacia = self.desde_lugar.nombre + ' - ' + self.hacia_lugar.nombre
        if self.desde_lugar == self.hacia_lugar:
            minimoKms = param('2017-minimo-kms')
            if self.desde_lugar.pais != 'Honduras':
                minimoKms = '100'
            minimoHrs = param('2017-tiempo-minimo')
            self.kms = minimoKms
            self.hrs = minimoHrs
            self.desde_hacia = "Movimientos en " + self.desde_lugar.nombre
            self.descripcion = self.desde_hacia + " " + minimoKms + " Kms // " + minimoHrs + " Hrs"
        else:
            self.kms = distancia(self.desde_lugar.nombre, self.hacia_lugar.nombre)
            self.hrs = duracion(self.desde_lugar.nombre, self.hacia_lugar.nombre)
            self.descripcion = verbage(self.desde_lugar.nombre, self.hacia_lugar.nombre)
        super(Tramo, self).save(*args, **kwargs)

    @property
    def origen(self):
        return self.desde_lugar.nombre

    @property
    def destino(self):
        return self.hacia_lugar.nombre

    def __str__(self):
        return self.desde_hacia

    def __unicode__(self):
        return u'%s' % self.desde_hacia

    def get_absolute_url(self):
        return reverse('transporte_tramo_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_tramo_update', args=(self.slug,))


class Cotizacion(models.Model):
    # Fields
    nombre = models.CharField(max_length=100)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True, overwrite=True)
    fecha_ida = models.DateField(default=date.today)
    fecha_regreso = models.DateField(default=date.today)
    _dias = models.IntegerField(db_column='dias', null=True, blank=True, default=1)
    fecha_vence = models.DateField(default=date(now().year, 12, 31))
    descripcion = models.CharField(default=' - ', max_length=255)
    _kmstotal = models.DecimalField(max_digits=5, decimal_places=1, db_column='kms_total', null=True, blank=True,
                                    default=0)
    _hrstotal = models.DecimalField(max_digits=3, decimal_places=1, db_column='hrs_total', null=True, blank=True,
                                    default=0)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True, default=0)
    utilidad = models.DecimalField(max_digits=6, decimal_places=4, null=True, blank=True, default=0)
    total = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True, default=0)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    itinerario = models.ForeignKey(Itinerario, on_delete=CASCADE, verbose_name='itinerario',
                                   related_name='cotizaciones')
    nivel_de_precio = models.ForeignKey(NivelDePrecio, verbose_name='nivel de precio',
                                        on_delete=models.PROTECT, null=True, blank=True)

    class Meta:
        ordering = ('itinerario__cliente__codigo', '-fecha_ida')
        verbose_name = _('Cotización')
        verbose_name_plural = _('Cotizaciones')

    @property
    def dias(self):
        return (self.fecha_regreso - self.fecha_ida).days + 1

    @dias.setter
    def dias(self, value):
        self._dias = value

    @property
    def is_past_due(self):
        return date.today() > self.fecha_vence

    def __str__(self):
        return str(self.nombre)

    def __unicode__(self):
        return u'%s' % self.nombre

    @property
    def nombre_itinerario(self):
        return self.itinerario.nombre

    @property
    def codigo_cliente(self):
        return self.itinerario.codigo_cliente

    @property
    def kms_total(self):
        kms_agregado = self.tramos.aggregate(kms=Coalesce(Sum('kms'), 0))
        return kms_agregado['kms']

    @kms_total.setter
    def kms_total(self, value):
        self._kmstotal = value

    @property
    def hrs_total(self):
        hrs_agregado = self.tramos.aggregate(hrs=Coalesce(Sum('hrs'), 0))
        return hrs_agregado['hrs']

    @hrs_total.setter
    def hrs_total(self, value):
        self._hrs_total = value

    @property
    def sum_subtotal(self):
        if self.lineas.exists():
            subtotal_agregado = self.lineas.aggregate(subtotal=Coalesce(Sum('costo_total'), 0))
            return subtotal_agregado['subtotal']
        else:
            return 0

    @property
    def sum_total(self):
        if self.lineas.exists():
            total_agregado = self.lineas.aggregate(total=Coalesce(Sum('total'), 0))
            return Decimal(math.ceil(float(total_agregado['total']) / redondeoLps) * redondeoLps).quantize(
                Decimal("0.00"))
        else:
            return 0

    @property
    def sum_utilidad(self):
        if self.lineas.exists():
            subtotal_agregado = self.lineas.aggregate(subtotal=Coalesce(Sum('costo_total'), 0))
            total_agregado = self.lineas.aggregate(total=Coalesce(Sum('total'), 0))
            if total_agregado:
                redondeado = (math.ceil(float(total_agregado['total']) / redondeoLps)) * redondeoLps
                redondeado = Decimal(redondeado).quantize(Decimal("0.00"))
            else:
                redondeado = 0.00
            if redondeado == 0.00:
                return 0.0000
            else:
                utilidad_porcentual = (redondeado - Decimal(subtotal_agregado['subtotal'])) / redondeado
                return Decimal(utilidad_porcentual).quantize(Decimal("0.0000"))
        else:
            return 0

    @property
    def utilidad_valor(self):
        if self.lineas.exists():
            return self.sum_total - self.sum_subtotal
        else:
            return 0

    def save(self, *args, **kwargs):
        elitinerario = Itinerario.objects.get(id=self.itinerario.pk)
        self.nombre = self.nombre.upper()
        self.subtotal = self.sum_subtotal
        self.utilidad = self.sum_utilidad
        self.total = self.sum_total
        if self.itinerario is None:
            self.itinerario = 1
        if self.nombre[:4] != self.itinerario.codigo_cliente:
            self.nombre = self.codigo_cliente + '-' + self.nombre
        if self.nivel_de_precio is None:
            self.nivel_de_precio = self.itinerario.nivel_de_precio
        super(Cotizacion, self).save(*args, **kwargs)
        elitinerario.save()

    def get_absolute_url(self):
        return reverse('transporte_cotizacion_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_cotizacion_update', args=(self.slug,))


class RutaDetalle(models.Model):
    # Fields
    orden = models.IntegerField(null=True, blank=True)
    desde = models.TextField(max_length=100, null=True, blank=True)
    hacia = models.TextField(max_length=100, null=True, blank=True)
    kms = models.DecimalField(max_digits=5, null=True, blank=True, decimal_places=1)
    hrs = models.DecimalField(max_digits=3, null=True, blank=True, decimal_places=1)
    slug = extension_fields.AutoSlugField(populate_from='tramo', blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship fields
    cotizacion = models.ForeignKey(Cotizacion, on_delete=CASCADE, verbose_name='cotizacion', related_name='tramos')
    tramo = models.ForeignKey(Tramo, on_delete=CASCADE, verbose_name='tramo', related_name='rutas')

    class Meta:
        ordering = ('orden',)
        verbose_name = _('Cotización Ruta')
        verbose_name_plural = _('Cotización Rutas')

    def save(self, *args, **kwargs):
        self.kms = self.tramo.kms
        self.hrs = self.tramo.hrs
        self.desde = self.tramo.origen
        self.hacia = self.tramo.destino
        super(RutaDetalle, self).save(*args, **kwargs)

    def __str__(self):
        return str(self.slug)

    def get_absolute_url(self):
        return reverse('transporte_rutadetalle_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_rutadetalle_update', args=(self.slug,))

    def get_delete_url(self):
        return reverse('transporte_rutadetalle_delete', args=(self.slug,))

    def cotizacion_slug(self):
        return self.cotizacion.slug


class CotizacionDetalle(models.Model):
    # Fields
    nombre = models.CharField(max_length=100, null=True, blank=True)
    descripcion = models.CharField(max_length=255, null=True, blank=True)
    cantidad = models.DecimalField(max_digits=10, decimal_places=2)
    costo = models.DecimalField(max_digits=10, decimal_places=2, default=0, editable=False)
    costo_total = models.DecimalField(max_digits=10, decimal_places=2, default=0, editable=False)
    markup = models.DecimalField(max_digits=6, decimal_places=4, default=0, editable=False)
    utilidad = models.DecimalField(max_digits=6, decimal_places=4, default=0, editable=False)
    total = models.DecimalField(max_digits=10, decimal_places=2, default=0, editable=False)
    slug = extension_fields.AutoSlugField(populate_from='forslug', blank=True, overwrite=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    actualizado = models.DateTimeField(auto_now=True, editable=False)

    # Relationship Fields
    cotizacion = models.ForeignKey(Cotizacion, on_delete=CASCADE, verbose_name='cotizacion', related_name='lineas')
    item = models.ForeignKey(Item, verbose_name='item', related_name='item')
    nivel_de_precio = models.ForeignKey(NivelDePrecio, verbose_name='nivel de precio',
                                        on_delete=models.PROTECT, null=True, blank=True)

    class Meta:
        ordering = ('id',)
        verbose_name = _('Cotización Ítem')
        verbose_name_plural = _('Cotización Ítems')

    @property
    def cliente(self):
        return self.cotizacion.codigo_cliente

    @property
    def itinerario(self):
        return self.cotizacion.itinerario

    @property
    def forslug(self):
        return self.cotizacion.nombre + '-' + self.item.slug

    @property
    def precio_redondeado(self):
        precio = Decimal(self.costo) * (1 + Decimal(self.markup))
        return Decimal(math.ceil(float(precio) / redondeoLps) * redondeoLps).quantize(Decimal("0.00"))

    def save(self, *args, **kwargs):
        lacotizacion = Cotizacion.objects.get(id=self.cotizacion.pk)
        
        self.nombre = self.item.nombre
        self.descripcion = self.item.descripcion_venta
        self.costo = self.item.costo
        self.costo_total = self.cantidad * self.costo
        if self.nivel_de_precio is None:
            self.nivel_de_precio = self.cotizacion.nivel_de_precio
        self.markup = Decimal(round(self.nivel_de_precio.factor - 1, 4)).quantize(Decimal("0.0000"))
        self.utilidad = Decimal(self.nivel_de_precio.valor).quantize(Decimal("0.0000"))
        self.total = Decimal(self.costo_total) * (1 + Decimal(self.markup))
        super(CotizacionDetalle, self).save(*args, **kwargs)
        lacotizacion.save()

    @property
    def utilidad_valor(self):
        return self.total - self.costo_total

    def __str__(self):
        return str(self.descripcion)

    def __unicode__(self):
        return u'%s' % self.slug

    def get_absolute_url(self):
        return reverse('transporte_cotizaciondetalle_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_cotizaciondetalle_update', args=(self.slug,))

    def get_delete_url(self):
        return reverse('transporte_cotizaciondetalle_delete', args=(self.slug,))

    def get_cotizacion_url(self):
        return reverse('transporte_cotizacion_detail', args=(self.cotizacion.slug,))

    def cotizacion_slug(self):
        return self.cotizacion.slug


@receiver(post_delete, sender=CotizacionDetalle)
def update_cotizacion_after_delete_cotiaciondetalle(sender, instance, **kwargs):
    lacotizacion = Cotizacion.objects.get(id=instance.cotizacion.pk)
    lacotizacion.save()


@receiver(post_delete, sender=Cotizacion)
def update_itinerario_after_delete_cotizacion(sender, instance, **kwargs):
    elitinerario = Itinerario.objects.get(id=instance.itinerario.pk)
    elitinerario.save()


@receiver(post_delete, sender=Itinerario)
def update_cliente_after_delete_itinerario(sender, instance, **kwargs):
    elcliente = Cliente.objects.get(id=instance.cliente.pk)
    elcliente.save()


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
        ordering = ('-id',)
        verbose_name = 'Vehículo'
        verbose_name_plural = 'Vehículos'

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


class TramoEnVehiculo(models.Model):
    # Fields
    nombre = models.CharField(blank=True, max_length=25, null=True)
    slug = extension_fields.AutoSlugField(populate_from='nombre', blank=True, overwrite=True, editable=False)
    costo = models.DecimalField(blank=True, decimal_places=2, max_digits=8, null=True)

    # Relationship fields
    tramo = models.ForeignKey(Tramo, on_delete=CASCADE, related_name='vehiculos', verbose_name='tramo')
    vehiculo = models.ForeignKey(TipoDeVehiculo, on_delete=CASCADE)

    class Meta:
        ordering = ('tramo',)
        verbose_name = 'Tramo Vehículo'
        verbose_name_plural = 'Tramo Vehículos'
        unique_together = ('tramo', 'vehiculo')

    def __str__(self):
        return str(self.nombre)

    def save(self, *args, **kwargs):
        self.nombre = self.tramo.codigo + ' en ' + self.vehiculo.nombre
        self.costo = self.vehiculo.costo_por_km * Decimal(self.tramo.kms)
        super(TramoEnVehiculo, self).save()

    def get_absolute_url(self):
        return reverse('transporte_tramoenvehiculo_detail', args=(self.slug,))

    def get_update_url(self):
        return reverse('transporte_tramoenvehiculo_update', args=(self.slug,))
