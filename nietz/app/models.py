from django.db import models

# Create your models here.

class Category(models.Model):
    name = models.CharField(unique=True, max_length=255)
    ctime = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'category'
        ordering = ['ctime']

    def __unicode__(self):
        return self.name


class Game(models.Model):
    name = models.CharField(max_length=255)
    download = models.CharField(max_length=255)
    logo = models.ImageField(upload_to='logo')
    rotation = models.ImageField(upload_to='rotation')
    active = models.BooleanField(default=False)
    category = models.ForeignKey(Category)
    ctime = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'game'
        ordering = ['ctime']

    def __unicode__(self):
        return self.name


