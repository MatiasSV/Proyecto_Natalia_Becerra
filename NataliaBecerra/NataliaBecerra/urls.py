from django.contrib import admin
from django.urls import path, include
from django.contrib.auth.views import TemplateView 
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import TemplateView
from apps.blog.views import podcast

urlpatterns = [

    # URLS DE NAVEGACION EN LA PÁGINA (modulos directos que no necesitan una app)
    path('admin/', admin.site.urls),
    path('', TemplateView.as_view(template_name='index.html'), name='home'),
    path('preguntasfrecuentes/', TemplateView.as_view(template_name='preguntasfrecuentes.html'), name='preguntasfrecuentes'), 
    path('servicios/', TemplateView.as_view(template_name='servicios.html'), name='servicios'),
    path('podcast/',podcast, name="podcast"),
    path('sobre_mi/' , TemplateView.as_view(template_name='sobre_mi.html'), name='sobre_mi'),

    # INCLUSION DE LAS URLS CORRESPONDIENTES A LAS APLICACIONES DEL PROYECTO
    path('', include('apps.blog.urls')),
    path('usuario/', include('django.contrib.auth.urls')),
    path('usuario/', include('apps.user.urls')),



    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
