from django.conf.urls import url

from . import views


urlpatterns = [
        url(r'^$', views.index, name='index'),
        url(r'^game/(?P<pk>[0-9]+)/$', views.game_detail, name='game_detail'),
        url(r'^categorylist/$', views.categorylist, name='categorylist'),
        url(r'^rolllist/$', views.rolllist, name='rolllist'),
        url(r'^unstar/$', views.unstar, name='unstar'),
        url(r'^star/$', views.star, name='star'),
]
