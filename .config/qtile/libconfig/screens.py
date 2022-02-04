from libqtile import bar
from libqtile.config import Screen
from .widgets import primary_screen


def status_bar(widgets):
    return bar.Bar(widgets, 24)


screens = [Screen(top=status_bar(primary_screen))]
