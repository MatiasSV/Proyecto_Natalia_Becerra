from django.urls import path, include, re_path
from . import views
from .views import RegistroUsuario, EditarPerfil



urlpatterns = [
    path('registro/', RegistroUsuario.as_view(), name="register"),
    path('editar_prfil/', EditarPerfil.as_view(), name="edit_profile"),
]
