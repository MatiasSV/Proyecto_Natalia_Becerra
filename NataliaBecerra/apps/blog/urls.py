from django.urls import path, include, re_path
from .views import Blog, VerPost, AgregarComentario
from . import views



urlpatterns = [

    path('blog/', Blog.as_view(), name='blog'),
    path('blog/<int:pk>/', VerPost.as_view(), name='ver_post'),
    path('blog/<int:pk>/comentario/', AgregarComentario.as_view(), name='agregar_comentario'),


]
