from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class PostBlog(models.Model):
    idpost = models.IntegerField(primary_key=True)
    titulo_post = models.CharField(max_length=200)
    contenido_post = models.TextField()
    fecha_post = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'post_blog'


class ComentarioPost(models.Model):
    idcomentario = models.AutoField(primary_key=True)
    contenido_comentario = models.TextField()
    post_blog_idpost = models.ForeignKey('PostBlog', models.DO_NOTHING, db_column='post_blog_idpost')
    auth_user = models.ForeignKey(User, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'comentario_post'