from cProfile import label
from dataclasses import fields
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, forms
from .models import Comentario


class ComentarioForm(forms.ModelForm):
    class Meta:
        model = Comentario
        fields = [
            #'autor',
            'contenido',
        ]
        labels = {
            'contenido': 'Añadir un comentario',
        }

    