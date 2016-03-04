from django.shortcuts import render
from .models import Game
from .models import Category
from django.shortcuts import get_object_or_404
from django.conf import settings
from django.http import  HttpResponseRedirect
from django.http import  HttpResponse
import json
# Create your views here.


def index(request):
    games = Game.objects.all()
    rotations = [game for game in games if game.active]
    content = {"games": games, "rotations": rotations}
    return render(request, 'app/index.html', content)


def categorylist(request):
	categories = Category.objects.all()
	return render(request, 'app/categorylist.html', {"categories": categories})


# rotation game list
def rolllist(request):
	rotations = Game.objects.filter(active=True)
	return render(request, 'app/rolllist.html', {"rotations": rotations})


def star(request):
	rotation_num = getattr(settings, "ROTATION_NUM", 5)
	pass


def unstar(request):
	if 'g_id' in request.POST:
		g_id = int(request.POST['g_id'])
		game = get_object_or_404(Game, pk=g_id)
		if game.active:
			game.active = False
			game.save()
			result = {"msg": "OK", "error": 0}
			return HttpResponse(json.dumps(result))
		else:
			pass


def  category_detail(request, id):
	pass


def game_detail(request, pk):
	game = get_object_or_404(Game, pk=pk)
	return render(request, 'app/game_detail.html', {"game": game})