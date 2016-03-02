# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=256)),
                ('ctime', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'ordering': ['ctime'],
                'db_table': 'category',
            },
        ),
        migrations.CreateModel(
            name='Game',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=256)),
                ('download', models.CharField(max_length=256)),
                ('logo', models.ImageField(upload_to=b'logo')),
                ('rotation', models.ImageField(upload_to=b'rotation')),
                ('active', models.BooleanField(default=False)),
                ('ctime', models.DateTimeField(auto_now_add=True)),
                ('category', models.ForeignKey(to='app.Category')),
            ],
            options={
                'ordering': ['ctime'],
                'db_table': 'game',
            },
        ),
    ]
