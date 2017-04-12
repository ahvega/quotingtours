# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2017-02-14 23:44
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('transporte', '0007_auto_20170214_1139'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tramo',
            name='hrs',
        ),
        migrations.RemoveField(
            model_name='tramo',
            name='kms',
        ),
        migrations.AddField(
            model_name='tramo',
            name='_descricpion',
            field=models.CharField(blank=True, db_column='descripcion', max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='tramo',
            name='_hrs',
            field=models.DecimalField(blank=True, db_column='hrs', decimal_places=1, max_digits=4, null=True),
        ),
        migrations.AddField(
            model_name='tramo',
            name='_kms',
            field=models.IntegerField(blank=True, db_column='kms', null=True),
        ),
    ]
