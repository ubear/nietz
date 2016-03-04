#!/usr/bin/env python
# encoding: utf-8
from django.forms import ModelForm
from app.models import Category
from app.models import Game


class CategoryForm(ModelForm):
    class Meta:
        model = Category
        fields = ['name', ]


class GameForm(ModelForm):
	class Meta:
		model = Game
		fields = ['name', 'download', 'logo', 'rotation', 'active', 'category' ]