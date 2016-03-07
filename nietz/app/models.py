# encoding=utf-8
from django.db import models
from django_thumbs.db.models import ImageWithThumbsField

# Create your models here.

class Category(models.Model):
    name = models.CharField(unique=True, max_length=255, verbose_name=u"分类名")
    ctime = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'category'
        ordering = ['-ctime']
        verbose_name = u"游戏类别"

    def __unicode__(self):
        return self.name


class Game(models.Model):
    name = models.CharField(max_length=255, verbose_name=u"游戏名")
    download = models.CharField(max_length=255, verbose_name=u"下载地址")
    # logo = models.ImageField(upload_to='logo')
    logo = ImageWithThumbsField(upload_to='thumbs', sizes=((40, 40), (140, 140)), verbose_name=u"Logo标志图")
    rotation = ImageWithThumbsField(upload_to='rotation', sizes=((800, 200), ), verbose_name=u"轮播图")
    active = models.BooleanField(default=False, verbose_name=u"是否轮播")
    category = models.ForeignKey(Category, verbose_name="游戏分类")
    ctime = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'game'
        ordering = ['-ctime']
        verbose_name = u"游戏"

    def __unicode__(self):
        return self.name
