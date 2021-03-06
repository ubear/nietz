# encoding=utf-8
from django.shortcuts import render
from .models import Game
from .models import Category
from django.shortcuts import get_object_or_404
from django.conf import settings
from django.http import  HttpResponseRedirect
from django.http import  HttpResponse
from django.core.paginator import Paginator
from django.core.paginator import EmptyPage
from django.core.paginator import PageNotAnInteger
from .forms import CategoryForm
from .forms import GameForm
from django.core.urlresolvers import reverse
import json


def index(request):
    page_num = getattr(settings, 'PAGE_MAX_NUM', 5)
    games = Game.objects.all()
    paginator = Paginator(games, page_num)
    page = request.GET.get('page')
    rotations = [game for game in games if game.active]
    try:
        games = paginator.page(page)
    except PageNotAnInteger:
        games = paginator.page(1)
    except EmptyPage:
        games = paginator.page(paginator.num_pages)
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
    if 'g_id' in request.POST:
        g_id = int(request.POST['g_id'])
        game = get_object_or_404(Game, pk=g_id)
        if not game.active:
            current_num = Game.objects.filter(active=True).count()
            if current_num >= rotation_num:
                result = {"msg": u"已经达到数量上限，无法增加轮播游戏。", "error": 1}
            else:
                game.active = True
                game.save()
                result = {"msg": u"成功添加轮播游戏。", "error": 0}
        return HttpResponse(json.dumps(result))


def unstar(request):
	if 'g_id' in request.POST:
		g_id = int(request.POST['g_id'])
		game = get_object_or_404(Game, pk=g_id)
		if game.active:
			game.active = False
			game.save()
			result = {"msg": u"成功取消轮播游戏。", "error": 0}
			return HttpResponse(json.dumps(result))


def  category(request):
    if request.method == "POST":
        form = CategoryForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/app/categorylist/")
    else:
        form = CategoryForm()
    return render(request, 'app/category.html', {"form": form})


def game(request):
    if request.method == "POST":
        form = GameForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/app/")
    else:
        form = GameForm()
    return render(request, 'app/game.html', {"form": form})


def game_detail(request, pk):
	game = get_object_or_404(Game, pk=pk)
	return render(request, 'app/game_detail.html', {"game": game})
