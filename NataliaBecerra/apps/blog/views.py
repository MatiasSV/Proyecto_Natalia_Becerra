from msilib.schema import ListView
from re import template
from sre_constants import SUCCESS
from urllib import request
from webbrowser import get
from django.shortcuts import get_object_or_404, render, redirect
from django import forms
from django.contrib.auth.models import User
from django.urls import reverse_lazy
from django.views.generic import TemplateView, CreateView, UpdateView, DeleteView, DetailView, ListView
from .forms import ComentarioForm
from .models import Comentario, Post

def redirect_to_post(post):
    post = Post
    slug = post.titulo.replace(" ","-").lower()

class Blog(ListView):
    model = Post
    template_name = 'blog/blog.html'

class VerPost(DetailView):
    model = Post
    template_name = 'blog/ver_post.html'

    # def get_object(self):
    #     id = self.kwargs.get('pk')
    #     slug = self.kwargs.get('slug')


class AgregarComentario(CreateView):
    model = Comentario
    form_class = ComentarioForm
    template_name = 'blog/agregar-comentario.html'

    def form_valid(self, form):
        id_usuario = self.request.user.id
        form.instance.autor_id = id_usuario
        form.instance.post_id = self.kwargs['pk']
        return super().form_valid(form)

    success_url = reverse_lazy('blog')






episodios_podcast = 'static/text/episodios_podcast.txt'
def podcast(request):
    lista_episodios = []
    episodios = open(episodios_podcast,"r",encoding="utf-8")
    for i in episodios:
        lista_episodios.append(i)
    episodios.close()
    dict_episodios={"episodios":lista_episodios}
    return render(request,"podcast.html",dict_episodios)


def login(request):
    login_info = request.POST
    



# def agregarComentario(request, pk):
#     post = get_object_or_404(Post, id=pk)
#     if request.method == 'POST':
#         form_comentario = ComentarioForm(request.POST)
#         if form_comentario.is_valid():
#             comentario = form_comentario.save(commit=False)
#             comentario.autor = request.user
#             comentario.save()
#             return redirect('/ver_post', pk=post.id)
#     else:
#         form_comentario = ComentarioForm()
#     return render(request, 'blog/agregar-comentario.html', {'form_comentario': form_comentario})


# def blog(request):
#     posts = Post.objects.all()
#     return render(request, 'blog/blog.html', {'posts': posts})


def ver_post(request, pk):
    ctx={}
    post = Post.objects.filter(id=pk)
    comentarios = Comentario.objects.filter(id=pk)

    ctx={
        'comentario':comentarios,
        'post':post,
    }

    return render(request, 'blog/ver_post.html', ctx)






# class BlogHomePageView(TemplateView):
#     template_name = "blog/blog.html"

#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context["posts"] = Post.postobjects.all()
#         return context


# class PostDetailView(DetailView):
#     model = Post
#     template_name = 'blog/ver_post.html'

#     context_object_name = 'post'

#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         post = Post.objects.filter(slug=self.kwargs.get('slug'))
#         return context
