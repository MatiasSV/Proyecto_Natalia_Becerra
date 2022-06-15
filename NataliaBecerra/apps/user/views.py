from django.shortcuts import render
from django.views import generic
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.urls import reverse_lazy
from .forms import RegistroForm, EditarPerfilForm

# Create your views here.

class RegistroUsuario(generic.CreateView):
    form_class = RegistroForm
    template_name = 'registration/register.html'
    success_url = reverse_lazy('login')

class EditarPerfil(generic.UpdateView):
    form_class = EditarPerfilForm
    template_name = 'registration/edit_profile.html'
    success_url = reverse_lazy('home')

    def get_object(self):
        return self.request.user

def iniciarsesion(request):
    print(request.POST)