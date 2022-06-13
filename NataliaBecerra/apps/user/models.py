from distutils.command import upload
from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Perfil(models.Model):
    usuario = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    fotoPerfil = models.ImageField(null=True, blank=True, upload_to="img/fotoPerfil")

    def __str__(self):
        return self.usuario.username