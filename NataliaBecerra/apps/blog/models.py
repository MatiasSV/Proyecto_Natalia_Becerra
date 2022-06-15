from enum import unique
from tokenize import blank_re
from django.db import models
from django.forms import SlugField
from django.utils import timezone
from django.contrib.auth.models import User
from ckeditor.fields import RichTextField

# Create your models here.


class Categoria(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre

class Post(models.Model):

    class PostObjects(models.Manager):
        def get_queryset(self):
            return super().get_queryset().filter(estado='publicado')

    opciones = (
        ('borrador', 'Borrador'),
        ('publicado', 'Publicado')
    )

    categoria = models.ForeignKey(Categoria, on_delete=models.PROTECT, default=1)
    titulo = models.CharField(max_length=255)
    resumen = models.TextField(null=True)
    contenido = RichTextField(blank=True,null=True)
    slug = models.SlugField(max_length=250, unique_for_date='fecha', null=False, unique=True)
    fecha = models.DateTimeField(default=timezone.now)
    estado = models.CharField(max_length=10, choices=opciones, default='borrador')
    objects =models.Manager()
    postobjects = PostObjects() 

    class Meta:
        ordering = ('-fecha',)
    
    def __str__(self):
        return self.titulo

class Comentario(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name="comentarios")
    autor = models.ForeignKey(User, on_delete=models.CASCADE)
    contenido = models.TextField()
    fecha = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering= ("-fecha",)



    





# class PostBlog(models.Model):
#     idpost = models.AutoField(primary_key=True)
#     titulo_post = models.CharField(max_length=200)
#     contenido_post = models.TextField()
#     fecha_post = models.DateTimeField()

#     class Meta:
#         managed = False
#         db_table = 'post_blog'

#     def publish(self):
#             self.fecha_post = timezone.now()
#             self.save()

#     def __str__(self):
#             return self.titulo_post



# class ComentarioPost(models.Model):
#     idcomentario = models.AutoField(primary_key=True)
#     contenido_comentario = models.TextField()
#     post_blog_idpost = models.ForeignKey('PostBlog', on_delete=models.PROTECT, db_column='post_blog_idpost')
#     auth_user = models.ForeignKey(User, on_delete=models.PROTECT)

#     class Meta:
#         managed = False
#         db_table = 'comentario_post'

    
#     def __str__(self):
#             return self.post_blog_idpost.titulo_post    