# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2017-02-15 00:51
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('transporte', '0009_remove_tramo_nombre'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='tramo',
            unique_together=set([('desde_lugar', 'hacia_lugar')]),
        ),
    ]
