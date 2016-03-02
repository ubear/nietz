# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='name',
            field=models.CharField(unique=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='game',
            name='download',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='game',
            name='name',
            field=models.CharField(max_length=255),
        ),
    ]
