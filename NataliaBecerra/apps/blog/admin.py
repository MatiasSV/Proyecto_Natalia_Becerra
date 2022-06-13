from django.contrib import admin
from . import models
# Register your models here.

admin.site.register(models.Categoria)

@admin.register(models.Post)
class Autor(admin.ModelAdmin):
    list_display = ('titulo', 'id', 'estado', 'slug')
    prepopulated_fields = {'slug': ('titulo',), }

@admin.register(models.Comentario)
class Comentario(admin.ModelAdmin):
    list_display = ("post",  "autor", "contenido")
    

 