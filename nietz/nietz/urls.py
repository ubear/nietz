from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'nietz.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'app.views.index', name='index'),
    url(r'^app/', include('app.urls'))
)

if settings.DEBUG:
    urlpatterns += patterns('',
                (r'^img/(?P<path>.*)$',
                'django.views.static.serve',
                {'document_root': settings.MEDIA_ROOT})
                )


