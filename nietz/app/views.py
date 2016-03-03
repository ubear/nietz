from django.shortcuts import render
from .models import Game
from .models import Category
# Create your views here.


def index(request):
    games = Game.objects.all()
    rotations = [game for game in games if game.active]
    return render(request, 'index.html', {"games": games, "rotations": rotations})
