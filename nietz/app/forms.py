#!/usr/bin/env python
# encoding: utf-8
from django import forms
from app.models import Category
from app.models import Game
from django.conf import settings


class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['name', ]


class GameForm(forms.ModelForm):
    class Meta:
        model = Game
        exclude = ['ctime']

    def clean(self):
        cleaned_data = super(GameForm, self).clean()
        active_flag = cleaned_data.get("active")
        if active_flag:
            rotation_num = getattr(settings, "ROTATION_NUM", 5)
            db_active_num = Game.objects.filter(active=True).count()
            if db_active_num >= rotation_num:
                # raise  forms.ValidationError(u"轮播图数量已经达到上限。") non field error
                msg = u"轮播图数量已经达到上限。"
                self.add_error("active", msg)
        return cleaned_data
