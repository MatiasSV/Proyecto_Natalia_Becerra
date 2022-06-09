from django.shortcuts import render

episodios_podcast = 'static/text/episodios_podcast.txt'
def podcast(request):
    lista_episodios = []
    episodios = open(episodios_podcast,"r",encoding="utf-8")
    for i in episodios:
        lista_episodios.append(i)
    episodios.close()
    dict_episodios={"episodios":lista_episodios}
    return render(request,"podcast.html",dict_episodios)

