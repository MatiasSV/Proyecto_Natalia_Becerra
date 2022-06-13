# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.


#from django.db import models
#from django.contrib.auth.models import User



#class PostBlog(models.Model):
#    idpost = models.IntegerField(primary_key=True)
#    titulo_post = models.CharField(max_length=200)
#    contenido_post = models.TextField()
#    fecha_post = models.DateTimeField()

    #class Meta:
     #   managed = False
      #  db_table = 'post_blog'


#class ComentarioPost(models.Model):
 #   idcomentario = models.AutoField(primary_key=True)
  #  contenido_comentario = models.TextField()
   # post_blog_idpost = models.ForeignKey('PostBlog', models.PROTECT, db_column='post_blog_idpost')
   # auth_user = models.ForeignKey(User, models.PROTECT)

   # class Meta:
   #     managed = False
   #     db_table = 'comentario_post'


#class Paquete(models.Model):
#    idpaquete = models.IntegerField(primary_key=True)
#    nombre_paquete = models.CharField(max_length=100)
 #   descripcion_paquete = models.TextField()
 #   cantidad_sesiones = models.IntegerField()
 #   valor_paquete = models.IntegerField()

#    class Meta:
#        managed = False
#        db_table = 'paquete'


#class DiaSesion(models.Model):
#    iddia = models.IntegerField(primary_key=True)
#    nombre_dia = models.CharField(max_length=45)

#    class Meta:
#        managed = False
#        db_table = 'dia_sesion'



#class HoraSesion(models.Model):
#    idhora = models.IntegerField(primary_key=True)
#    inicio_fin = models.CharField(max_length=200)

#    class Meta:
#        managed = False
#        db_table = 'hora_sesion'


#class Sesion(models.Model):
#    idsesion = models.AutoField(primary_key=True)
#    dia_sesion_iddia = models.ForeignKey(DiaSesion, models.DO_NOTHING, db_column='dia_sesion_iddia')
#    hora_sesion_idhora = models.ForeignKey(HoraSesion, models.DO_NOTHING, db_column='hora_sesion_idhora')
#    auth_user = models.ForeignKey(User, models.DO_NOTHING)
#    paquete_idpaquete = models.ForeignKey(Paquete, models.DO_NOTHING, db_column='paquete_idpaquete')
#    numero_sesion = models.IntegerField()

#    class Meta:
#        managed = False
#        db_table = 'sesion'



#class Curso(models.Model):
#   idcurso = models.AutoField(primary_key=True)
#    nombre_curso = models.CharField(max_length=205)
#    descripcion_curso = models.TextField()
#    duracion_curso = models.CharField(max_length=105)
#    fecha_publicacion = models.DateField()
#    valor_curso = models.IntegerField(blank=True, null=True)

#    class Meta:
#        managed = False
#        db_table = 'curso'


#class MetodoPago(models.Model):
#    idmetodo_pago = models.IntegerField(primary_key=True)
 #   nombre_metodo_pago = models.CharField(max_length=45)
  #  informacion_metodo_pago = models.TextField(blank=True, null=True)

 #   class Meta:
 #       managed = False
 #       db_table = 'metodo_pago'

        
#class Compra(models.Model):
#    idcompra = models.IntegerField(primary_key=True)
#    auth_user = models.ForeignKey(User, models.DO_NOTHING)
#    fecha_compra = models.DateField()
#    valor_total = models.IntegerField()
#    metodo_pago_idmetodo_pago = models.ForeignKey('MetodoPago', models.DO_NOTHING, db_column='metodo_pago_idmetodo_pago')

#    class Meta:
#        managed = False
#        db_table = 'compra'


#class DetalleCompra(models.Model):
#    iddetalle = models.IntegerField(primary_key=True)
#    compra_idcompra = models.ForeignKey(Compra, models.DO_NOTHING, db_column='compra_idcompra')
#    paquete_idpaquete = models.ForeignKey('Paquete', models.DO_NOTHING, db_column='paquete_idpaquete')
#    curso_idcurso = models.ForeignKey(Curso, models.DO_NOTHING, db_column='curso_idcurso')

#    class Meta:
#        managed = False
#        db_table = 'detalle_compra'
#        unique_together = (('iddetalle', 'compra_idcompra'),)





#class NewsLetter(models.Model):
#    idnews_letter = models.AutoField(primary_key=True)
#    asunto_news_letter = models.CharField(max_length=200)
#    contenido_news_letter = models.TextField()

#    class Meta:
#        managed = False
#        db_table = 'news_letter'


#class SuscripcionNewsletter(models.Model):
#    idsuscripcion_newsletter = models.AutoField(primary_key=True)
#    nombre = models.CharField(max_length=150)
#    correo = models.CharField(max_length=150)

#    class Meta:
#        managed = False
#        db_table = 'suscripcion_newsletter'


#class NewsletterPorSuscripcionnewsletter(models.Model):
#    news_letter_idnews_letter = models.OneToOneField(NewsLetter, models.DO_NOTHING, db_column='news_letter_idnews_letter', primary_key=True)
#    suscripcion_newsletter_idsuscripcion_newsletter = models.ForeignKey('SuscripcionNewsletter', models.DO_NOTHING, db_column='suscripcion_newsletter_idsuscripcion_newsletter')

#    class Meta:
#        managed = False
#        db_table = 'newsletter_por_suscripcionnewsletter'
#        unique_together = (('news_letter_idnews_letter', 'suscripcion_newsletter_idsuscripcion_newsletter'),)





